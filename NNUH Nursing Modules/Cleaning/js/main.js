// When the user clicks on div, open the popup
function myFunction() {
    var popup = document.getElementById("myPopup");
    popup.addEventListener('click',function(event){
        event.preventDefault
        
    })
    popup.classList.toggle("show");
  }