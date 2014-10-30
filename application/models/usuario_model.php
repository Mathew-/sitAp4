<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
  
class Usuario_model extends CI_Model {
 
    function __construct() {
        parent::__construct();
    }
 
    function cadastrar($data) {
        return $this->db->insert('usuario', $data);
    }
    
    function listar() {
    $query = $this->db->get('usuario');
    return $query->result();
}
function deletar($id) {
    $this->db->where('idusuario', $id);
    return $this->db->delete('usuario');
}

function editar($id) {
    $this->db->where('idusuario', $id);
    return $this->db->get('usuario')->result();
}

function alterar($data) {
    $this->db->where('idusuario', $data['idusuario']);
    $this->db->set($data);
    return $this->db->update('usuario');
}
}