<%@ Page Language="C#" AutoEventWireup="true" CodeFile="codigo/proveedores.aspx.cs" Inherits="proveedores" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
 <link rel="stylesheet" href="css/proveedores.css" />
 <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" rel="stylesheet">
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
 <script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <script type="text/javascript">
        $('input[type=text]').addClass('cajas_felonas');
        $(function () {
            var $rows = $('#tabla_proveedores tr[class!="cabezera"]');
            $('#buscar').keyup(function () {
                var val = $.trim($(this).val()).replace(/ +/g, ' ').toLowerCase();
                $rows.show().filter(function () {
                    var text = $(this).text().replace(/\s+/g, ' ').toLowerCase();
                    return ! ~text.indexOf(val);
                }).hide();
            });
        });
        $(function () {
            $('.esconder').click(function () {
                var id_boton = $(this).attr("id");
                $('td:nth-child(' + id_boton + '),th:nth-child(' + id_boton + ')').toggle();
                $(this).toggleClass("mostrar");
            });
        });
        function mostrar() {
            $('#controles').dialog();
        }
    </script>
    <title>Proveedores</title>
</head>
<body class ="fondo">
    <form id="form1" runat="server">
    <div>
     <div class="cabezara_principal">
           <div >
                    <asp:LinkButton ID="filtro_ventas" runat="server" CssClass="boton" ToolTip="Reportes de sucursales"  Enabled="True"></asp:LinkButton>         
                    <asp:LinkButton ID="salir" runat="server" CssClass="boton" ToolTip="Salir" ></asp:LinkButton>
            </div> 
     </div>
        <div class="main">
            <div class="panel">
            <div class="cabezera_tabla">
            <div class="texto_cabecera">
                <asp:Label Text="Proveedores" runat="server" /></div>
            </div>
                <div class="contenedor_tabla">
                    <asp:GridView ID="tabla_proveedores" runat="server" AutoGenerateColumns="False" DataSource='<%# llenado_proveedores() %>'
                    DataKeyNames="id_proveedor" OnRowCreated = "OnRowCreated"
                    OnRowEditing="OnRowEditing" OnRowCancelingEdit="OnRowCancelingEdit"
                    OnRowUpdating="OnRowUpdating" OnRowDeleting="OnRowDeleting" EmptyDataText="No hay registros" >
                    <HeaderStyle CssClass="cabezera" />
                         <Columns>
                            <asp:BoundField HeaderText="ID.Prov." DataField="id_proveedor" ReadOnly="true">
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Prov." DataField="proveedor" >
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Direccion" DataField="direccion" >
                            </asp:BoundField>
                             <asp:BoundField HeaderText="Tipo.Prov." DataField="tipo_proveedor" >
                            </asp:BoundField>
                             <asp:BoundField HeaderText="Tipo Cambio" DataField="tipo_cambio" DataFormatString="{0:C}" >
                            </asp:BoundField>
                             <asp:BoundField HeaderText="Contacto" DataField="contacto" >
                            </asp:BoundField>
                             <asp:BoundField HeaderText="Correo" DataField="correo" >
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Precio" DataField="precio" >
                            </asp:BoundField>
                             <asp:BoundField HeaderText="Nombre" DataField="nombre" >
                            </asp:BoundField>
                             <asp:BoundField HeaderText="Local" DataField="local" >
                            </asp:BoundField>

                            <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton ID="EditButton" runat="server" CssClass="fa fa-pencil fa-2x"  CommandName="Edit" />
                            </ItemTemplate>
                            <EditItemTemplate>
                            <div class="controles_busqueda">
                                <asp:LinkButton ID="UpdateButton" runat="server" CssClass="fa fa-magic fa-2x" CommandName="Update" />&nbsp;
                                <asp:LinkButton ID="Cancel" runat="server" CssClass="fa fa-ban fa-2x" CommandName="Cancel"/>
                            </div>
                            </EditItemTemplate>
                           </asp:TemplateField>

                           <asp:TemplateField>
                             <ItemTemplate>
                               <asp:LinkButton ID="DeleteButton" CssClass="fa fa-trash-o fa-2x" CommandName="Delete" runat="server" />
                             </ItemTemplate>
                           </asp:TemplateField>          
                            
                        </Columns>       
                    </asp:GridView> 
                </div>
            <div class="barra_buscar">
            <div class="controles_busqueda">
                <asp:TextBox ID="buscar" runat="server" CssClass="cajas_felonas" placeholder="Buscar" ></asp:TextBox> 
                 <a href="JavaScript:mostrar();"><input id="Button1" type="button" value="Ocultar Columnas" class="boton_select"/></a> 
            </div>
        </div>
            </div>

        </div>
        <div id="controles" style="display:none;">
        <ul> 
            <li><input id="1" type="checkbox" value="ID" class="esconder"/>
            <label for="1" class="texto_check">ID</label></li>
            <li><input id="2" type="checkbox" value="proveedor" class="esconder"/>
            <label for="2" class="texto_check">Prov.</label></li>
            <li><input id="3" type="checkbox" value="Dir." class="esconder"/>
            <label for="3" class="texto_check">Dir.</label></li>
            <li><input id="4" type="checkbox" value="tipo_proveedor" class="esconder"/>
            <label for="4" class="texto_check">Tipo Proveedor</label></li>
            <li><input id="5" type="checkbox" value="tipo_cambio" class="esconder"/>
            <label for="5" class="texto_check">Tipo Cambio</label></li> 
            <li><input id="6" type="checkbox" value="contacto" class="esconder"/>
            <label for="6" class="texto_check">Contacto</label></li>
            <li><input id="7" type="checkbox" value="correo" class="esconder"/>
            <label for="7" class="texto_check">Correo</label></li>
            <li><input id="8" type="checkbox" value="precio" class="esconder"/>
            <label for="8" class="texto_check">Precio</label></li>
            <li><input id="9" type="checkbox" value="nombre" class="esconder"/>
            <label for="9" class="texto_check">Nombre</label></li>
            <li><input id="10" type="checkbox" value="local" class="esconder"/>
            <label for="10" class="texto_check">Local</label></li>
        </ul>
        </div>
        

    </div>
    </form>
</body>
</html>
