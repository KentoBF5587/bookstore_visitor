class QuestionsController < ApplicationController
  skip_before_action :require_login, only: %i[index create result]

  def index
    @questions = Question.all
  end

  def create
    answers = answer_params

    @result_points = Hash.new(0)

    answers.each do |index, answer|
      if answer !='true' && answer !='false'
        flash[:danger] = t('.failure')
        return redirect_to questions_path
      end

      question_points = QuestionPoint.where(question_id: index.to_i, answer: answer)
      question_points.each do |question_point|
        @result_points[question_point.result_id] += question_point.point
      end
    end

    max_result_ids = @result_points.sort_by { |_id, points| points }.reverse.to_h.keys

    if max_result_ids.size > 1 && @result_points[max_result_ids[0]] == @result_points[max_result_ids[1]]
      max_result_ids = max_result_ids.select { |id| @result_points[id] == @result_points[max_result_ids[0]] }
      max_result_id = max_result_ids.sample
    else
      max_result_id = max_result_ids[0]
    end
    @your_result = Result.find(max_result_id)
    session[:result_id] = @your_result.id
    redirect_to result_questions_path(your_result_id: max_result_id)
  end

  def result
    your_result_id = session[:result_id]
    if your_result_id
      @your_result = Result.find_by(id: your_result_id)
      if @your_result.nil?
        redirect_to root_path, danger: t('.failure')
      end
      session.delete(:result_id)
    else
      redirect_to root_path, danger: t('.failure')
    end
  end

  private

  def answer_params
    params.require(:answers)
  end
end
