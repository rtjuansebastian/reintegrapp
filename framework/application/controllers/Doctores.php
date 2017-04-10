<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Doctores extends CI_Controller {

    public function __construct()
    {
        parent::__construct();
        $this->load->model("doctores_model");
    }

    public function guardar_doctor()
    {
        $data=  $this->input->post();
        $respuesta=  $this->doctores_model->guardar_doctor($data);
        echo json_encode($respuesta);
    }
}