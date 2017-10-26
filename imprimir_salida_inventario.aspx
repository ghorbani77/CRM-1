<%@ Page Language="C#" AutoEventWireup="true" CodeFile="codigo/imprimir_salida_inventario.aspx.cs" Inherits="imprimir_salida_inventario" %>

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
        document.location.href = "inventario.aspx";
    }
</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Ticket de almacen</title>
    <link href="css/imprimir_cotizacion.css" rel="stylesheet" type="text/css" />
     <script type="text/javascript" src="javascript/funciones.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="principal">
    <div class="cabecera">
    <div class="cabecera_izq">
    <ul class="vertical">
    <li><img class="logo_cotizacion" src="img/logo.png" width="150px" /></li>
    <li><asp:Label ID="titulo" runat="server" CssClass="caja_sucursal"></asp:Label></li>
    </ul>
    </div>
    <div class="cabecera_der">
    <ul class="vertical">
     <li><asp:Label ID="caja_salida_inventario" runat="server" CssClass="caja_sucursal"></asp:Label></li>
    </ul>
    </div>
    </div>
    <div class="separador">
    </div>
    <div class="lista_productos">
    <asp:GridView ID="tabla_salidas_inventario" runat="server" CssClass="tabla" DataSource='<%# datos_salida_inventario() %>'  
            ShowHeaderWhenEmpty="True" AutoGenerateColumns="False"
            PagerSettings-Visible = "false">
            <HeaderStyle CssClass="GridHeader" />
		    <PagerSettings Visible="False" />
		    <RowStyle CssClass="GridRow" HorizontalAlign="Left" />
		    <AlternatingRowStyle CssClass="GridAlternateRow" />
            <Columns>
            <asp:BoundField HeaderText="Codigo Proveedor" DataField="codigo_proveedor" DataFormatString="{0:C}" >
                <HeaderStyle CssClass="cabecera_columna_clientes columna_precio" />
                </asp:BoundField>
                <asp:BoundField HeaderText="Descripcion" DataField="producto" >
                <HeaderStyle CssClass="cabecera_columna_clientes columna_producto" />
                </asp:BoundField>
                <asp:BoundField HeaderText="Comentarios" DataField="comentarios" >
                <HeaderStyle CssClass="cabecera_columna_clientes columna_producto" />
                </asp:BoundField>
                <asp:BoundField HeaderText="Cantidad" DataField="cantidad" Visible="True" >
                <HeaderStyle CssClass="cabecera_columna_clientes columna_boton" />
                </asp:BoundField>
                <asp:BoundField DataField="fecha_salida" 
                    HeaderText="Fecha" SortExpression="fecha" DataFormatString="{0:d}" />
            </Columns>
        </asp:GridView> 
    </div>
    <div class="separador">
    </div>
    <div class="datos_pie_pagina">
    <div class="pie_pagina_der">
    <ul class="vertical">
     <li><asp:Label ID="caja_productos" runat="server" CssClass="caja_sucursal"></asp:Label></li>
    </ul>
    </div>
    </div>
    </div>
    </form>
</body>
</html>
