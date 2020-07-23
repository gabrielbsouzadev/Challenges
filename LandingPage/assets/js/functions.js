/* Função Validar */
function validar() {
    // pegando o valor do nome pelos names
    var nome = document.getElementById("fnome");
    var email = document.getElementById("femail");
    var telefone = document.getElementById("ftelefone");
    var idade = document.getElementById("fidade");
    var calculo = document.getElementById("calculo");

    // verificar se o nome está vazio
    if (nome.value == "") {
        alert("Nome não informado");

        // Deixa o input com o focus
        nome.focus();
        // retorna a função e não olha as outras linhas
        return;
    }

    // verificar se o email está vazio
    if (email.value == "") {
        alert("Email não informado");

        // Deixa o input com o focus
        femail.focus();
        // retorna a função e não olha as outras linhas
        return;
    }

    // verificar se o email está vazio
    if (telefone.value == "") {
        alert("Favor informar o número de telefone");

        // Deixa o input com o focus
        femail.focus();
        // retorna a função e não olha as outras linhas
        return;
    }

    if (idade.value == "") {
        alert("Favor informar sua idade");

        // Deixa o input com o focus
        fidade.focus();
        // retorna a função e não olha as outras linhas
        return;
    }

    // verificar se o calculo está vazio
    if (calculo.value != 7) {
        alert("O resultado não é esse! Por favor tente novamente.");

        // Deixa o input com o focus
        calculo.focus();
        // retorna a função e não olha as outras linhas
        return;
    }

    alert("Obrigado! Formulário enviado com sucesso!");
    // envia o formulário
    //formulario.submit();
}