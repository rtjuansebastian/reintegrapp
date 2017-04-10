<?php
defined('BASEPATH') OR exit('No direct script access allowed');

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
}