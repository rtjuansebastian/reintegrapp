<?php
header('Access-Control-Allow-Origin: *');

class Diagnosticos extends CI_Controller {

    public function __construct()
    {
        parent::__construct();
        $this->load->model("doctores_model");
        $this->load->model("usuarios_model");
        $this->load->model("diagnosticos_model");
        $this->load->model("citas_model");
    }
    
    public function traer_preguntas()
    {
        $pregunta=  $this->input->get("pregunta");
        $preguntas=$this->diagnosticos_model->traer_preguntas($pregunta);
        echo json_encode($preguntas);
    }
    
    public function enviar_diagnostico()
    {
        $data=  $this->input->get();
        unset($data['cita']);
        $cita=  $this->input->get("cita");
        $this->citas_model->cambiar_estado_cita($cita,"2");
        $diagnostico_test=$this->diagnosticos_model->enviar_diagnostico_test($data);
        $respuesta=$this->diagnosticos_model->enviar_diagnostico($cita,$diagnostico_test);
        echo json_encode($respuesta);
    }
    
    public function consultar_diagnostico()
    {
        $cita=  $this->input->get("cita");
        $diagnostico=$this->diagnosticos_model->consultar_diagnostico($cita);
        echo json_encode($diagnostico);
    }
    
    public function consultar_resultados()
    {
        $resultados=$this->diagnosticos_model->consultar_resultados();
        echo json_encode($resultados);
    }
}
