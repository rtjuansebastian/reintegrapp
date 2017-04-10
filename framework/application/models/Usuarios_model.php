<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');


class Usuarios_model extends CI_Model 
{
    
    public function __construct()
    {
        parent::__construct();
    }
     
    public function valida_login($usuario,$contraseña)
    {
        $validacion=FALSE;        
        
        $this->db->where('usuario',$usuario);
        $query=$this->db->get('usuarios');

        if($query->num_rows()>0)
        {
            $row=$query->row();
            $hash=$row->password;            
            
            $validacion = $this->login_model->validate_pass($hash, $contraseña);
        }        
        
        return $validacion;
    }

 
    public function get_hash($password, $cost = 11) 
    {
        // Genera sal de forma aleatoria
        $salt=substr(base64_encode(openssl_random_pseudo_bytes(17)),0,22);
        // reemplaza caracteres no permitidos
        $salt=str_replace("+",".",$salt);
        // genera una cadena con la configuración del algoritmo
        $param='$'.implode('$',array(
                "2y", // versión más segura de blowfish (>=PHP 5.3.7)
                str_pad($cost,2,"0",STR_PAD_LEFT), // costo del algoritmo
                $salt // añade la sal
        ));

        // obtiene el hash de la contraseña
        return crypt($password,$param);
    }

    public function validate_pass($hash, $pass) 
    {
            // verifica la contraseña con el hash
            return crypt($pass, $hash) == $hash;
    }
    
    public function crear_sesion($usuario)
    {
        $acceso = array(
                'usuario'  => $usuario,
                'logged_in' => TRUE
           );

        $this->session->set_userdata('sesion',$acceso);         
    }
    
    public function traer_usuarios()
    {
        $usuarios=array();
        $query=$this->db->get("usuarios");
        foreach ($query->result() as $row)
        {
            $usuarios[$row->usuario]['usuario']=$row->usuario;
            $usuarios[$row->usuario]['cedula']=$row->cedula;
            $usuarios[$row->usuario]['password']=$row->password;
            $usuarios[$row->usuario]['rol']=$row->rol;
        }
        
        return $usuarios;
    }
    
    public function agregar_usuario($data)
    {
        $this->db->insert("usuarios",$data);
    }
    
    public function traer_usuario($user)
    {
        $usuario=array();
        $this->db->where("usuario",$user);
        $query=$this->db->get("usuarios");
        $row=$query->row();
        $usuario['usuario']=$row->usuario;
        $usuario['password']=$row->password;
        $usuario['cedula']=$row->cedula;
        $usuario['rol']=$row->rol;
        
        return $usuario;
    }    
  
    public function actualizar_usuario($data)
    {        
        $this->db->where('usuario', $data['usuario']);
        $this->db->update('usuarios', $data);     
    } 

    public function eliminar_usuario($usuario)
    {
        $this->db->where('usuario', $usuario);
        $this->db->delete('usuarios');       
    }
}    