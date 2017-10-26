<%@ Page Language="C#" AutoEventWireup="true" CodeFile="codigo/solicitud_credito.aspx.cs" Inherits="solicitud_credito" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script type="text/javascript" language="javascript">
    function posicionar_cursor(textControlID) {
        var texto = document.getElementById(textControlID);
        if (texto != null && texto.value.length > 0) {
            if (texto.createTextRange) {
                var rango_campo_texto = texto.createTextRange();
                rango_campo_texto.moveStart('character', texto.value.length);
                rango_campo_texto.collapse();
                rango_campo_texto.select();
            } else if (texto.setSelectionRange) {
                var size = texto.value.length;
                texto.setSelectionRange(size, size);
            }
        }
    }
    (function () {
        var mouse = false, teclado = false;
        document.onmousemove = function () {
            mouse = true;
        };
        document.onkeydown = function () {
            teclado = true;
        };
        setInterval(function () {
            if (!mouse && !teclado) {
            //    var boton = document.getElementById('boton_actualizar');
             //   boton.click();
            }
            else {
                mouse = false;
                teclado = false;
                window.opener.document.getElementById('caja_contador').value = "0";
            }
        }, 3000);
    })()
    function uploadError(sender, args) {
        document.getElementById('mensaje_imagen').innerText = args.get_fileName(), "<span style='color:red;'>" + args.get_errorMessage() + "</span>";
    }
    function StartUpload(sender, args) {
        //  document.getElementById('mensaje_imagen').innerText = 'Adjuntando archivo...';
    }
    function UploadComplete(sender, args) {
        // document.getElementById("mensaje_imagen").style.visibility = "hidden";
    }   
</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Solicitud de credito - Inklaser</title>
</head>
<body>
    <form id="form1" runat="server">
     <asp:ScriptManager ID="sm1" runat="server">
                </asp:ScriptManager>
              <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                  <ContentTemplate>
       <section>
           <h3 class="box-header">Subir Fotografia Lectura</h3>    
           <div class="box-content">
           <!-- Fotografía + LABELS FOTOGRAFIA --> 
           <ul>
                   <li>
        <asp:AsyncFileUpload ID="archivo" runat="server" CssClass="subir_archivo fa fa-cloud-upload" 
        OnClientUploadError="uploadError" 
        OnClientUploadStarted="StartUpload"
        OnClientUploadComplete="UploadComplete"
        CompleteBackColor="Transparent" 
        ErrorBackColor="Red" 
        ThrobberID="Throbber" 
        onuploadedcomplete="archivo_UploadedComplete" 
        UploadingBackColor="Transparent" ToolTip="Adjuntar archivos al correo" />     
        <asp:Label ID="Throbber" runat="server" Style="display: none" CssClass="adjuntando">
            <i class="fa fa-spinner fa-spin fa-lg"></i>
        </asp:Label>   
</li></ul></div></section> <!-- TERMINA SECTION -->
<asp:Button ID="cancelar" runat="server" Text="Cancelar" 
                CssClass="guardar button radius push_button small boton-rojo-esp boton-margen-right" 
            onclick="cancelar_Click" />
           </ContentTemplate>
        </asp:UpdatePanel>     
    </form>
</body>
</html>
