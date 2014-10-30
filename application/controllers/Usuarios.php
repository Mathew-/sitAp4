<?php if (!defined('BASEPATH')) exit('Não é permitido acesso direto de script!');
 
class Usuarios extends CI_Controller {
 
    function __construct() {
        parent::__construct();
    }
 
    function index() {
    $data['titulo'] = "CRUD com CodeIgniter | Usuarios";
 
    $this->load->model('usuario_model');
    $data['usuarios'] = $this->usuario_model->listar();
 
    $this->load->view('usuario', $data);
}
    
    function cadastrar() {
    $this->load->library('form_validation');
    $this->form_validation->set_error_delimiters('<span>', '</span>');
    $validations = array(
        array(
            'field' => 'nome',
            'label' => 'Nome',
            'rules' => 'required|min_length[4]|max_length[45]'
        ),
        array(
            'field' => 'email',
            'label' => 'E-mail',
            'rules' => 'trim|required|valid_email|max_length[45]'
        ),
         array(
            'field' => 'senha',
            'label' => 'Senha',
            'rules' => 'required|min_length[6]|max_length[16]'
        ),
         array(
            'field' => 'sexo',
            'label' => 'Sexo',
            'rules' => 'required|min_length[1]|max_length[1]'
        ),
        array(
            'field' => 'cidade',
            'label' => 'Cidade',
            'rules' => 'required|min_length[4]|max_length[45]'
            ),
        array(
            'field' => 'estado',
            'label' => 'Estado',
            'rules' => 'required|min_length[4]|max_length[45]'
        ),
        array(
            'field' => 'endereco',
            'label' => 'Endereco',
            'rules' => 'required|min_length[4]|max_length[45]'
        ),
        array(
            'field' => 'cep',
            'label' => 'CEP',
            'rules' => 'required|min_length[8]|max_length[8]'
        ),
        array(
            'field' => 'foto',
            'label' => 'Foto',
            'rules' => 'required|min_length[4]|max_length[45]'
        )
        
        
    );
    $this->form_validation->set_rules($validations);
    if ($this->form_validation->run() == FALSE) {
        $this->index();
    } else {
        $data['nome'] = $this->input->post('nome');
        $data['email'] = $this->input->post('email');
        $data['senha'] = $this->input->post('senha');
        $data['sexo'] = $this->input->post('sexo');
        $data['cidade'] = $this->input->post('cidade');
        $data['estado'] = $this->input->post('estado');
        $data['endereco'] = $this->input->post('endereco');
        $data['foto'] = $this->input->post('foto');
        
 
        $this->load->model('usuario_model');
        if ($this->usuario_model->cadastrar($data)) {
            redirect('index.php/Usuarios');
        } else {
            log_message('error', 'Erro no cadastro...');
        }
    }
}

function deletar($id) {
    $this->load->model('usuario_model');
    if ($this->usuario_model->deletar($id)) {
        redirect('index.php/Usuarios');
    } else {
        log_message('error', 'Erro ao deletar...');
    }
}

function editar($id)  {
    $data['titulo'] = "CRUD com CodeIgniter | Alteração de Usuários";
 
    $this->load->model('usuario_model');
    $data['dados_usuario'] = $this->usuario_model->editar($id);
 
    $this->load->view('usuario_edit', $data);
}

function alterar() {
    $this->load->library('form_validation');
    $this->form_validation->set_error_delimiters('', '');
    $validations = array(
       array(
            'field' => 'nome',
            'label' => 'Nome',
            'rules' => 'required|min_length[4]|max_length[45]'
        ),
        array(
            'field' => 'email',
            'label' => 'E-mail',
            'rules' => 'trim|required|valid_email|max_length[45]'
        ),
         array(
            'field' => 'senha',
            'label' => 'Senha',
            'rules' => 'required|min_length[6]|max_length[16]'
        ),
         array(
            'field' => 'sexo',
            'label' => 'Sexo',
            'rules' => 'required|min_length[1]|max_length[1]'
        ),
        array(
            'field' => 'cidade',
            'label' => 'Cidade',
            'rules' => 'required|min_length[4]|max_length[45]'
            ),
        array(
            'field' => 'estado',
            'label' => 'Estado',
            'rules' => 'required|min_length[4]|max_length[45]'
        ),
        array(
            'field' => 'endereco',
            'label' => 'Endereco',
            'rules' => 'required|min_length[4]|max_length[45]'
        ),
        array(
            'field' => 'cep',
            'label' => 'CEP',
            'rules' => 'required|min_length[8]|max_length[8]'
        ),
        array(
            'field' => 'foto',
            'label' => 'Foto',
            'rules' => 'required|min_length[4]|max_length[45]'
        )
    );
    $this->form_validation->set_rules($validations);
    if ($this->form_validation->run() == FALSE) {
        $this->editar($this->input->post('idusuario'));
    } else {
        $data['nome'] = $this->input->post('nome');
        $data['email'] = $this->input->post('email');
        $data['senha'] = $this->input->post('senha');
        $data['sexo'] = $this->input->post('sexo');
        $data['cidade'] = $this->input->post('cidade');
        $data['estado'] = $this->input->post('estado');
        $data['endereco'] = $this->input->post('endereco');
        $data['foto'] = $this->input->post('foto');
 
        $this->load->model('usuario_model');
        if ($this->usuario_model->alterar($data)) {
            redirect('index.php/Usuarios');
        } else {
            log_message('error', 'Erro na alteração...');
        }
    }
}

}