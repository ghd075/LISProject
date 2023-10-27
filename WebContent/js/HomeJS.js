/* 광고 자리 */

$(function() {
	// Get the current year for the copyright
	$('#year').text(new Date().getFullYear());

	$('.slider').slick({
		infinite: true,
		slideToShow: 1,
		slideToScroll: 1
	});
});

/* 캐러셀 */
$('.carousel.carousel-multi .carousel-item').each(function() {
	var next = $(this).next();
	if (!next.length) {
		next = $(this).siblings(':first');
	}
	next.children(':first-child').clone().attr("aria-hidden", "true").appendTo($(this));

	if (next.next().length > 0) {
		next.next().children(':first-child').clone().attr("aria-hidden", "true").appendTo($(this));
	}
	else {
		$(this).siblings(':first').children(':first-child').clone().appendTo($(this));
	}
});

/* 광고자리 */
$(function() {
	// Get the current year for the copyright
	$('#year').text(new Date().getFullYear());

	$('.slider').slick({
		infinite: true,
		slideToShow: 1,
		slideToScroll: 1
	});
});

/* 검색 */
$(function() {
	$('#search').click(function() {
		//console.log("체킁:","http://localhost:81/LibsPro/book/SearchResult.do?query=" + $("#bookName").val());
		//location.href = "http://localhost:81/LibsPro/book/SearchResult.do?query=" + $("#bookName").val();
		 performSearch();
	})
	
    // 엔터 키를 눌렀을 때 검색 실행
    $('#bookName').keydown(function(event) {
        if (event.keyCode === 13) { // 엔터 키를 눌렀을 때
            performSearch();
        }
    });
	
	function performSearch() {
		console.log("체킁:","http://localhost:81/LibsPro/book/SearchResult.do?query=" + $("#bookName").val());
		location.href = contextPath + "book/SearchResult.do?query=" + $("#bookName").val();
	}
});

/* 추천도서 누르면 bookDetail 페이지로 이동 */
$(function() {
	$('.card').click(function() {
		location.href = contextPath + "book/SearchResult.do?query=" + $(this).find('#book-title').text();
	})
});

