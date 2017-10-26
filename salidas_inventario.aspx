<%@ Page Language="C#" AutoEventWireup="true" CodeFile="codigo/salidas_inventario.aspx.cs" Inherits="salidas_inventario" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script src="jquery-ui-1.12.1.custom/jquery-ui.js" type="text/javascript"></script>
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
    function abrir() {
        window.moveTo(0, 0);
        window.resizeTo(screen.availWidth, screen.availHeight);
    }
    onload = abrir();
    function salir() {
        window.close();
    }
</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head" runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Salidas de inventario</title>
    <link href="jquery-ui-1.12.1.custom/jquery-ui.css" rel="stylesheet" type="text/css" />
    <link href="css/base.css" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Catamaran" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet" />
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800' rel='stylesheet' type='text/css' />
    <link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.min.css" />
</head>
<body>
    <form id="formulario" runat="server">
        <asp:ScriptManager ID="manejador_scripts" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="panel_actualizacion" runat="server">
            <ContentTemplate>
                <asp:Panel ID="panel_cargando" runat="server" Visible="True" Style="text-decoration: none; display: none">
                    <asp:Label ID="loading_rojo" runat="server"><i class="fa fa-spinner fa-pulse fa-3x"></i></asp:Label>
                </asp:Panel>
                <div class="principal">
                    <div class="barra_superior">
                        <div class="espacio_logotipo">
                            <img class="logotipo" src="img/inklaser.jpeg" />
                        </div>
                        <asp:Label CssClass="titulo tipo_texto" ID="titulo" runat="server">Salidas de inventario</asp:Label>

                        <asp:LinkButton ID="boton_salir" runat="server" Text="" ToolTip="Salir" CssClass="boton_salir"
                            OnClick="boton_salir_Click"><i class="fa fa-times fa-lg"></i></asp:LinkButton>


                        <asp:Label CssClass="nombre_usuario tipo_texto" ID="usuario" runat="server"></asp:Label>
                    </div>
                    <div class="separador_altas"></div>
                    <div class="contenido">
                        <div class="limitado">
                            <asp:GridView ID="tabla_salidas_inventario" runat="server" CssClass="tabla" DataSource='<%# datos_salidas_inventario() %>'
                                DataKeyNames="id_salida_inventario"
                                OnRowCommand="tabla_salida_inventario_RowCommand"
                                ShowHeaderWhenEmpty="True" AutoGenerateColumns="False"
                                PagerSettings-Visible="false">
                                <HeaderStyle CssClass="GridHeader" />
                                <PagerSettings Visible="False" />
                                <RowStyle CssClass="GridRow" HorizontalAlign="Left" />
                                <AlternatingRowStyle CssClass="GridRow" />
                                <Columns>
                                    <asp:BoundField HeaderText="ID Salida" DataField="id_salida_inventario" Visible="True"></asp:BoundField>
                                    <asp:BoundField HeaderText="Codigo" DataField="codigo_proveedor" Visible="True"></asp:BoundField>
                                    <asp:BoundField HeaderText="Producto" DataField="producto"></asp:BoundField>
                                    <asp:BoundField HeaderText="Comentarios" DataField="comentarios"></asp:BoundField>
                                    <asp:BoundField HeaderText="Cantidad" DataField="cantidad"></asp:BoundField>
                                    <asp:BoundField DataField="fecha_salida"
                                        HeaderText="Fecha" SortExpression="fecha" DataFormatString="{0:d}" />
                                    <asp:TemplateField HeaderText="" ShowHeader="True">
                                        <HeaderStyle CssClass="cabecera_columna_clientes columna_boton" />
                                        <ItemTemplate>
                                            <asp:LinkButton ID="imprimir" runat="server" CausesValidation="False" ToolTip="Imprimir recibo de la salida de inventario"
                                                CommandName="imprimir" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-print controles_tablas"></i></asp:LinkButton>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                        <div class="controles">
                            <asp:Label ID="etiqueta_numero_salidas" CssClass="etiquetas_barra_superior" runat="server" Text="No Salidas"></asp:Label><asp:TextBox ID="caja_numero_salidas" runat="server" CssClass="caja_buscar" Enabled="False"></asp:TextBox>
                            <asp:LinkButton ID="boton_regresar" runat="server" ToolTip="Volver al inventario" Style="text-decoration: none" CssClass="botones_requisiciones_chicos aprobar" OnClick="boton_regresar_Click">Volver</asp:LinkButton>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
            <Triggers>
            </Triggers>
        </asp:UpdatePanel>
    </form>
</body>
</html>

