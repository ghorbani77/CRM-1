<%@ Page Language="C#" AutoEventWireup="true" CodeFile="codigo/imprimir_cotizacion_distribuidor.aspx.cs" Inherits="imprimir_cotizacion_distribuidor" %>
<script type="text/javascript" language="javascript">
    function salir() 
    {
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
    function cerrar() 
    {
        document.location.href = "editar_cotizacion.aspx";
    }
</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Imprimir Cotizacion</title>
    <link href="css/imprimir_cotizacion.css" rel="stylesheet" type="text/css" />
     <script type="text/javascript" src="javascript/funciones.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="principal">
    <div class="cabecera">
    <div class="cabecera_izq">
    <ul class="vertical">
    <li><img class="logo_cotizacion" src="img/logo-dds.png" width="100px" /></li>
    <li><asp:Label ID="caja_sucursal" runat="server" CssClass="caja_sucursal"></asp:Label></li>
    <li><asp:Label ID="caja_domicilio" runat="server" CssClass="caja_sucursal"></asp:Label></li>
    <li><asp:Label ID="caja_ciudad" runat="server" CssClass="caja_sucursal"></asp:Label></li>
    </ul>
    <ul class="vertical">
    <li><asp:Label ID="caja_nombre" runat="server" CssClass="caja_sucursal"></asp:Label></li>
    <li><asp:Label ID="caja_correo" runat="server" CssClass="caja_sucursal"></asp:Label></li>
    <li><asp:Label ID="caja_fecha" runat="server" CssClass="caja_sucursal"></asp:Label></li>
    </ul>
    </div>
    <div class="cabecera_der">
    <ul class="vertical">
     <li><asp:Label ID="caja_cotizacion" runat="server" CssClass="caja_sucursal"></asp:Label></li>
     <li><asp:Label ID="caja_nombre_vendedor" runat="server" CssClass="caja_sucursal"></asp:Label></li>
     <li><asp:Label ID="caja_telefono" runat="server" CssClass="caja_sucursal"></asp:Label></li>
     <li><asp:Label ID="caja_moneda" runat="server" CssClass="caja_sucursal"></asp:Label></li>
     <li><asp:Label ID="caja_usuario" runat="server" CssClass="caja_sucursal"></asp:Label></li>
    </ul>
    </div>
    </div>
    <div class="separador">
    </div>
    <div class="lista_productos">
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
                <HeaderStyle CssClass="cabecera_columna_clientes columna_precio" />
                </asp:BoundField>
                <asp:BoundField HeaderText="Total" DataField="precio_total" DataFormatString="{0:C}" >
                <HeaderStyle CssClass="cabecera_columna_clientes columna_precio" />
                </asp:BoundField>
            </Columns>
        </asp:GridView> 
    </div>
    <div class="separador">
    </div>
    <div class="datos_pie_pagina">
    <div class="pie_pagina_der">
    <ul class="vertical">
     <li><asp:Label ID="caja_subtotal" runat="server" CssClass="caja_sucursal"></asp:Label></li>
     <li><asp:Label ID="caja_iva" runat="server" CssClass="caja_sucursal"></asp:Label></li>
     <li><asp:Label ID="caja_total" runat="server" CssClass="caja_sucursal"></asp:Label></li>
        <li><asp:Label ID="etiqueta_subtotal" runat="server" CssClass="caja_sucursal"></asp:Label></li>
     <li><asp:Label ID="etiqueta_iva" runat="server" CssClass="caja_sucursal"></asp:Label></li>
     <li><asp:Label ID="etiqueta_total" runat="server" CssClass="caja_sucursal"></asp:Label></li>
     <li><asp:TextBox ID="aclaraciones" runat="server" CssClass="caja_sucursal" 
             BorderStyle="None" Height="50px" Width="700px" TextMode="MultiLine" 
             Wrap="False"></asp:TextBox></li>
             <li><asp:TextBox ID="aclaracion_2" runat="server" CssClass="caja_sucursal" 
             BorderStyle="None" Height="50px" Width="700px" TextMode="MultiLine" 
             Wrap="False"></asp:TextBox></li>
    </ul>
    </div>
    </div>
    </div>
    </form>
</body>
</html>
