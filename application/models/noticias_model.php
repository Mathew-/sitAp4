<?php
if (!defined('BASEPATH'))
    exit('Acesso direto ao script não é permitido');

class noticias_model extends CI_Model {
function listar() {
        //Listagem da tabela usuário
        $query = $this->db
                ->order_by('nome','asc') //Ordem alfabética
                ->get('usuario');
        
        return $query->result();
    }
}