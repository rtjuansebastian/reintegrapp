function verificar_sesion(){
    $.ajax({
        type: "POST",
        url: "http://localhost/reintegrapp/framework/index.php/doctores/verificar_sesion",
        success: function (data)
        {
            var result = $.parseJSON(data);
            if (result.error === false)
            {
                var date= new Date();
                var minutes= 120;
                date.setTime(date.getTime()+(minutes * 60 *1000));                         
                $.cookie('sesion',result.acceso.logged_in,{expires: date});
                $.cookie('doctor',result.acceso.cedula,{expires: date});
                $("#error").html("<p class=\"bg-success\">" + result.mensaje + "</p>");
                $('.bs-example-modal-sm').modal('show');
                setTimeout("location.href='pacientes.html'", 4000);
            } 
            else
            {
                $("#error").html("<p class=\"bg-danger\">" + result.mensaje + "</p>");
                $('.bs-example-modal-sm').modal('show');
            }
        }
    });
}