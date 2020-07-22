<?php

namespace sistemaLaravel\Http\Controllers;

use Illuminate\Http\Request;
use sistemaLaravel\Venda;
use sistemaLaravel\DetalheVenda;
use Illuminate\Support\Facades\Redirect;
use sistemaLaravel\Http\Requests\VendaFormRequest;
use DB;

class VendaApiController extends Controller
{
    // Listando Vendas
    public function listarVenda()
    {
        return DB::select('select * from venda');
    }

    // Inserindo Venda
    public function novaVenda(Request $request)
    {
        $data = sizeof($_POST) > 0 ? $_POST : json_decode($request->getContent(), true); // Pega o post ou o raw

        //var_dump($data);

        foreach ($data as $value) {
            $res = DB::insert(
                'insert into venda (idcliente, tipo_comprovante, serie_comprovante, num_comprovante, data_hora, taxa, total_venda, estado) values (?, ?, ?, ?, ?, ?, ?, ?)',
                [$value['idcliente'], $value['tipo_comprovante'], $value['serie_comprovante'], $value['num_comprovante'], $value['data_hora'], $value['taxa'], $value['total_venda'], $value['estado']]
            ); // Insert
        }

        return ["status" => ($res) ? 'ok' : 'erro'];
    }



    // Editando Venda
    public function editarVenda($id, Request $request)
    {
        $data = sizeof($_POST) > 0 ? $_POST : json_decode($request->getContent(), true); // Pega o post ou o raw

        //var_dump($data);
        
        $res = DB::update(
            "update venda set idcliente = ?, tipo_comprovante = ?, serie_comprovante = ?, num_comprovante = ?, data_hora = ?, taxa = ?, total_venda = ?, estado = ? WHERE idvenda = ?",
            [$data['idcliente'], $data['tipo_comprovante'], $data['serie_comprovante'], $data['num_comprovante'], $data['data_hora'], $data['taxa'], $data['total_venda'], $data['estado'], $id]
        ); //Update

        return ["status" => ($res) ? 'ok' : 'erro'];
    }

    // Excluindo clientes
    public function excluirVenda($id)
    {
        $res = DB::delete("delete from venda WHERE idvenda = ?", [$id]); //Excluir

        return ["status" => ($res) ? 'ok' : 'erro'];
    }
}
