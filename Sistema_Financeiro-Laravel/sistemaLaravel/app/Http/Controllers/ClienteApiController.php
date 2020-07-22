<?php

namespace sistemaLaravel\Http\Controllers;

use Illuminate\Http\Request;
use sistemaLaravel\Pessoa;
use Illuminate\Support\Facades\Redirect;
use sistemaLaravel\Http\Requests\PessoaFormRequest;
use DB;

class ClienteApiController extends Controller
{
    // Listando clientes
    public function listarCliente()
    {
        return DB::select('select * from pessoa');
    }

    // Cadastrando clientes
    public function novoCliente(Request $request)
    {
        $data = sizeof($_POST) > 0 ? $_POST : json_decode($request->getContent(), true); // Pega o post ou o raw

        foreach ($data as $value) {
            $res = DB::insert(
                'insert into pessoa (tipo_pessoa, nome, tipo_documento, num_doc, endereco, telefone, email) values (?, ?, ?, ?, ?, ?, ?)',
                ['Cliente', $value['nome'], $value['tipo_documento'], $value['num_doc'], $value['endereco'], $value['telefone'], $value['email']]
            ); // Insert
        }

        return ["status" => ($res) ? 'ok' : 'erro'];
    }

    // Editando clientes
    public function editarCliente($id, Request $request)
    {
        $data = sizeof($_POST) > 0 ? $_POST : json_decode($request->getContent(), true); // Pega o post ou o raw

        $res = DB::update(
            "update pessoa set tipo_pessoa = ?, nome = ?, tipo_documento = ?, num_doc = ?, endereco = ?, telefone = ?, email = ? WHERE idpessoas = ?",
            ['Cliente', $data['nome'], $data['tipo_documento'], $data['num_doc'], $data['endereco'], $data['telefone'], $data['email'], $id]
        ); //Update

        return ["status" => ($res) ? 'ok' : 'erro'];
    }

    // Excluindo clientes
    public function excluirCliente($id)
    {
        $res = DB::delete("delete from pessoa WHERE idpessoas = ?", [$id]); //Excluir

        return ["status" => ($res) ? 'ok' : 'erro'];
    }
}
