<%@ Page Language="C#" AutoEventWireup="true" CodeFile="codigo/imprimir_cotizacion.aspx.cs"
    Inherits="imprimir_cotizacion" %>

<script type="text/javascript" language="javascript">
    function salir() {
        this.close();
    }
    (function () {
        var mouse = false, keyboard = false;
        document.onmousemove = function () {
            mouse = true;
        };
        document.onkeydown = function () {
            keyboard = true;
        };
        setInterval(function () {
            if (!mouse && !keyboard) {
                //  var boton = window.opener.document.getElementById('actualizar');
                // boton.click();
            }
            else {
                mouse = false;
                keyboard = false;
                window.opener.document.getElementById('caja_contador').value = "0";
            }
        }, 1000);
    })()
    function cerrar() {
        document.location.href = "editar_cotizacion.aspx";
    }
    window.onbeforeunload = salida;
    function salida() {
        var proceso = 0;
        if (proceso == 0) {
            proceso = 1;
            document.location.href = "editar_cotizacion.aspx";
        }
    }
</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8">
    <title>Cotizacion - Inklaser</title>
    <link rel="stylesheet" href="stylex.css" media="all" />
    <script type="text/javascript" src="javascript/funciones.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <header class="clearfix">
      <div id="">
        <img class="logo_cotizacion" src="img/logo.png" width="200px" />
      </div>
      <div id="company">
        <h2 class="name"><asp:Label ID="caja_sucursal" runat="server" CssClass="caja_sucursal"></asp:Label></h2>
        <div><asp:Label ID="caja_domicilio" runat="server" CssClass="caja_sucursal"></asp:Label></div>
        <div><asp:Label ID="caja_ciudad" runat="server" CssClass="caja_sucursal"></asp:Label></div>
          <div><asp:Label ID="caja_moneda" runat="server" CssClass="caja_sucursal"></asp:Label></div>
     <div><asp:Label ID="caja_usuario" runat="server" CssClass="caja_sucursal"></asp:Label></div>
     <div><asp:Label ID="caja_fecha" runat="server" CssClass="caja_sucursal"></asp:Label></div>

          
             </div>
      </div>
    </header>
    <main>
      <div id="details" class="clearfix">
        <div id="client">
          <div class="to">Atencion a:</div>

          <h2 class="name"><asp:Label ID="caja_nombre" runat="server" CssClass="caja_sucursal"></asp:Label></h2>
     
          <div class="email"><asp:Label ID="caja_correo" runat="server" CssClass="caja_sucursal"></asp:Label></div>
        </div>
        <div id="invoice">
          <h1><asp:Label ID="caja_cotizacion" runat="server" CssClass="caja_sucursal"></asp:Label></h1>
          <h1><asp:Label ID="caja_nombre_vendedor" runat="server" CssClass="caja_sucursal"></asp:Label></h1>
          <h1><asp:Label ID="caja_telefono" runat="server" CssClass="caja_sucursal"></asp:Label></h1>
          
        </div>
      </div>
        <div class="alineacion-tabla">
      <asp:GridView ID="tabla_productos" runat="server" CssClass="tabla" DataSource='<%# datos_productos() %>'  
            ShowHeaderWhenEmpty="True" AutoGenerateColumns="False"
            PagerSettings-Visible = "false">
            <HeaderStyle CssClass="GridHeader" />
		    <PagerSettings Visible="False" />
		    <RowStyle CssClass="GridRow" HorizontalAlign="Left" />
		    <AlternatingRowStyle CssClass="GridAlternateRow" />
            <Columns>
                <asp:BoundField HeaderText="Cant" DataField="cantidad" Visible="True" >
                <HeaderStyle CssClass="cabecera_columna_clientes columna_boton" />
                </asp:BoundField>
                <asp:BoundField HeaderText="Unid." DataField="unidad_medida" >
                <HeaderStyle CssClass="cabecera_columna_clientes columna_codigo" />
                </asp:BoundField>
                <asp:BoundField HeaderText="Descripcion" DataField="producto" >
                <HeaderStyle CssClass="cabecera_columna_clientes columna_producto" />
                </asp:BoundField>
                <asp:BoundField HeaderText="Precio Uni." DataField="precio" DataFormatString="{0:C}" >
                
                </asp:BoundField>
                <asp:BoundField HeaderText="Total" DataField="precio_total" DataFormatString="{0:C}" >
                <HeaderStyle CssClass="cabecera_columna_clientes columna_precio" />
                </asp:BoundField>
            </Columns>
            </asp:GridView></div>
        
        <ul class="vertical">
     <li><asp:Label ID="caja_subtotal" runat="server" CssClass="caja_sucursal"></asp:Label></li>
     <li><asp:Label ID="caja_iva" runat="server" CssClass="caja_sucursal"></asp:Label></li>
     <li><asp:Label ID="caja_total" runat="server" CssClass="caja_sucursal"></asp:Label></li>
     <li><asp:Label ID="etiqueta_subtotal" runat="server" CssClass="caja_sucursal"></asp:Label></li>
     <li><asp:Label ID="etiqueta_iva" runat="server" CssClass="caja_sucursal"></asp:Label></li>
     <li><asp:Label ID="etiqueta_total" runat="server" CssClass="caja_sucursal"></asp:Label></li>
      <li><asp:TextBox ID="caja_observaciones" runat="server" CssClass="caja_sucursal" 
             BorderStyle="None" Height="50px" Width="700px" TextMode="MultiLine" 
             Wrap="False"></asp:TextBox></li>
     <li><asp:TextBox ID="aclaraciones" runat="server" CssClass="caja_sucursal" 
             BorderStyle="None" Height="50px" Width="700px" TextMode="MultiLine" 
             Wrap="False"></asp:TextBox></li>
             <li><asp:TextBox ID="aclaracion_2" runat="server" CssClass="caja_sucursal" 
             BorderStyle="None" Height="50px" Width="700px" TextMode="MultiLine" 
             Wrap="False"></asp:TextBox></li>
    </ul>
    
 
        
      <div id="thanks"></div>
      
    </main>
    </form>
</body>
</html>
