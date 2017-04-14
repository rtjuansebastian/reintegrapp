<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Pacientes extends CI_Controller {

    public function __construct()
    {
        parent::__construct();
        $this->load->model("pacientes_model");
     }
     
     
     public function consultar_pacientes(){
         $pacientes = $this->pacientes_model->consultar_pacientes();
         echo json_encode($pacientes);
     }
     
     public function consultar_paciente(){
         $cedula = $this->input->get('cedula');
         $paciente = $this->pacientes_model->consultar_paciente($cedula);
         echo json_encode($paciente);
         
     }
}