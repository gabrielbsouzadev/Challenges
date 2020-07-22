<?php
include 'calendario.php';
?>
<!DOCTYPE HTML>
<html lang="pt-BR">

<head>
    <meta charset=UTF-8>
    <title>Calendário</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="css/style.css" rel="stylesheet" type="text/css" />
</head>

<body>
    <header>
        <nav class="navbar" style="background-color: #e67000">
            <a class="navbar-brand" style="margin: 20px;"><img src="img/itau.png" alt=""></a>
            <form class="form-inline">
                <img src="img/notification.png" alt="" width="20px" height="20px">
            </form>
        </nav>
    </header>

    <!-- Icon Bar (Sidebar - hidden on small screens) -->
    <nav class="w3-sidebar w3-bar-block w3-center">

        <a href="#" class="w3-bar-item w3-button w3-padding-16">
            <img src="img/house.png" alt="" width="20px" height="20px">
        </a>
        <a href="#about" class="w3-bar-item w3-button w3-padding-16">
            <img src="img/laptop.png" alt="" width="20px" height="20px">
        </a>
        <a href="#photos" class="w3-bar-item w3-button w3-padding-16">
            <img src="img/clock.png" alt="" width="20px" height="20px">
        </a>
        <a href="#contact" class="w3-bar-item w3-button w3-padding-16">
            <img src="img/bar-chart.png" alt="" width="20px" height="20px">
        </a>
        <a href="#" class="w3-bar-item w3-button w3-padding-16">
            <img src="img/document.png" alt="" width="20px" height="20px">
        </a>
        <a href="#about" class="w3-bar-item w3-button w3-padding-16">
            <img src="img/question.png" alt="" width="20px" height="20px">
        </a>
        <a href="#photos" class="w3-bar-item w3-button w3-padding-16">
            <img src="img/gear.png" alt="" width="20px" height="20px">
        </a>
        <a href="#contact" class="w3-bar-item w3-button w3-padding-16">
            <img src="" alt="" width="20px" height="20px">
        </a>
        <a href="#contact" class="w3-bar-item w3-button w3-padding-xxxlarger">
            <img src="img/brazil.png" alt="" width="20px" height="20px">
        </a>
    </nav>

    <!-- Navbar on small screens (Hidden on medium and large screens) -->
    <div class="w3-top w3-hide-large w3-hide-medium" id="myNavbar">
        <div class="w3-bar w3-black w3-opacity w3-hover-opacity-off w3-center w3-small">
            <a href="#" class="w3-bar-item w3-button" style="width:25% !important">HOME</a>
            <a href="#about" class="w3-bar-item w3-button" style="width:25% !important">ABOUT</a>
            <a href="#photos" class="w3-bar-item w3-button" style="width:25% !important">PHOTOS</a>
            <a href="#contact" class="w3-bar-item w3-button" style="width:25% !important">CONTACT</a>
        </div>
    </div>

    <div class="w3-padding-large" id="main">
        <div style="background-color: #eee9e5">
            <p>home &gt; configurações</p>
            <p style="color: #2d74a8; font-weight: bold">&lt; voltar</p>
            <h2 class="display-5">configurações</h2>
            <p>aqui você pode parametrizar as datas de pagamentos, as equivalências do sistema e fazer upload das bases de dados</p>
            <hr class="my-4">

            <nav style="background-color: #eee9e5">
                <ul class="nav nav-tabs">
                    <li class="nav-item">
                        <a class="nav-link active" href="index.php">datas de pagamento</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link disabled" href="#">equivalências de fornecedores</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link disabled" href="#">upload de arquivo</a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>

    <div class="container">
        <div>
            <h1 class="display-5">parametrizar datas do mês de
                <select id="inputMes" onchange="fnAlterMonth(this.value)">
                    <option id="inputmes_1" value="mes_1">janeiro</option>
                    <option id="inputmes_2" value="mes_2">fevereiro</option>
                    <option id="inputmes_3" value="mes_3">março</option>
                    <option id="inputmes_4" value="mes_4">abril</option>
                    <option id="inputmes_5" value="mes_5">maio</option>
                    <option id="inputmes_6" value="mes_6">junho</option>
                    <option id="inputmes_7" value="mes_7">julho</option>
                    <option id="inputmes_8" value="mes_8">agosto</option>
                    <option id="inputmes_9" value="mes_9">setembro</option>
                    <option id="inputmes_10" value="mes_10">outubro</option>
                    <option id="inputmes_11" value="mes_11">novembro</option>
                    <option id="inputmes_12" value="mes_12">dezembro</option>
                </select>
            </h1>
        </div>

        <div>
            <div class="row">
                <div class="col-4" id="barra-periodo">
                    1º período
                </div>
                <div class="col-4" id="barra-periodo">
                    2º período
                </div>
                <div class="col-4" id="barra-periodo">
                    3º período
                </div>
                <div class="col-12">
                    <div class="progress">
                        <div class="progress-bar" id="progress-bar-periodo" role="progressbar" style="width: 33%" aria-valuenow="33" aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                </div>
            </div>
        </div>

        <div class="w3-row-padding" style="margin:0 -16px; background-color: #ffffff;">
            <div class="w3-half w3-margin-bottom">
                <ul class="w3-ul w3-center">
                    <li class="w3-xlarge w3-padding-32">
                        <div class="periodo">
                            <p id="label_periodo">períodos de solicitações para o mês de</p>
                        </div>
                    </li>

                    <li class="w3-padding-16" style="background-color: #f8f4f1; border: 1px solid #efebe8">
                        <div class="row" id="periodo-radio">
                            <div class="col-4">
                                <label for="radio-periodo1"><input type="radio" name="inputPeriodoRadio" value="periodo1" id="radio-periodo1" checked>1º Periodo</label>
                            </div>
                            <div class="col-4">
                                <label for="radio-periodo2"><input type="radio" name="inputPeriodoRadio" value="periodo2" id="radio-periodo2">2º Periodo</label>
                            </div>
                            <div class="col-3">
                                <label for="radio-periodo3"><input type="radio" name="inputPeriodoRadio" value="periodo3" id="radio-periodo3">3º Periodo</label>
                            </div>
                        </div>
                        <p style="background: #efebe8;"><a id="acabou-periodo" href="index.php">Redefirnir período</a></p>
                    </li>

                    <li class="w3-padding-16" style="border: 1px solid #efebe8">
                        <div class="calendario">
                            <?php
                            montaCalendario();
                            ?>
                        </div>
                    </li>

                </ul>
            </div>

            <div class="w3-half">
                <ul class="w3-ul">
                    <li class="w3-xlarge w3-padding-32" style="font-size: 15px;">período</li>
                    <li class="w3-padding-16">

                        <div class="form-row">
                            <div class="form-group col-md-2">
                                <?php
                                $dias = [
                                    1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31
                                ];
                                ?>
                                <label for="inputZip">do dia</label>
                                <select class="form-control" name="inputDiaDe" id="inputDiaDe">
                                    <option selected="" disabled="">00</option>
                                    <?php
                                    foreach ($dias as $dia) {
                                        echo "<option value='" . $dia . "'> $dia </option>";
                                    }
                                    ?>
                                </select>
                            </div>
                            <div class="form-group col-md-2">
                                <label for="inputZip">até dia</label>
                                <select class="form-control" name="inputDiaAte" id="inputDiaAte">
                                    <option selected="" disabled="">00</option>
                                    <?php
                                    foreach ($dias as $dia) {
                                        echo "<option value='" . $dia . "'> $dia</option>";
                                    }
                                    ?>

                                </select>
                            </div>
                        </div>

                    </li>

                    <li class=""><button class="btn btn-outline-secondary" type="submit" onclick="selectDays();">definir data do período</button></li>

                </ul>
            </div>
            <!-- End Grid/Pricing tables -->
        </div>
    </div>

</body>

<footer>
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <script type="text/javascript" src="js/functions.js"></script>
    <script>
        document.querySelector("#acabou-periodo").style.display = 'none';
    </script>
</footer>

</html>