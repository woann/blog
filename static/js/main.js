$('.search-show').bind('click', function() {
        $(this).find('.fa').toggleClass('fa-remove');
        $('.site-search').toggleClass('search-on')
        if ($('.site-search').hasClass('search-on')) {
            $('.site-search').find('input').focus()
            $('.site-search').removeClass('m-nav-show')
        }
})
