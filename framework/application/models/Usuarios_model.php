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
        $respuesta=array();
        $this->db->where('usuario',$usuario);
        $query=$this->db->get('usuarios');

        if($query->num_rows()>0)
        {
            $row=$query->row();
            $hash=$row->password;            
            
            $validacion = $this->usuarios_model->validate_pass($hash, $contraseña);
        }        
        
        if($validacion)
        {
            $respuesta['acceso']=$this->usuarios_model->crear_sesion($usuario,$row->cedula);
            $respuesta['mensaje']="Bienvenido ".$usuario;
            $respuesta['error']=FALSE;            
        }
        else {
            $respuesta['acceso']=array('cedula'=>null, 'usuario'=>null, 'logged_in'=>FALSE);
            $respuesta['mensaje']="Datos incorrectos";
            $respuesta['error']=TRUE;
        }
        
        return $respuesta;
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
    
    public function crear_sesion($usuario,$cedula)
    {
        $acceso = array(
                'cedula'=>$cedula,
                'usuario'  => $usuario,
                'logged_in' => TRUE
           );

        return $acceso;         
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
    
    public function validar_usuario($usuario)
    {
        $this->db->where("usuario",$usuario);
        $query=$this->db->get("usuarios");
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