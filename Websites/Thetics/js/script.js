$(document).ready(function () {
    const client_id = 'client_id=ae46ac6d37a4b48ce7481c1db899695e7d2896f495e40f476ea64f6dcfcdbde3';

    const API = 'https://api.unsplash.com/';

    // Random Photo Ajax Call

    let randomPhoto = API + 'photos/random/?' + client_id;

    $("#newRB").click(function () {
        $.getJSON(randomPhoto, function (response) {
            let randomPhoto2 = response.urls.regular;
            let randomTitle = response.location.title;
            let download = response.links.download + "?force=true";


            document.getElementById('preview').src = randomPhoto2;
            document.getElementById('randomTitle').innerHTML = randomTitle;

            console.log(randomTitle);
        })
    });

    // Search for Photos

    let searchPhoto = API + '/search/photos?' + client_id + '&page=1&query=office';

    console.log(searchPhoto);







}); /* End of Script */