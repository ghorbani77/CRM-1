<%@ Page Language="C#" AutoEventWireup="true" CodeFile="codigo/compatibilidades.aspx.cs" Inherits="compatibilidades" %>
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
        setInterval(function () {
            if (!mouse && !keyboard) {
                // var boton = document.getElementById('actualizar');
                // boton.click();
            }
            else {
                mouse = false;
                keyboard = false;
                window.opener.document.getElementById('caja_contador').value = "0";
            }
        }, 15000);
    })()
    function abrir() {
        window.moveTo(0, 0);
        window.resizeTo(screen.availWidth, screen.availHeight);
    }
    onload = abrir();

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

    function up() {
        posicionar_cursor();
        var boton = document.getElementById('buscar');
        boton.click();
    }
    function salir() {
        window.close();
    }
    function relacion_agregada() {
        alert("Relación agregada exitosamente.");
    }
    function relacion_eliminada() {
        alert("Relación eliminada exitosamente.");
    }
    function relacion_existente() {
        alert("Ya existe la relación.");
    }
    function iguales() {
        alert("No puede relacionar un producto consigo mismo.");
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Compatibilidades</title>
    <link rel="stylesheet" href="css/foundation.css" />
    <link rel="stylesheet" href="css/custom.css" />
    <script type="text/javascript" src="js/vendor/modernizr.js"></script>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800' rel='stylesheet' type='text/css'>
     <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
     <link rel="stylesheet" href="css/material-design-font.css">
     <style>
    
    </style>
</head>

<body bgcolor="#0080c0">
    <form id="form1" runat="server">
        <div class="large-12 ">            
            <div class="large-12 header-inventario header-prom">
                <span class="titulo left">BÚSQUEDA PRODUCTOS</span>
                <ul class="inline-list right ul-prom">
                    <li>
                        <asp:LinkButton ID="boton_salir" runat="server" onClick="boton_salir_Click" CssClass="boton_salir"  ToolTip="Regresar"><i class="fa fa-sign-out"></i><span>Regresar</span></asp:LinkButton>
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
                    <asp:Label ID="t_busqueda" runat="server" Text="" CssClass="medio"></asp:Label>
                </li>            
                <li>
                    <div class="cuadro_busqueda" style="width: 450px;">
                        <asp:TextBox ID="caja_busqueda" placeholder="Introduce un producto" runat="server" Enabled="True" CssClass="caja_busqueda" 
                            ontextchanged="caja_busqueda_TextChanged"  ></asp:TextBox> 
                            <asp:LinkButton ID="boton_buscar" runat="server" ToolTip="Buscar" Style="text-decoration: none;"
                                    OnClick="buscar_Click" ><i class="fa fa-gear"></i></asp:LinkButton>                       
                    </div> 
                </li>
                <li> </li>
            </ul> 
           <!--<asp:Button ID="buscar" runat="server"  Text="actualizar" onkeydown="buscar();" Visible="True" style="visibility:hidden" onclick="buscar_Click"/>-->                  
        </div>
        <div id="main_compatibilidades">
        <div class="large-12 columns borde-punteado-bottom  separador-top paneles_a">
            <asp:GridView ID="tabla_productos" runat="server" AutoGenerateColumns="False" DataKeyNames="codigo_proveedor"  DataSource='<%# datos_productos() %>' onrowcommand="tabla_productos_RowCommand" CssClass="tabla" ShowHeaderWhenEmpty="True" PageSize="50">
		    <PagerSettings Visible="False" />
		    <RowStyle CssClass="GridRow" HorizontalAlign="Left" />
            <Columns>
                
                <asp:BoundField HeaderText="Codigo Proveedor" DataField="codigo_proveedor" >
                 <HeaderStyle CssClass="cabecera_gridview" />
                </asp:BoundField>
                <asp:BoundField HeaderText="Producto" DataField="producto" >
                 <HeaderStyle CssClass="cabecera_gridview" />
                </asp:BoundField>
                           
                <asp:TemplateField HeaderText="Relacionar" ShowHeader="True">
                 <HeaderStyle CssClass="cabecera_gridview" />
                     <ItemTemplate>
                         <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" ToolTip="Crear relacion" 
                            CommandName="relacionar" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-check-square-o opcion_tabla"></i></asp:LinkButton>
                    </ItemTemplate>
                     <ItemStyle CssClass="control" />
                </asp:TemplateField>
                
            </Columns>
        </asp:GridView>
        </div>
       
        <div class="large-12 columns  paneles_b">
         <ul class="inline-list">
                <li><asp:Label ID="Label1" runat="server" Text="<b>Productos Relacionados</b>" CssClass="medio"></asp:Label></li>
                </ul>
            <asp:GridView ID="tabla_relaciones" runat="server" AutoGenerateColumns="False" DataKeyNames="codigo_proveedor"  DataSource='<%# datos_relaciones() %>' onrowcommand="tabla_relacion_RowCommand" CssClass="tabla" ShowHeaderWhenEmpty="True" PageSize="50">
		    <PagerSettings Visible="False" />
		    <RowStyle CssClass="GridRow" HorizontalAlign="Left" />
            <Columns>
                
                <asp:BoundField HeaderText="Codigo Proveedor" DataField="codigo_proveedor" >
                 <HeaderStyle CssClass="cabecera_gridview" />
                </asp:BoundField>
                 <asp:BoundField HeaderText="Producto" DataField="producto" >
                 <HeaderStyle CssClass="cabecera_gridview" />
                </asp:BoundField>

                <asp:TemplateField HeaderText="Eliminar" ShowHeader="True">
                 <HeaderStyle CssClass="cabecera_gridview" />
                     <ItemTemplate>
                         <asp:LinkButton ID="LinkButton12" runat="server" CausesValidation="False" ToolTip="Eliminar relacion" 
                            CommandName="eliminar" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-trash-o opcion_tabla"></i></asp:LinkButton>
                    </ItemTemplate>
                     <ItemStyle CssClass="control" />
                </asp:TemplateField>
                
            </Columns>
        </asp:GridView>
        </div>
        </div>
        </ContentTemplate>
        <Triggers>

        </Triggers>
    </asp:UpdatePanel>




    </form>
