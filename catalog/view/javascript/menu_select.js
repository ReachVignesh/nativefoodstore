$(function(){
    var url = window.location.href,
    urlRegExp = new RegExp(url.replace(/\/$/,'') + "$");
    $(".topMenu > li > a").each(function(){
      if(url.indexOf($(this).attr("href")) > -1){
        $(".topMenu li a.active").removeClass("active");
        $(this).addClass("is-checked");
        $(this).addClass("active");
      }
    })
  });