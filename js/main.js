(function() {
    $(document).ready(function() {
        $('.term h4').click(function() {
            $(this).parent().find('.definition').slideToggle("fast");
        });
    });
})();