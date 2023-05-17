
    var slideIndex;
    function showSlides() {
            var i;
    var slides = document.getElementsByClassName("mySlides");
    var dots = document.getElementsByClassName("dot");
    for (i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";  
            }
    for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace("active", "");
            }

    slides[slideIndex].style.display = "block";
    dots[slideIndex].className += " active";
    //chuyển đến slide tiếp theo
    slideIndex++;
            //nếu đang ở slide cuối cùng thì chuyển về slide đầu
            if (slideIndex > slides.length - 1) {
        slideIndex = 0
    }
            //tự động chuyển đổi slide sau 6s
    setTimeout(showSlides, 6000);
        }
    //mặc định hiển thị slide đầu tiên 
    showSlides(slideIndex = 0);
    function currentSlide(n) {
        showSlides(slideIndex = n);
        }
