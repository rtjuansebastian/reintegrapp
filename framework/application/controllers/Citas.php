<?php
header('Access-Control-Allow-Origin: *');

class Citas extends CI_Controller {

    public function __construct()
    {
        parent::__construct();
        $this->load->model("doctores_model");
        $this->load->model("usuarios_model");
        $this->load->model("citas_model");
    }
    
    public function consultar_citas()
    {
        $doctor=  $this->input->post("doctor");
        $citas=$this->citas_model->consultar_citas($doctor);
        echo json_encode($citas);
    }
    
    public function agendar_cita()
    {
        $data=  $this->input->post();
        $respuesta=$this->citas_model->agendar_cita($data);
        echo json_encode($respuesta);
    }
    
    public function modificar_cita()
    {
        $data=  $this->input->post();
        $respuesta=$this->citas_model->modificar_cita($data);
        echo json_encode($respuesta);        
    }
}