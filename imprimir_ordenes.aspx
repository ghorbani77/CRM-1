<%@ Page Language="C#" AutoEventWireup="true" CodeFile="codigo/imprimir_ordenes.aspx.cs" Inherits="imprimir_ordenes" %>
<script type="text/javascript" language="javascript">
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
    function cerrar() 
    {
        document.location.href = "editar_cotizacion.aspx";
    }
    function salir() 
    {
        window.close();
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
          <div><asp:Label ID="caja_telefono_sucursal" runat="server" CssClass="caja_sucursal"></asp:Label></div>
     <div><asp:Label ID="caja_usuario" runat="server" CssClass="caja_sucursal"></asp:Label></div>

          
             </div>
      </div>
    </header>
    <main>
      <div id="details" class="clearfix">
        <div id="client">
          <div class="to"><asp:Label ID="caja_proveedor" runat="server" CssClass="caja_sucursal"></asp:Label></div>

          <h2 class="name"><asp:Label ID="caja_direccion" runat="server" CssClass="caja_sucursal"></asp:Label></h2>
     
          <div class="email"><asp:Label ID="caja_correo" runat="server" CssClass="caja_sucursal"></asp:Label></div>

          
        </div>
        <div id="invoice">
          <h1><asp:Label ID="caja_orden_compra" runat="server" CssClass="caja_sucursal"></asp:Label></h1>
          <h1><asp:Label ID="caja_nombre_vendedor" runat="server" CssClass="caja_sucursal"></asp:Label></h1>
          <h1><asp:Label ID="caja_telefono" runat="server" CssClass="caja_sucursal"></asp:Label></h1>
          <h1><asp:Label ID="caja_cliente" runat="server" CssClass="caja_sucursal"></asp:Label></h1>
          <h1><asp:Label ID="caja_firma" runat="server" CssClass="caja_sucursal"></asp:Label></h1>
        </div>
      </div>
        
        
        
          <ul class="vertical">
     <li><asp:Label ID="caja_fecha" runat="server" CssClass="caja_sucursal"></asp:Label></li>
     <li><asp:Label ID="caja_tipo_cambio" runat="server" CssClass="caja_sucursal"></asp:Label></li>
     <li><asp:Label ID="caja_envio" runat="server" CssClass="caja_sucursal"></asp:Label></li>
    </ul>
        
        
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
                <asp:BoundField HeaderText="Code" DataField="codigo_proveedor" >
                <HeaderStyle CssClass="cabecera_columna_clientes columna_codigo" />
                </asp:BoundField>
                <asp:BoundField HeaderText="Descripcion" DataField="producto" >
                <HeaderStyle CssClass="cabecera_columna_clientes columna_producto" />
                </asp:BoundField>
                <asp:BoundField HeaderText="Cost Uni." DataField="costo" DataFormatString="{0:C}" >
                </asp:BoundField>
                <asp:BoundField HeaderText="Total" DataField="costo_total" DataFormatString="{0:C}" >
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
    </ul> 
      
      
        
        
      <div id="thanks">Gracias!</div>
      
    </main>
    </form>
    

    
    
    
  </body>
    
    
</html>
