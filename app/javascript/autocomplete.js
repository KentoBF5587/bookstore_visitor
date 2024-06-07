function initialize() {
document.addEventListener('DOMContentLoaded', function() {

    let inputName = document.getElementById('Name');
    let inputAddress = document.getElementById('Address');
    
    let options = {
        types: ['establishment'],
        componentRestrictions: { country: 'JP'},
    };
    
    let autocompleteName = new google.maps.places.Autocomplete(inputName, options);
    let autocompleteAddress = new google.maps.places.Autocomplete(inputAddress, options);

    autocompleteName.addListener('place_changed', function() {
        let place = autocompleteName.getPlace();
        inputName.value = place.name;
        inputAddress.value = place.formatted_address;
    });

    autocompleteAddress.addListener('place_changed', function() {
        let place = autocompleteAddress.getPlace();
        inputName.value = place.name;
        inputAddress.value = place.formatted_address;
    });
});
}