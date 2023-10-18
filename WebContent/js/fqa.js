$(function(){
  $('.accordion-item .title').click(function(){
    var $content = $(this).next('.content');
        
    if ($content.is(':animated')) {
      return; // 애니메이션 중에는 클릭 무시
    }

    if ($content.is(':visible')) {
      $content.slideUp(300);
      $(this).removeClass('active');
    } else {
      // 모든 .content 닫기
      $('.accordion-item .content').slideUp(300);
      $('.accordion-item .title').removeClass('active');
      $content.slideDown(300);
      $(this).addClass('active');
    }
  })
})
