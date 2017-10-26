<%@ Page Language="C#" AutoEventWireup="true" CodeFile="codigo/solicitud_factura_electronica.aspx.cs" Inherits="solicitud_factura_electronica" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script type="text/javascript">
    (function () {
        var mouse = false, keyboard = false;
        document.onmousemove = function () {
            mouse = true;
        };
        document.onkeydown = function () {
            keyboard = true;
        };
      
    })()
    function abrir() 
    {
        window.moveTo(0, 0);
        window.resizeTo(screen.availWidth, screen.availHeight);
    }
    onload = abrir();
   
    function salir() 
    {
        window.close();
    }
    function campo_vacio() 
    {
        alert('Error algun campo se encuentra vacio');
    }
    function usuario_existente() 
    {
        alert('Error cliente existente verifique el nombre del cliente');
    }

    function revisar_info() {
        alert('Error, seleccione un tipo de venta y/o un metodo de pago');
    }
    function pedido() {
        alert('Si no existe una venta no se puede solicitar la facturación');
    }
   
    window.onbeforeunload = salida;
    function salida() 
    {
        var botonsito = document.getElementById('boton_cancelar');
        botonsito.click();
    }
    function convertir_mover() {
        $("#panel_informacion_muestra").draggable();
    }
 
</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Solicitar Factura</title>
    <link rel="stylesheet" href="css/foundation.css" />
    <link rel="stylesheet" href="css/custom.css" />
    <link rel="stylesheet" href="css/melissa.css" />
    <link rel="stylesheet" href="css/mario.css" />
    <script type="text/javascript" src="js/vendor/modernizr.js"></script>
    <script type="text/javascript" src="javascript/funciones.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800' rel='stylesheet' type='text/css'/>
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="css/material-design-font.css"/>
</head>
<body bgcolor="#0080c0">
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="large-12 header-cotizaciones header-alta header-prom">
            <div class="controles">
                <span class="titulo left">Proceso de generar CFDI</span>
            </div>
            <ul class="inline-list right ul-prom">
                <li>
                    <asp:LinkButton ID="boton_cancelar" runat="server" CssClass="boton" ToolTip="Cancelar" ><i class="fa fa-sign-out icono_boton"></i></asp:LinkButton>
                    <span>Salir</span>
                </li>
            </ul>
        </div>
<!--------------------------------------------------------------------------------------------------------------------------------------------------------------->
        <div class="large-12 columns" >
            <ul class="lista_banco" >
                <li><asp:Label ID="tipo_factura" runat="server">Seleccionar Tipo de Factura:</asp:Label>
                    <asp:DropDownList ID="lista_tipo_factura" runat="server" CssClass="lista micha" AutoPostBack="True" Enabled="True" onselectedindexchanged="lista_metodos_SelectedIndexChanged">
                        <asp:ListItem>SELECCIONAR</asp:ListItem>
                        <asp:ListItem>INGRESO</asp:ListItem>
                        <asp:ListItem>EGRESO</asp:ListItem>
                        <asp:ListItem>PAGO</asp:ListItem>
                        <asp:ListItem>TRASLADO</asp:ListItem>
                        <asp:ListItem>NOMINA</asp:ListItem>
                    </asp:DropDownList></li> 
                                            
                <li><asp:Label ID="forma_pago" runat="server">Seleccionar Forma de Pago:</asp:Label>
                    <asp:DropDownList ID="lista_forma_pago" runat="server" CssClass="lista micha">
                        <asp:ListItem>SELECCIONAR</asp:ListItem>
                        <asp:ListItem>EFECTIVO</asp:ListItem>
                        <asp:ListItem>CHEQUE</asp:ListItem>
                        <asp:ListItem>TRANSFERENCIA</asp:ListItem>
                        <asp:ListItem>TARJETA DE CREDITO</asp:ListItem>
                        <asp:ListItem>MONEDERO ELECTRONICO</asp:ListItem>
                        <asp:ListItem>DINERO ELECTRONICO</asp:ListItem>
                        <asp:ListItem>VALES DE DESPENSA</asp:ListItem>
                        <asp:ListItem>REMISION DE DEUDA</asp:ListItem>
                        <asp:ListItem>TARJETA DE DEBITO</asp:ListItem>
                        <asp:ListItem>TARJETA DE SERVICIOS</asp:ListItem>
                        <asp:ListItem>POR DEFINIR</asp:ListItem>
                    </asp:DropDownList></li> 

                <li><asp:Label ID="tipo_pago" runat="server">Seleccionar Tipo de Pago:</asp:Label>
                    <asp:DropDownList ID="lista_tipo_pago" runat="server" CssClass="lista micha" AutoPostBack="True" Enabled="True" onselectedindexchanged="lista_metodos_SelectedIndexChanged">
                        <asp:ListItem>SELECCIONAR</asp:ListItem>
                        <asp:ListItem>PAGO EN UNA SOLA EXHIBICION</asp:ListItem>
                        <asp:ListItem>PAGO INICIAL Y PARCIALIDADES</asp:ListItem>
                        <asp:ListItem>PAGO EN PARCIALES O DIFERIDO</asp:ListItem>
                    </asp:DropDownList></li> 

                <li><asp:Label ID="cliente_facturar" runat="server">Seleccionar Cliente:</asp:Label>
                    <asp:DropDownList ID="lista_cliente_facturar" runat="server" CssClass="lista micha" AutoPostBack="True" Enabled="True" OnSelectedIndexChanged="lista_cliente_facturar_SelectedIndexChanged">
                        <asp:ListItem>SELECCIONAR</asp:ListItem>
                    </asp:DropDownList></li> 

                <li><asp:Label ID="cotizacion_facturar" runat="server" Visible ="false">Seleccionar Cotizacion:</asp:Label>
                    <asp:DropDownList ID="lista_cotizacion_facturar" runat="server" CssClass="lista micha" AutoPostBack="True" Enabled="true" Visible ="false" OnSelectedIndexChanged="lista_cotizacion_facturar_SelectedIndexChanged">
                    </asp:DropDownList></li> 
                </ul>
                <!--               
                <li><asp:Panel ID="parte_banco" runat="server">
                    <ul class="lista_banco">
                        <li>Banco:</li> <li><asp:TextBox ID="banco" runat="server" CssClass="caja_mini micha" ></asp:TextBox></li>
                        <li>4 dígitos </li><li><asp:TextBox ID="digitos" runat="server" CssClass="caja_super_mini micha" MaxLength="4" Style="text-transform: uppercase"></asp:TextBox></li>
                    </ul>
                </asp:Panel></li>
                     

               <li><asp:Label ID="Label3" runat="server" CssClass="texto">Cotizaciones extra:</asp:Label></li>
               <li><asp:TextBox ID="cotizaciones" runat="server" CssClass="caja_mini micha" ></asp:TextBox></li>           
               <li><asp:Label ID="Label5" runat="server" CssClass="texto">Incluir Requisición </asp:Label></li>
               <li><asp:CheckBox ID="requisicion" runat="server" CssClass="caja_mini micha" ></asp:CheckBox></li>                                                                    
            </ul>                     
            <ul>
                <asp:LinkButton ID="LinkButton1" runat="server"
                    ToolTip="Guardar información del cliente" style="text-decoration:none;"
                    CssClass="boton_guardar button small success" OnClick="actualizar_tabla"
                    Visible="True">Actualizar tabla
                </asp:LinkButton>
            </ul>  
            -->                                 
<!-------------------------------------------------------------------------------->
            <asp:GridView ID="tabla_facturacion_electronica" runat="server" AutoGenerateColumns="False" DataKey="codigo" DataSource='<%# insertar_tabla_productos() %>' CssClass="tabla" ShowHeaderWhenEmpty="True" PageSize="50">
		        <PagerSettings Visible="False" />
		        <RowStyle CssClass="GridRow" HorizontalAlign="Center" />
                <Columns>
                    <asp:TemplateField >
                    <ItemTemplate>
                        <asp:CheckBox ID="validador_facturacion" runat="server" Checked="true"/>
                    </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="Código" DataField="codigo_facturacion_electronica" >
                     <HeaderStyle CssClass="cabecera_gridview" /> 
                    </asp:BoundField>
                    <asp:BoundField HeaderText="Producto" DataField="producto_facturacion_electronica" >
                     <HeaderStyle CssClass="cabecera_gridview" />
                    </asp:BoundField>
                    <asp:BoundField HeaderText="Cantidad" DataField="cantidad_facturacion_electronica" >
                     <HeaderStyle CssClass="cabecera_gridview" />
                    </asp:BoundField>
                    <asp:BoundField HeaderText="Precio" DataField="precio_facturacion_electronica">
                     <HeaderStyle CssClass="cabecera_gridview" />
                    </asp:BoundField>          
                    <asp:BoundField HeaderText="Clave" DataField="clave_facturacion_electronica">
                     <HeaderStyle CssClass="cabecera_gridview" />
                    </asp:BoundField>                            
                </Columns> 
            </asp:GridView>
<!-------------------------------------------------------------------------------->       
            <ul>
                <asp:LinkButton ID="boton_guardar" runat="server"
                    ToolTip="Guardar información del cliente" style="text-decoration:none;" 
                    CssClass="boton_guardar button small success" OnClick="guardar_metodo_pago"
                    Visible="True">Solicitar factura
                </asp:LinkButton>
            </ul>
        </div>
        <div>
           
            <asp:Panel ID="panel_informacion_muestra" runat="server" CssClass ="panel_sobrepuesto_tabla_muestra_facturacion_electronica" Visible ="false">
                    <ul class="lista_banco">                     
                        <asp:GridView ID="tabla_informacion_muestra" runat="server" AutoGenerateColumns="False" DataKey="codigo" DataSource='<%# insertar_tabla_muestra() %>' CssClass="tabla" ShowHeaderWhenEmpty="True" PageSize="50">
		                    <PagerSettings/>
		                    <RowStyle CssClass="GridRow" HorizontalAlign="Center" />
                            <Columns>
                                <asp:BoundField HeaderText="Código" DataField="codigo_informacion_muestra" >
                                <HeaderStyle CssClass="cabecera_gridview" /> 
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Producto" DataField="producto_informacion_muestra" >
                                <HeaderStyle CssClass="cabecera_gridview" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Cantidad" DataField="cantidad_informacion_muestra" >
                                <HeaderStyle CssClass="cabecera_gridview" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Precio" DataField="precio_informacion_muestra">
                                <HeaderStyle CssClass="cabecera_gridview" />
                                </asp:BoundField>                           
                            </Columns> 
                        </asp:GridView>
                    </ul>
                <asp:Label ID="marcador_requisicion_muestra" runat="server" Visible="false">Incluir Requisicion ?</asp:Label>
                <asp:CheckBox ID="verificar_requisicion_muestra" runat="server" Visible="false"/>
                <asp:Label ID="mensaje_informacion_muestra" runat="server">Desea Agregar esta cotizacion?</asp:Label>
                <asp:LinkButton ID="boton_informacion_muestra_si" runat="server" style="text-decoration:none;" OnClick="boton_informacion_muestra_si_Click">SI</asp:LinkButton>
                <asp:LinkButton ID="boton_informacion_muestra_no" runat="server" style="text-decoration:none;" OnClick="boton_informacion_muestra_no_Click">NO</asp:LinkButton>
            </asp:Panel>
        </div>  
    </form>
</body>
</html>
