$(function () {
    var data = new Date();
    var mesAtual = data.getMonth() + 1;
    var diaAtual = data.getDate();

    document.querySelector('#inputMes').selectedIndex = mesAtual - 1;

    fnAlterMonth("mes_" + mesAtual);

    $('#mes_' + mesAtual).show().find('.dia_' + diaAtual).addClass('atual');
    $('#mes_' + mesAtual).show()

    function hideShow() {
        if (mesAtual > 12) {
            mesAtual = 1;
        } else if (mesAtual < 1) {
            mesAtual = 12;
        }

        $('.mes').show();
        $('#mes_' + mesAtual).show();
    }
});

function fnAlterMonth(val) {
    document.querySelectorAll('tbody').forEach(x => {
        x.style.display = 'none';
    });

    var ind = document.querySelector('#inputMes').selectedIndex + 1; // +1 pois comeca do 0

    document.querySelector('#' + val).style.display = 'contents';
    document.querySelector('#label_periodo').innerHTML = 'períodos de solicitações para o mês de ' + document.getElementById("inputmes_" + ind).innerHTML;

    $('tbody').removeClass('mesAtual');
    $('#' + val).addClass('mesAtual');
}

function selectDays(color = 'white', bc = '#e87711', border = 'none') {
    let de = parseInt(document.querySelector('#inputDiaDe').value);
    let ate = parseInt(document.querySelector('#inputDiaAte').value);
    let calendario = document.querySelectorAll('.mesAtual tr td');
    let inputPeriodoRadio;
    let periodoChecked;
    let progress = document.querySelector('#progress-bar-periodo');

    if (de > ate) {
        alert('Data inicial não pode ser maior que a data final');
        document.querySelector('#inputDiaAte').focus();
        return false;
    }

    document.querySelectorAll('input[name=inputPeriodoRadio]').forEach(x => {
        if (x.checked) {
            inputPeriodoRadio = x.value;
        }
    });

    progress.style.width = '66%';
    $('#progress-bar-periodo').attr({ 'aria-valuenow': "66" })

    if (inputPeriodoRadio == 'periodo1') {
        document.querySelector('#radio-periodo2').checked = true;

    } else if (inputPeriodoRadio == 'periodo2') {
        bc = 'none';
        color = '#5e5d5b';
        border = 'solid 1px #e8730c';
        progress.style.width = '100%';
        $('#progress-bar-periodo').attr({ 'aria-valuenow': "100" })
        document.querySelector('#radio-periodo3').checked = true;

    } else if (inputPeriodoRadio == 'periodo3') {
        bc = '#fdca9f'
        border = 'solid 1px #e8730c';
    }

    calendario.forEach((x) => {
        let day = parseInt(x.innerHTML);

        if (day >= de && day <= ate) {
            x.style.backgroundColor = bc;
            x.style.color = color;
            x.style.border = border;
        }
    })

    if (inputPeriodoRadio == 'periodo3') {
        progress.style.width = '100%';
        $('#progress-bar-periodo').attr({ 'aria-valuenow': "100" })

        let ind = document.querySelector('#inputMes').selectedIndex + 1; // +1 pois comeca do 0
        let cMes = document.getElementById("inputmes_" + ind).innerHTML

        document.querySelector('#label_periodo').innerHTML = 'Os periodos de solicitações para o mês de ' + cMes + " foram definidos";
        document.querySelector("#periodo-radio").style.display = 'none';

        document.querySelector('#acabou-periodo').text = 'redefinir os períodos de ' + cMes;
        document.querySelector("#acabou-periodo").style.display = 'block';

    }

}

