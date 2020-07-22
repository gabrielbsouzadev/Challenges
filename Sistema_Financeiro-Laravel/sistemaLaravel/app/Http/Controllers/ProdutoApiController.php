<?php

namespace sistemaLaravel\Http\Controllers;

use Illuminate\Http\Request;
use sistemaLaravel\Produto;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Input;
use sistemaLaravel\Http\Requests\ProdutoFormRequest;
use DB;

class ProdutoApiController extends Controller
{
    // Listando produtos
    public function listarProduto()
    {
        return DB::select('select * from produto');
    }

    // Cadastrando produtos
    public function novoProduto(Request $request)
    {
        $data = sizeof($_POST) > 0 ? $_POST : json_decode($request->getContent(), true); // Pega o post ou o raw

        foreach ($data as $value) {
            $res = DB::insert(
                'insert into produto (idcategoria, codigo, nome, estoque, descricao, imagem, estado) values (?, ?, ?, ?, ?, ?, ?)',
                [$value['idcategoria'], $value['codigo'], $value['nome'], $value['estoque'], $value['descricao'], $value['imagem'], $value['estado']]
            ); // Insert
        }

        return ["status" => ($res) ? 'ok' : 'erro'];
    }

    // Editando produtos
    public function editarProduto($id, Request $request)
    {
        $data = sizeof($_POST) > 0 ? $_POST : json_decode($request->getContent(), true); // Pega o post ou o raw

        $res = DB::update(
            "update produto set idcategoria = ?, codigo = ?, nome = ?, estoque = ?, descricao = ?, imagem = ?, estado = ? WHERE idproduto = ?",
            [$data['idcategoria'], $data['codigo'], $data['nome'], $data['estoque'], $data['descricao'], $data['imagem'], $data['estado'], $id]
        ); //Update

        return ["status" => ($res) ? 'ok' : 'erro'];
    }

    // Excluindo produto
    public function excluirProduto($id)
    {
        $res = DB::delete("delete from produto WHERE idproduto = ?", [$id]); //Excluir

        return ["status" => ($res) ? 'ok' : 'erro'];
    }
}
