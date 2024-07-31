// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "./map"
import "./autocomplete"
import * as bootstrap from "bootstrap"

console.log("JavaScript file");
document.addEventListener("DOMContentLoaded", () => {
    let currentQuestion = 1;
    const totalQuestions = 6;

    const startButton = document.getElementById('start-questions');
    const startDescription = document.getElementById('start-description');

    startButton.addEventListener('click', () => {
        startButton.classList.add('d-none');
        startDescription.classList.add('d-none');

        document.getElementById(`question_${currentQuestion}`).classList.remove('d-none');
        updateButtonVisibility();
    });

    function updateButtonVisibility() {
        document.getElementById(`next_button`).classList.toggle('d-none', currentQuestion >= 6);
        document.getElementById(`previous_button`).classList.toggle('d-none', currentQuestion <= 1);
        document.getElementById(`submit-button`).classList.toggle('d-none', currentQuestion !== 6);
    }

    
    document.addEventListener('click', (event) => {

        if (event.target.dataset.action === 'next-question') {

            const selectedAnswer = document.querySelector(`input[data-question-id="${currentQuestion}"]:checked`);

            if(!selectedAnswer) {
                document.getElementById(`error_message`).classList.remove('d-none');
                return;
            } else {
                document.getElementById(`error_message`).classList.add('d-none');
            }

            document.getElementById(`question_${currentQuestion}`).classList.add('d-none');
            currentQuestion++;
            document.getElementById(`question_${currentQuestion}`).classList.remove('d-none');
            const selectRadio = document.querySelector(`input[data-question-id="${currentQuestion}"]:checked`);
            updateButtonVisibility();
        } else if (event.target.dataset.action === 'previous-question') {
            document.getElementById(`question_${currentQuestion}`).classList.add('d-none');
            currentQuestion--;
            document.getElementById(`question_${currentQuestion}`).classList.remove('d-none');
            const selectedRadio = document.querySelector(`input[data-question-id="${currentQuestion}"]:checked`);
            updateButtonVisibility();
        }

        if (event.target.id === 'submit-button') {
            const lastQuestionAnswerSelected = document.querySelector(`input[data-question-id="6"]:checked`);

            if (!lastQuestionAnswerSelected) {

                document.getElementById(`error_message`).classList.remove('d-none')
                event.preventDefault();
                return;
            } else {
                document.getElementById(`error_message`).classList.add('d-none');
            }
        }
    });
});