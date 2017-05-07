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
        unset($data['comentarios']);
        $cita=  $this->input->get("cita");
        $comentarios=  $this->input->get("comentarios");
        $this->citas_model->cambiar_estado_cita($cita,"2");
        $diagnostico_test=$this->diagnosticos_model->enviar_diagnostico_test($data);        
        $respuesta=$this->diagnosticos_model->enviar_diagnostico($cita,$diagnostico_test);
        $this->diagnosticos_model->enviar_diagnostico_comentarios($respuesta['diagnostico'],$comentarios);
        echo json_encode($respuesta);
    }
    
    public function consultar_diagnostico()
    {
        $cita=  $this->input->get("cita");
        $respuesta['diagnostico']=$this->diagnosticos_model->consultar_diagnostico($cita);
        $respuesta['observaciones']=$this->diagnosticos_model->consultar_observaciones_diagnostico($cita);
        echo json_encode($respuesta);
    }
    
    public function consultar_resultados()
    {
        $resultados=$this->diagnosticos_model->consultar_resultados();
        echo json_encode($resultados);
    }
}
