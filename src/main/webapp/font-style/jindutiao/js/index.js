// Test code
$('.progress').each(function (_, progress) {
    var steps = $('> div.right > div', progress);
    steps.each(function (i, el) { return $(el).mouseenter(function (e) { return onHover(el); }); });
    var onHover = function (el) {
        steps.removeClass(['current', 'prev']);
        el.classList.add('current');
        $(el).prevAll().slice(1).addClass('prev');
    };
});