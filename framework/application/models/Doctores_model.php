<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');


class Doctores_model extends CI_Model 
{
    
    public function __construct()
    {
        parent::__construct();
        $this->load->model("usuarios_model");
    }
    
    public function guardar_doctor($data)
    {
        $respuesta=array();
        $validar=$this->doctores_model->validar_cedula($data['cedula']);
        if($validar)
        {
            $respuesta['error']=TRUE;
            $respuesta['mensaje']="Esa cedula ya esta registrada";
        }
        else
        {
            $data_doctor = array(
               'cedula' => $data['cedula'] ,
               'nombre' => $data['nombre']
            );

            $this->db->insert('doctores', $data_doctor);   
                        
            $data_usuario = array(
                'usuario' => $data['usuario'] ,
                'rol' => "1" ,
                'cedula' => $data['cedula'] ,
                'password' => $data['password']
            );

            $this->usuarios_model->agregar_usuario($data_usuario);
            
            $respuesta["error"]=FALSE;
            $respuesta['mensaje']="Usuario creado exitosamente";
        }
        
        return $respuesta;
    }
    
    public function validar_cedula($cedula)
    {
        $this->db->where('cedula', $cedula);
        $query=  $this->db->get("doctores");
        if($query->num_rows()>0)
        {
            return TRUE;
        }
        else
        {
            return FALSE;
        }
    }
}