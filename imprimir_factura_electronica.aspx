<%@ Page Language="C#" AutoEventWireup="true" CodeFile="codigo/imprimir_factura_electronica.aspx.cs" Inherits="imprimir_factura_electronica" %>
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
        //document.location.href = "editar_cotizacion.aspx";
    }
    window.onbeforeunload = salida;
    function salida() {
        var proceso = 0;
        if (proceso == 0) {
            proceso = 1;
            //document.location.href = "editar_cotizacion.aspx";
        }
    }
</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Facturacion Electronica - Inklaser</title>
    <link rel="stylesheet" href="stylex.css" media="all" />
    <script type="text/javascript" src="javascript/funciones.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <header class="clearfix">
        <div id="">
            <img class="logo_cotizacion" src="img/logo-inklaser-recortado.png"/>
        </div>
        <div id="company">
            <h2 class="name"><asp:Label ID="caja_sucursal" runat="server" CssClass="caja_sucursal"></asp:Label></h2>
            <div><asp:Label ID="caja_rfc" runat="server" CssClass="caja_sucursal"></asp:Label></div>
            <div><asp:Label ID="caja_no_certificado" runat="server" CssClass="caja_sucursal"></asp:Label></div>
            <div><asp:Label ID="caja_lugar_fecha" runat="server" CssClass="caja_sucursal"></asp:Label></div>
            <div><asp:Label ID="caja_regimen" runat="server" CssClass="caja_sucursal"></asp:Label></div>
            <div><asp:Label ID="caja_tipo_factura" runat="server" CssClass="caja_sucursal"></asp:Label></div>
            <div><asp:Label ID="caja_folio_factura" runat="server" CssClass="caja_sucursal"></asp:Label></div>
            <div><asp:Label ID="caja_id_clente" runat="server" CssClass="caja_sucursal"></asp:Label></div>
            <div><asp:Label ID="caja_orden_compra" runat="server" CssClass="caja_sucursal"></asp:Label></div>
            <div><asp:Label ID="caja_fecha_vencimiento" runat="server" CssClass="caja_sucursal"></asp:Label></div>
       </div>
    </header>
    <main>
        <div id="details" class="clearfix">
            <div id="client">
                <div><asp:Label ID="caja_nombre_cliente" runat="server" CssClass="caja_sucursal"></asp:Label></div>           
                <div><asp:Label ID="caja_residencia_fiscal_cliente" runat="server" CssClass="caja_sucursal"></asp:Label></div>
                <div><asp:Label ID="caja_rfc_cliente" runat="server" CssClass="caja_sucursal"></asp:Label></div>
                <div><asp:Label ID="caja_uso_cfdi_cliente" runat="server" CssClass="caja_sucursal"></asp:Label></div>
            </div>
            <div id="datos_total">
                <div><asp:Label ID="caja_subtotal" runat="server" CssClass="caja_sucursal"></asp:Label></div>
                <div><asp:Label ID="caja_descuento" runat="server" CssClass="caja_sucursal"></asp:Label></div>
                <div><asp:Label ID="caja_impuesto" runat="server" CssClass="caja_sucursal"></asp:Label></div>
                <div><asp:Label ID="caja_tipo_moneda" runat="server" CssClass="caja_sucursal"></asp:Label></div>
                <div><asp:Label ID="caja_total" runat="server" CssClass="caja_sucursal"></asp:Label></div>
            </div>
            <div id="datos_factura">
                <div><asp:Label ID="caja_forma_pago" runat="server" CssClass="caja_sucursal"></asp:Label></div>
                <div><asp:Label ID="caja_metodo_pago" runat="server" CssClass="caja_sucursal"></asp:Label></div>
                <div><asp:Label ID="caja_folio_fiscal" runat="server" CssClass="caja_sucursal"></asp:Label></div>
                <div><asp:Label ID="caja_fecha_timbrado" runat="server" CssClass="caja_sucursal"></asp:Label></div>
                <div><asp:Label ID="caja_certificado_sat" runat="server" CssClass="caja_sucursal"></asp:Label></div>
            </div>
        </div>
      - <asp:GridView ID="tabla_productos" runat="server" CssClass="tabla" DataSource='<%# datos_productos() %>'  
            ShowHeaderWhenEmpty="True" AutoGenerateColumns="False"
            PagerSettings-Visible = "false">
            <HeaderStyle CssClass="GridHeader" />
		    <PagerSettings Visible="False" />
		    <RowStyle CssClass="GridRow" HorizontalAlign="Left"/>
		    <AlternatingRowStyle CssClass="GridAlternateRow" />
            <Columns>
                <asp:BoundField HeaderText="CLAVE ID" DataField="clave_id" Visible="True">
                </asp:BoundField>
                <asp:BoundField HeaderText="UNIDAD" DataField="unidad">
                </asp:BoundField>
                <asp:BoundField HeaderText="DESCRIPCION" DataField="descripcion">
                </asp:BoundField>
                <asp:BoundField HeaderText="CANTDAD" DataField="cantidad" >
                </asp:BoundField>
                <asp:BoundField HeaderText="VALOR" DataField="precio_valor" DataFormatString="{0:C}" >
                </asp:BoundField>
                <asp:BoundField HeaderText="IMPORTE" DataField="precio_importe" DataFormatString="{0:C}" >
                </asp:BoundField>
                <asp:BoundField HeaderText="DESCUENTO" DataField="precio_descuento" DataFormatString="{0:C}" >
                </asp:BoundField>
                <asp:BoundField HeaderText="BASE" DataField="precio_base" DataFormatString="{0:C}" >
                </asp:BoundField>
                <asp:BoundField HeaderText="IMPUESTO" DataField="precio_impuesto" DataFormatString="{0:C}" >
                </asp:BoundField>
                <asp:BoundField HeaderText="TOTAL" DataField="precio_total" DataFormatString="{0:C}" >
                </asp:BoundField>
            </Columns>
        </asp:GridView>
        <div id = "datos_QR">
            <div><asp:Label ID="cadena_timbre" runat="server" CssClass="caja_sucursal"></asp:Label></div>
            <div><asp:Label ID="sello_digital_sat" runat="server" CssClass="caja_sucursal"></asp:Label></div>
            <div><asp:Label ID="sello_digital_emisor" runat="server" CssClass="caja_sucursal"></asp:Label></div>
        </div>
        <div id = "QR">
            <asp:Image ID="img" runat="server"/>
        </div>
        <ul class="vertical">
            <li><asp:TextBox ID="aclaracion" runat="server" CssClass="caja_sucursal" 
                BorderStyle="None" TextMode="MultiLine" 
                Wrap="False"></asp:TextBox>
            </li>
        </ul> 
    </main>
    </form>
 </body>
</html>

