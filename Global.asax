<%@ Application Language="C#" %>

<script runat="server">
 
    void Application_Error(object sender, EventArgs e)
    {
        Funciones consulta = new Funciones();
        Exception exception = Server.GetLastError();
        if (exception != null)
        {
            //Log
            if (HttpContext.Current.Server != null)
            {
              //  HttpContext.Current.Server.Transfer("/siteerror.aspx");
                consulta.fecha_error = DateTime.Now;
                consulta.error = exception.ToString();
                consulta.tabla_error = "variable";
                consulta.ingresar_error_registro_sistema();
            }
        }
    }
</script>
