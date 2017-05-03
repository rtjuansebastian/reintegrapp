<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');


class Citas_model extends CI_Model 
{
    
    public function __construct()
    {
        parent::__construct();
        $this->load->model("usuarios_model");
    }
    
    public function consultar_citas($doctor)
    {
        $citas=array();
        $this->db->select("citas.id, citas.doctor, citas.paciente, pacientes.nombres, pacientes.apellidos, citas.fecha, estados_cita.estado");
        $this->db->from("citas");
        $this->db->join("pacientes","citas.paciente=pacientes.cedula");
        $this->db->join("estados_cita","citas.estado=estados_cita.id");
        $this->db->where("citas.doctor",$doctor);
        $query=$this->db->get();
        foreach ($query->result_array() as  $row)
        {
            $citas[$row['id']]=$row;
        }
        
        return $citas;
    }
    
    public function agendar_cita($data)
    {
        $disponibilidad=$this->citas_model->consultar_disponibilidad($data['doctor'],$data['fecha']);
        if(!$disponibilidad)
        {
            $respuesta['error'] = true;
            $respuesta['mensaje'] = "El doctor no tiene disponibilidad para esa fecha";            
            return $respuesta;
        }
        if ($this->db->insert('citas', $data)){
            $respuesta['error'] = false;
            $respuesta['mensaje'] = "Cita agendada";
        }
        else{
            $respuesta['error'] = true;
            $respuesta['mensaje'] = "Error al agendar la cita";
        }
        return $respuesta;        
    }
    
    public function consultar_disponibilidad($doctor,$fecha)
    {
        $this->db->where("doctor",$doctor);
        $this->db->where("fecha",$fecha);
        $query=$this->db->get("citas");
        if($query->num_rows()>0)
        {
            return FALSE;
        }        
        else 
        {
            return TRUE;
        }
    }
    
    public function cambiar_estado_cita($cita,$estado)
    {
        $data = array(
                       'estado' => $estado
                    );

        $this->db->where('cita', $cita);
        $this->db->update('citas', $data);         
    }
}