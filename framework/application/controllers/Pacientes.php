<?php
header('Access-Control-Allow-Origin: *');

class Pacientes extends CI_Controller {

    public function __construct()
    {
        parent::__construct();
        $this->load->model("pacientes_model");
        $this->load->model("diagnosticos_model");
     }
     
     
     public function consultar_pacientes(){
         $pacientes = $this->pacientes_model->consultar_pacientes();
         echo json_encode($pacientes);
     }
     
     public function consultar_paciente(){
         $cedula = $this->input->get('cedula');
         $respuesta['paciente'] = $this->pacientes_model->consultar_paciente($cedula);
         $respuesta['resultados'] =$this->diagnosticos_model->consultar_resultados_diagnosticos($cedula);
         echo json_encode($respuesta);
     }
     
     public function buscar_paciente(){
         $cedula = $this->input->post('cedula');
         $paciente = $this->pacientes_model->buscar_paciente($cedula);
         echo json_encode($paciente);
     }
     public function crear_paciente(){
         $data = $this->input->post();
         $respuesta= $this->pacientes_model->crear_paciente($data);
         echo json_encode($respuesta);
         
     }
}