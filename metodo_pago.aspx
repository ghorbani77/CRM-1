<%@ Page Language="C#" AutoEventWireup="true" CodeFile="codigo/metodo_pago.aspx.cs" Inherits="metodo_pago" %>
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
    
    function correo_invalido() 
    {
        alert('Error el correo no es valido verificar');
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

  
</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Solicitar Factura</title>
    <link rel="stylesheet" href="css/foundation.css" />
    <link rel="stylesheet" href="css/custom.css" />
    <link rel="stylesheet" href="css/melissa.css" />
    <script type="text/javascript" src="js/vendor/modernizr.js"></script>
    <script type="text/javascript" src="javascript/funciones.js"></script>
    <script src="http://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800' rel='stylesheet' type='text/css'>
      <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
      <link rel="stylesheet" href="css/material-design-font.css">
</head>

<body bgcolor="#0080c0">
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <ContentTemplate>
        <div class="large-12 header-cotizaciones header-alta header-prom">
            <div class="controles">
                <span class="titulo left">Método de pago</span>
            </div>
            <ul class="inline-list right ul-prom">
                <li>
                    <asp:LinkButton ID="boton_cancelar" runat="server" CssClass="boton" OnClick="boton_salir_Click" ToolTip="Cancelar" ><i class="fa fa-sign-out icono_boton"></i></asp:LinkButton>
                    <span>Salir</span>
               </li>
            </ul>
        </div>
<!--------------------------------------------------------------------------------------------------------------------------------------------------------------->
        <div class="large-12 columns" >          
           <ul class="lista_banco" >                
                     <li><asp:Label ID="tipo" runat="server">Tipo de venta</asp:Label> 
                    <asp:DropDownList ID="tipo_venta" runat="server" CssClass="lista micha">
                        <asp:ListItem>SELECCIONAR</asp:ListItem>
                        <asp:ListItem>CONTADO</asp:ListItem>
                        <asp:ListItem>CREDITO</asp:ListItem>
                        <asp:ListItem>COD</asp:ListItem>
                        <asp:ListItem>REMISION</asp:ListItem>
                    </asp:DropDownList></li> 
                           
                    <li> <asp:Label ID="Label1" runat="server">  Método de pago</asp:Label>
                    <asp:DropDownList ID="metodo_de_pago" runat="server" CssClass="lista micha" AutoPostBack="True" Enabled="True" >
                        <asp:ListItem>SELECCIONAR</asp:ListItem>
                        <asp:ListItem>EFECTIVO</asp:ListItem>
                        <asp:ListItem>TARJETA DE CREDITO</asp:ListItem>
                        <asp:ListItem>TARJETA DE DEBITO</asp:ListItem>
                        <asp:ListItem>TRANSFERENCIA</asp:ListItem>
                        <asp:ListItem>CHEQUE</asp:ListItem>
                    </asp:DropDownList></li>                  
                               
                    <li> <asp:Panel ID="parte_banco" runat="server">
                      <ul class="lista_banco" > 
                          <li>Banco:</li> <li><asp:TextBox ID="banco" runat="server" CssClass="caja_mini micha" ></asp:TextBox></li>
                          <li>4 dígitos </li><li><asp:TextBox ID="digitos" runat="server" CssClass="caja_super_mini micha" MaxLength="4" Style="text-transform: uppercase"></asp:TextBox></li>
                      </ul>
                    </asp:Panel></li>        
           
                <li><asp:Label ID="Label3" runat="server" CssClass="texto">Cotizaciones extra:</asp:Label></li>
                <li><asp:TextBox ID="cotizaciones" runat="server" CssClass="caja_mini micha" ></asp:TextBox></li>
            
                <!--<li><asp:Label ID="Label5" runat="server" CssClass="texto">Incluir Requisición </asp:Label></li>
                <li><asp:CheckBox ID="requisicion" runat="server" CssClass="caja_mini micha" ></asp:CheckBox></li> -->
                                                                    
                <li><p><asp:Label ID="Label2" runat="server" CssClass="texto">Comentarios</asp:Label></li>
                <li><asp:TextBox ID="comentarios" runat="server" CssClass="caja_mini micha" ></asp:TextBox></li>     
                                    
                <li><asp:Label ID="Label4" runat="server" CssClass="texto">Adjuntar archivos</asp:Label></li>                            
                <li><asp:FileUpload ID="archivo_adjunto" runat="server" />            </li> 
            </ul>       
               
               <ul>
                <asp:LinkButton ID="LinkButton1" runat="server" ToolTip="Actualizar la onformación de la tabla" style="text-decoration:none;" CssClass="boton_guardar button small success" OnClick="actualizar_tabla" Visible="True">Actualizar tabla</asp:LinkButton>
             </ul>
     
<!-------------------------------------------------------------------------------->

  <asp:GridView ID="tabla" runat="server" AutoGenerateColumns="False" DataKey="codigo,clave" DataSource='<%# insertar_tabla_productos() %>' CssClass="tabla" ShowHeaderWhenEmpty="True" PageSize="50">
		        <PagerSettings Visible="False" />
		        <RowStyle CssClass="GridRow" HorizontalAlign="Center" />
                <Columns>
                    <asp:TemplateField >
                    <ItemTemplate>
                        <asp:CheckBox ID="facturacion" runat="server" Checked=true/>
                    </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="Código" DataField="codigo" >
                     <HeaderStyle CssClass="cabecera_gridview" /> 
                    </asp:BoundField>
                    <asp:BoundField HeaderText="Producto" DataField="producto" >
                     <HeaderStyle CssClass="cabecera_gridview" />
                    </asp:BoundField>
                    <asp:BoundField HeaderText="Cantidad" DataField="cantidad" >
                     <HeaderStyle CssClass="cabecera_gridview" />
                    </asp:BoundField>
                    <asp:BoundField HeaderText="Precio" DataField="precio"  >
                     <HeaderStyle CssClass="cabecera_gridview" />
                    </asp:BoundField>   
                    <asp:BoundField HeaderText="Clave" DataField="clave"  >
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
    </ContentTemplate>
  
    </form>
        
            <!--#include virtual="footer.aspx"--> 

