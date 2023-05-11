$(document).ready(function(){
    
    var h = $(window).height(), w = $(window).width();
    $(window).load(function(){

        var nh = $(window).height(), nw = $(window).width();
        h = nh; w = nw;
        
        
        
        if($(window).width() === 480 && $(window).height() === 800) {
            $("body").addClass( "size480x800");
            $("body").removeClass( "size640x1136");
            $("body").removeClass( "size768x1024" );

        }
        if($(window).width() === 640 && $(window).height() === 1136) {
            $("body").addClass( "size640x1136" );
            $("body").removeClass( "size480x800" );
            $("body").removeClass( "size768x1024" );
        } 
        if($(window).width() === 768 && $(window).height() === 1024) {
            $("body").addClass( "size768x1024" );
            $("body").removeClass( "size480x800" );
            $("body").removeClass( "size640x1136");
        }
                
    });
    
    $('.cb-value').click(function() {
      var mainParent = $(this).parent('.toggle-btn');
      if($(mainParent).find('input.cb-value').is(':checked')) {
        $(mainParent).addClass('active');
      } else {
        $(mainParent).removeClass('active');
      }

    });
    
    /*product filter*/
    var dropdown = document.getElementsByClassName("dropdown-btn");
    var i;

    for (i = 0; i < dropdown.length; i++) {
      dropdown[i].addEventListener("click", function() {
      this.classList.toggle("active");
      var dropdownContent = this.nextElementSibling;
      if (dropdownContent.style.display === "block") {
      dropdownContent.style.display = "none";
      } else {
      dropdownContent.style.display = "block";
      }
      });
    }
    

})

