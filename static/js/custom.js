$(document).ready(function(){
    $('#header-carousel').owlCarousel({
      items : 1,
      loop : true,
      autoplay:true,
      autoplayTimeout:2000,
    });
  })

  $(document).ready(function(){
    $('#detail_carousel').owlCarousel({
      items : 1,
      loop : true,
    });
  })



  // left Sidebar 
document.getElementById('mySidenav').addEventListener('click', closeNav);
// Sidebar
function openNav() {
  document.getElementById("mySidenav").style.width = "300px";
  //document.body.style.backgroundColor = "rgba(0,0,0,0.4)";
}

function closeNav() {
  document.getElementById("mySidenav").style.width = "0";
  //document.body.style.backgroundColor = "white";
}

function closeBtn() {
  document.getElementById("e_message").style.display = "none";
}