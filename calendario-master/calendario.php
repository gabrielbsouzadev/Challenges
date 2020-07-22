<?php
function num($num)
{
    return ($num < 10) ? '0' . $num : $num;
}

function diasMeses()
{
    $retorno = array();

    for ($i = 1; $i <= 12; $i++) {
        $retorno[$i] = cal_days_in_month(CAL_GREGORIAN, $i, date('Y'));
    }

    return $retorno;
}

function montaCalendario()
{
    $daysWeek = array(
        'Sun',
        'Mon',
        'Tue',
        'Wed',
        'Thu',
        'Fri',
        'Sat'
    );
    $diasSemana = array(
        'Dom',
        'Seg',
        'Ter',
        'Qua',
        'Qui',
        'Sex',
        'Sab'
    );

    $arrayMes = array(
        1 => 'Janeiro',
        2 => 'Fevereiro',
        3 => 'Março',
        4 => 'Abril',
        5 => 'Maio',
        6 => 'Junho',
        7 => 'Julho',
        8 => 'Agosto',
        9 => 'Setembro',
        10 => 'Outubro',
        11 => 'Novembro',
        12 => 'Dezembro'
    );

    $diasMeses = diasMeses();
    $arrayRetorno = array();

    for ($i = 1; $i <= 12; $i++) {
        $arrayRetorno[$i] = array();
        for ($n = 1; $n <= $diasMeses[$i]; $n++) {
            $dayMonth = gregoriantojd($i, $n, date('Y'));
            $weekMonth = substr(jddayofweek($dayMonth, 1), 0, 3);
            if ($weekMonth == 'Mun') $weekMonth = 'Mon';
            $arrayRetorno[$i][$n] = $weekMonth;
        }
    }

    echo '<table border="0" width="100%">';
    foreach ($arrayMes as $num => $mes) {

        echo '<tbody id="mes_' . $num . '" class="mes">';
        //echo '<tr class="mes_title"><td colspan="7">' . $mes . '</td></tr>';
        echo '<tr class="dias_title">';
        foreach ($diasSemana as $i => $day) {
            if ($diasSemana[$i] == 'Sab' || $diasSemana[$i] == "Dom") {
                echo '<td style="color: #83807b">' . $day . '</td>';
            } else {
                echo '<td>' . $day . '</td>';
            }
        }



        echo '</tr><tr>';
        $y = 0;
        foreach ($arrayRetorno[$num] as $numero => $dia) {
            $y++;
            if ($numero == 1) {
                $qtd = array_search($dia, $daysWeek);
                for ($i = 1; $i <= $qtd; $i++) {
                    echo '<td></td>';
                    $y += 1;
                }
            }

            if ($y == 1 || $y == 7) {
                echo '<td style="color: #bbbbbb" class="dia_' . $numero . '" value=' . "$numero" . '>' . $numero . '</td>';
            } else {
                echo '<td class="dia_' . $numero . '" value=' . "$numero" . '>' . $numero . '</td>';
            }

            if ($y == 7) {
                $y = 0;
                echo '</tr><tr>';
            }
        }
        echo '</tr></tbody>';
    }
    echo '</table>';
}
