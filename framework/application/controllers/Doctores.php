<?php
header('Access-Control-Allow-Origin: *');

class Doctores extends CI_Controller {

    public function __construct()
    {
        parent::__construct();
        $this->load->model("doctores_model");
        $this->load->model("usuarios_model");
    }

    public function guardar_doctor()
    {
        $data=  $this->input->post();
        $data['password']=$this->usuarios_model->get_hash($data['password']);
        $respuesta=  $this->doctores_model->guardar_doctor($data);
        echo json_encode($respuesta);
    }
    
    public function login()
    {
        $data=  $this->input->post();
        $respuesta=$this->usuarios_model->valida_login($data['usuario'],$data['password']);
        echo json_encode($respuesta);
    }
}