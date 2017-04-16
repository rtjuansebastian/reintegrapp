<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');


class Pacientes_model extends CI_Model 
{
    
    public function __construct()
    {
        parent::__construct();
    }
    
    public function consultar_pacientes(){
        $pacientes = array();
        $query = $this->db->get('pacientes');
        foreach ($query->result() as $row){
            $pacientes[$row->cedula]=$row;            
           
        }
        return $pacientes;
    }
    public function consultar_paciente($cedula){
        $this->db->select('cedula, nombres, apellidos, generos.genero, estados_civil.estado, escolaridad.nivel, edad, tiempo_militancia, fecha_reintegracion');
        $this->db->from('pacientes');
        $this->db->join('generos', 'pacientes.genero = generos.id');
        $this->db->join('estados_civil', 'pacientes.estado_civil = estados_civil.id');
        $this->db->join('escolaridad', 'pacientes.escolaridad = escolaridad.id');        
        $this->db->where('cedula', $cedula);
        $query = $this->db->get();
        return $query->row_array();
    }
    public function crear_paciente($data){
        $respuesta = array();
        $validar_paciente = $this->pacientes_model->validar_cedula($data['cedula']);
        if ($validar_paciente){
            $respuesta['error'] = true;
            $respuesta['mensaje'] = "La cédula ya se encuentra registrada.";
            return $respuesta;
        }
        
        if ($this->db->insert('pacientes', $data)){
            $respuesta['error'] = false;
            $respuesta['mensaje'] = "Paciente creado correctamente";
        }
        else{
            $respuesta['error'] = true;
            $respuesta['mensaje'] = "Error al crear paciente";
        }
        return $respuesta;
        
    }
    public function validar_cedula($cedula)
    {
        $this->db->where('cedula', $cedula);
        $query=  $this->db->get("pacientes");
        if($query->num_rows()>0)
        {
            return TRUE;
        }
        else
        {
            return FALSE;
        }
    }    
    
      public function buscar_paciente($cedula) {
        $pacientes = array();
        $this->db->like('cedula', $cedula, 'both');
        $query = $this->db->get('pacientes');
        foreach ($query->result() as $row) {
            $pacientes[$row->cedula] = $row;
        }
        return $pacientes;
    }
   
    

}

 
    