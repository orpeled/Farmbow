/**
 * Created with JetBrains RubyMine.
 * User: orpeled
 * Date: 4/20/13
 * Time: 9:28 PM
 * To change this template use File | Settings | File Templates.
 */
$('.progress').addClass('active');
var progress = setInterval(function() {
    var $bar = $('.bar');

    if ($bar.width()==400) {
        clearInterval(progress);

    } else {
        $bar.width($bar.width()+40);
    }
    $bar.text($bar.width()/4 + "%");
}, 800);
$('a.btn.btn-mini.btn-primary').addClass('active');
$('a.btn.btn-mini.btn-primary').fadeOut(3000)

