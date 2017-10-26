<%@ Page Language="C#" AutoEventWireup="true" CodeFile="codigo/control_usuarios.aspx.cs" Inherits="control_usuarios" %>

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
    function cargar(boton) {
        document.getElementById("<%= panel_cargando.ClientID %>").style.display = "inline";
        if (boton.toString() == 'activacion') {
            setTimeout(function () {
                var boton = document.getElementById('boton_oculto_activacion');
                boton.click();
            }, 300);
        }
        if (boton.toString() == 'boton_guardar_user') {
            setTimeout(function () {
                var boton = document.getElementById('boton_oculto_guardar');
                boton.click();
            }, 300);
        }
    }
    function salir() {
        window.close();
    }
    function pageLoad() {
        $("#panel_editar_usuario").draggable();
        $(function () {
            var $rows = $('#tabla_usuarios tr[class!="GridHeader"]');
            $('#buscar_texto').keyup(function () {
                var val = $.trim($(this).val()).replace(/ +/g, ' ').toLowerCase();
                $rows.show().filter(function () {
                    var text = $(this).text().replace(/\s+/g, ' ').toLowerCase();
                    return ! ~text.indexOf(val);
                }).hide();
            });
        });
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="utf-8" />
    <title>Control de usuarios</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="css/base.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="javascript/funciones.js"></script>
    <script type="text/javascript" src="javascript/mensajes.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Catamaran" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet" />
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800' rel='stylesheet' type='text/css' />
    <link href="jquery-ui-1.12.1.custom/jquery-ui.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.min.css" />
</head>
<body>
    <form id="formulario" runat="server">
        <asp:ScriptManager ID="manejador_scripts" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="panel_actualizaciones" runat="server">
            <ContentTemplate>
                <div class="principal">
                    <asp:Panel ID="panel_cargando" runat="server" Visible="True" Style="text-decoration: none; display: none">
                        <asp:Label ID="loading_rojo" runat="server"><i class="fa fa-spinner fa-pulse fa-3x"></i></asp:Label>
                    </asp:Panel>
                    <div class="barra_superior">
                        <div class="espacio_logotipo">
                            <img class="logotipo" src="img/inklaser.jpeg" />
                        </div>
                        <asp:Label CssClass="titulo tipo_texto" ID="titulo" runat="server">Control de usuarios</asp:Label>
                        <asp:LinkButton ID="boton_salir" runat="server" Text="" ToolTip="Salir" CssClass="boton_salir" OnClick="boton_salir_Click"><i class="fa fa-times fa-lg"></i></asp:LinkButton>
                        <asp:Label CssClass="nombre_usuario tipo_texto" ID="usuario" runat="server"></asp:Label>
                    </div>
                    <asp:Panel ID="mensajes" runat="server" CssClass="mensajes" Visible="True">
                        <asp:Panel ID="simbolo_mensaje" runat="server" CssClass="simbolos_mensajes_verde">
                            <asp:Label ID="icono_mensaje" CssClass="icono_mensaje" runat="server"><i class="fa fa-exclamation"></i></asp:Label>
                        </asp:Panel>
                        <asp:Label ID="mensaje" CssClass="mensaje" runat="server" Text="Error alguno de los campos se encuentra vacio"></asp:Label>
                    </asp:Panel>
                    <div class="separador_altas"></div>
                    <div class="contenido">
                        <div class="panel_procesar">
                            <asp:Label ID="etiqueta_buscar" runat="server" CssClass="etiquetas_barra_superior" Text="Buscar por: "></asp:Label>
                            <asp:TextBox type="text" ID="buscar_texto" runat="server" CssClass="caja_buscar" placeholder="Introduzca busqueda"></asp:TextBox>
                            <asp:LinkButton ID="boton_alta_usuarios" runat="server" CssClass="botones_requisiciones_chicos b_verde" ToolTip="Alta de usuarios" OnClick="boton_alta_usuarios_Click"><i class="fa fa-user-plus"></i></asp:LinkButton>
                        </div>
                        <div class="limitado">
                            <asp:GridView ID="tabla_usuarios" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSource='<%# datos_usuarios() %>' OnRowCommand="tabla_usuarios_RowCommand" CssClass="tabla" ShowHeaderWhenEmpty="True" PageSize="50">
                                <PagerSettings Visible="False" />
                                <HeaderStyle CssClass="GridHeader" />
                                <RowStyle CssClass="GridRow" HorizontalAlign="Left" />
                                <AlternatingRowStyle CssClass="GridRow" />
                                <Columns>
                                    <asp:BoundField HeaderText="Id" DataField="id">
                                        <HeaderStyle CssClass="cabecera_gridview" />
                                    </asp:BoundField>
                                    <asp:BoundField HeaderText="Nombre" DataField="nombre">
                                        <HeaderStyle CssClass="cabecera_gridview" />
                                    </asp:BoundField>
                                    <asp:BoundField HeaderText="Usuario" DataField="usuario">
                                        <HeaderStyle CssClass="cabecera_gridview" />
                                    </asp:BoundField>
                                    <asp:BoundField HeaderText="Departamento" DataField="departamento">
                                        <HeaderStyle CssClass="cabecera_gridview" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="" ShowHeader="True">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="edicion" runat="server" CausesValidation="False" ToolTip="Editar usuario"
                                                CommandName="editar" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-pencil controles_tablas"></i></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="" ShowHeader="True">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="activacion" runat="server" CausesValidation="False" ToolTip="Desactivar Y Activar usuarios"
                                                CommandName="activacion" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                </Columns>
                            </asp:GridView>
                            <div class="separador_altas"></div>
                        </div>
                        <div runat="server" id="panel_editar_usuario" visible="false" class="ui-widget-content panel_sobrepuesto_altas">
                            <div class="separador_altas s_azul">
                                <asp:Label ID="titulo_editar_usuario" CssClass="titulos_ventanas" runat="server" Text="Datos de usuario"></asp:Label>
                                <asp:LinkButton ID="boton_cerrar_cambiar_todos_precios" OnClick="cerrar_editar_usuario_Click" runat="server" CssClass="boton_cerrar"><i class="fa fa-close"></i></asp:LinkButton>
                            </div>
                            <div class="central">
                                <div class="izquierdo_mitad">
                                    <ul class="lista_inventario mover_izquierda_20">
                                        <li>
                                            <p>Nombre</p>
                                            <asp:TextBox ID="caja_nombre" runat="server" CssClass="caja_lista_inventario" Style="text-transform: uppercase"></asp:TextBox>
                                        </li>
                                        <li>
                                            <p>Usuario (Correo electronico)</p>
                                            <asp:TextBox ID="caja_usuario" CssClass="caja_lista_inventario" runat="server" Enabled="True"></asp:TextBox>
                                        </li>
                                        <li>
                                            <p>Password</p>
                                            <asp:TextBox ID="caja_password" CssClass="caja_lista_inventario" runat="server" Enabled="True"></asp:TextBox>
                                        </li>
                                    </ul>
                                </div>
                                <div class="derecho_mitad">
                                    <ul class="lista_inventario">
                                        <li>
                                            <p>Sucursal</p>
                                            <asp:DropDownList ID="lista_sucursales" CssClass="caja_lista_inventario" runat="server"></asp:DropDownList>
                                        </li>
                                        <li>
                                            <p>Departamento</p>
                                            <asp:DropDownList ID="lista_departamentos" CssClass="caja_lista_inventario" runat="server"></asp:DropDownList>
                                        </li>
                                        <li>
                                            <p>Telefono</p>
                                            <asp:TextBox ID="caja_telefono" CssClass="caja_lista_inventario" runat="server" Enabled="True"></asp:TextBox>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="central">
                                <asp:LinkButton ID="boton_guardar_user" Enabled="False" runat="server" ToolTip="Guardar datos del usuario" CssClass="botones_requisiciones_chicos b_verde mover_izquierda_20" OnClick="boton_guardar_Click">Guardar</asp:LinkButton>
                            </div>
                        </div>
                        <asp:LinkButton ID="boton_oculto_activacion" runat="server" OnClick="boton_oculto_activacion_Click"
                            Style="text-decoration: none; display: none"><i class="fa fa-gear fa-spin"></i></asp:LinkButton>
                        <asp:LinkButton ID="boton_oculto_guardar" runat="server" OnClick="boton_oculto_guardar_Click"
                            Style="text-decoration: none; display: none"><i class="fa fa-gear fa-spin"></i></asp:LinkButton>
                    </div>
                </div>
            </ContentTemplate>
            <Triggers>
            </Triggers>
        </asp:UpdatePanel>
    </form>
</body>
</html>
