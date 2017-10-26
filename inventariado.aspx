<%@ Page Language="C#" AutoEventWireup="true" CodeFile="codigo/inventariado.aspx.cs" Inherits="inventariado" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script type="text/javascript">
    function abrir() 
    {
        window.moveTo(0, 0);
        window.resizeTo(screen.availWidth, screen.availHeight);
    }
    onload = abrir();
    function verificar_enter(e) 
    {
        var key_press = document.all ? key_press = e.keyCode : key_press = e.which;
        if (key_press == 13) {
            var boton = document.getElementById('buscar');
            boton.click();
        }
    }
    function campo_vacio() 
    {
        alert('Error algun campo se encuentra vacio');
    }
    function listo() 
    {
        alert('Datos ingresados correctamente');
    }
    function salir() 
    {
        window.close();
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Inspeccion de inventario - Inklaser</title>
    <link rel="stylesheet" href="css/foundation.css" />
    <link rel="stylesheet" href="css/custom.css" />
    <script src="js/vendor/modernizr.js"></script>
    <script src="javascript/funciones.js"></script>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800' rel='stylesheet' type='text/css'>
     <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
     <link rel="stylesheet" href="css/material-design-font.css">
</head>

<body bgcolor="#0080c0">
    <form id="form1" runat="server">
        <div class="large-12 ">            
            <div class="large-12 header-inventario header-prom">
                <span class="titulo left">INVENTARIADO</span>
                <ul class="inline-list right ul-prom">
                    <li>
                        <asp:LinkButton ID="boton_salir" runat="server" onClick="boton_salir_Click" CssClass="boton_salir"  ToolTip="Salir"><i class="fa fa-sign-out"></i><span>Salir</span></asp:LinkButton>
                    </li>
                </ul>   
            </div>
        </div>

      <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <div class="large-12 columns borde-punteado-bottom separador-top" style="height:80px;">
            <ul class="inline-list">
                <li>
                    <asp:Label ID="t_busqueda" runat="server" Text="Código de barras: " CssClass="medio"></asp:Label>
                </li>            
                <li>
                    <div class="cuadro_busqueda">
                        <asp:TextBox ID="caja_busqueda" placeholder="Codigo de Barras" runat="server" Enabled="True" CssClass="caja_busqueda" ></asp:TextBox> 
                        <asp:LinkButton ID="boton_buscar" runat="server" ToolTip="Buscar" CssClass="button alert" Style="text-decoration: none;" OnClick="buscar_click" OnClientClick="activar_boton_buscar_oculto();"><i class="fa fa-gear"></i></asp:LinkButton>                    
                    </div> 
                </li>
                <li>
                                    
                 </li>
            </ul> 
           <asp:Button ID="buscar" runat="server"  Text="Buscar" Enabled="true" onkeydown="buscar();" Visible="True"  style="visibility:hidden" onclick="buscar_click"/>              
        </div>

        <div class="large-12 columns inventariado_arriba separador-top">
            <asp:GridView ID="tabla_producto" runat="server" AutoGenerateColumns="False" DataKeyNames="id"  DataSource='<%# datos_producto() %>'  CssClass="tabla" ShowHeaderWhenEmpty="True" PageSize="50">
		        <PagerSettings Visible="True" />
		        <RowStyle CssClass="GridRow" HorizontalAlign="Left" />
                <Columns>
                    <asp:BoundField HeaderText="Id" DataField="id" >
                        <HeaderStyle CssClass="cabecera_gridview" />
                    </asp:BoundField>
                    <asp:BoundField HeaderText="Producto" DataField="producto" >
                        <HeaderStyle CssClass="cabecera_gridview" />
                    </asp:BoundField>
                    <asp:BoundField HeaderText="Codigo Proveedor" DataField="codigo_proveedor" >
                        <HeaderStyle CssClass="cabecera_gridview" />
                    </asp:BoundField>
                    <asp:BoundField HeaderText="Cantidad" DataField="cantidad" >
                        <HeaderStyle CssClass="cabecera_gridview" />
                    </asp:BoundField>
                </Columns>
            </asp:GridView>
       </div>
        <div class="inventariado_abajo ">
            <asp:Panel ID="opciones" runat="server" class="controles_inventariado">
                <ul class="listado">
                    <li><br /><br /><p>Estado del inventario</p>
                        <asp:CheckBox ID="completo" Text="Completo" runat="server" AutoPostBack="True" oncheckedchanged="completo_CheckedChanged" />
                    </li>
                    <li>
                        <p>Cantidad Fisica</p>
                        <asp:TextBox ID="caja_cantidad" CssClass="med" runat="server"></asp:TextBox>
                    </li>
                    <li>
                        <p>Comentarios</p>
                        <asp:TextBox ID="comentarios" CssClass="med" runat="server" TextMode="MultiLine" Style="text-transform: uppercase"></asp:TextBox>
                    </li>
                </ul>
                <asp:LinkButton ID="boton_guardar" runat="server" CssClass="button tiny alert" onclick="guardar_comentario" Text="Guardar" ></asp:LinkButton>
            </asp:Panel>          
                       
        </div>
     </ContentTemplate>
        <Triggers></Triggers>
    </asp:UpdatePanel>
    </form>

