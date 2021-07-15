$(function() {
    var botones = $(".sidebar-menu a");
    botones.click(function() {
        botones.removeClass('active');
        $(this).addClass('active');
    });
});