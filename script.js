var digits = new Array();
var calc = '';
var iTotal;

$(function () {

    $('td').on('click', function () {

        if ($(this).html() == '=') {

            for (var i = 0; i < digits.length; i++) {

                if (digits[i] === '÷'){
                    digits[i] = '/';
                } else if (digits[i] === 'x'){
                    digits[i] = '*';
                }

                calc += digits[i];
            }
            
            iTotal = eval(calc);
            $('input').attr('value', iTotal);

            digits = [iTotal];

        } else if ($(this).html() == 'C') {
            digits = [];
            $('input').attr('value', '0');
            
        } else {
            digits.push($(this).html());

            for (var i = 0; i < digits.length; i++) {
                calc += digits[i];
            }
            $('input').attr('value', calc);

        }

        calc = '';
    });
    
});