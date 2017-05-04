<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');


class Diagnosticos_model extends CI_Model 
{
    
    public function __construct()
    {
        parent::__construct();
        $this->load->model("usuarios_model");
    }

    public function traer_preguntas($pregunta)
    {
        $preguntas=array();
        $query = $this->db->get('preguntas', 10, $pregunta);
        foreach ($query->result_array() as $row)
        {
            $preguntas[$row['id']]=$row;
        }
        
        return $preguntas;
    }
    
    public function enviar_diagnostico_test($data)
    {        
        $this->db->insert('diagnosticos_test', $data); 
        
        $diagnostico_test=$this->db->insert_id();
        
        return $diagnostico_test;
    }
    
    public function enviar_diagnostico($cita,$diagnostico_test)
    {
        $data=array(
            "cita"=>$cita,
            "diagnostico_test"=>$diagnostico_test
        );
                
        if($this->db->insert('diagnostico', $data))
        {
            $respuesta['error'] = false;
            $respuesta['mensaje'] = "El diagnostico ha sido almacenado";            
        }
        else
        {
            $respuesta['error'] = true;
            $respuesta['mensaje'] = "Error al almacenar el diagnostico";            
        }
        
        return $respuesta;
    }
    
    public function consultar_diagnostico($cita)
    {
        $diagnostico=array();
        $this->db->select("diagnostico.id, diagnostico.diagnostico_test, diagnosticos_test.c, diagnosticos_test.h, diagnosticos_test.a, diagnosticos_test.s, diagnosticos_test.i, diagnosticos_test.d, diagnosticos_test.e");
        $this->db->from("diagnostico");
        $this->db->join("diagnosticos_test","diagnostico.diagnostico_test=diagnosticos_test.id");
        $this->db->where("diagnostico.cita",$cita);
        $query=  $this->db->get();
        $diagnostico=$query->row_array();
        
        return $diagnostico;        
    }
}