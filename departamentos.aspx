<%@ Page Language="C#" AutoEventWireup="true" CodeFile="codigo/departamentos.aspx.cs" Inherits="departamentos" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script src="jquery-ui-1.12.1.custom/jquery-ui.js" type="text/javascript"></script>
<link href="jquery-ui-1.12.1.custom/jquery-ui.css" rel="stylesheet" type="text/css" />
<script  type="text/javascript" language="javascript">
    function obtener_posicion_scroll_vertical() {
        document.getElementById('scroll').value = document.getElementById('limitado').scrollTop;
    }
    function restablecer_posicion_scroll_vertical() {
        document.getElementById('limitado').scrollTop = document.getElementById('scroll').value;
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
                var boton = window.document.getElementById('actualizar');
                boton.click();
            }
            else {
                mouse = false;
                keyboard = false;
                //   window.opener.document.getElementById('caja_contador').value = "0";
            }
        }, 300000);
    })()
    function verificar_enter(e) {
        var key_press = document.all ? key_press = e.keyCode : key_press = e.which;
        if (key_press == 13) {
            var boton = document.getElementById('boton_escanear');
            boton.click();
        }
    }
    function mensaje_exito() {
        setTimeout(function () {
            var boton = document.getElementById('cerrar_mensaje');
            boton.click();
            restablecer_posicion_scroll_vertical();
        }, 1000);
    }
    function cargar(boton) {
        restablecer_posicion_scroll_vertical();
        document.getElementById("<%= panel_cargando.ClientID %>").style.display = "inline";
        setTimeout(function () {
            document.getElementById("<%= panel_cargando.ClientID %>").style.display = "none";
            mensaje_exito();
        }, 1000);

    }
    function abrir() {
        window.moveTo(0, 0);
        window.resizeTo(screen.availWidth, screen.availHeight);
    }
    onload = abrir();
    function salir() {
        window.close();
    }
  </script>
<head id="Head1" runat="server">
<meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0" />
    <title>Departamentos</title>
    <script type "text/javascript" src="javascript/funciones.js"></script>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800' rel='stylesheet' type='text/css' />
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Catamaran" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet" />
    <link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.min.css">
    <link href="css/base.css" rel="stylesheet" type="text/css" />
    </head>
<body>
    <form id="formulario" runat="server">
     <input type="hidden" id="scroll" runat="server" />
     <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="panel_actualizacion" runat="server">
        <ContentTemplate>
     <asp:Panel ID="panel_cargando" runat="server" Visible="True" Style="text-decoration: none;
                            display: none">
                        <asp:Label ID="loading_rojo" runat="server"><i class="fa fa-spinner fa-spin fa-3x"></i></asp:Label>
                        </asp:Panel>
          <div class="barra_superior">
                    <div class="espacio_logotipo">
                        <img class="logotipo" src="img/inklaser.jpeg" />
                    </div>
                    <asp:Label CssClass="titulo tipo_texto" ID="titulo" runat="server">Departamentos</asp:Label>
                    <asp:LinkButton ID="boton_salir" runat="server" Text="" ToolTip="Salir" CssClass="boton_salir"
                        OnClick="boton_salir_Click"><i class="fa fa-times fa-lg"></i></asp:LinkButton>
                    <asp:Label CssClass="nombre_usuario tipo_texto" ID="usuario" runat="server"></asp:Label>
                </div>
     <div id="contenido">
     <div class="separador"></div>
     <div class="main_izquierdo">
     <div class="separador_altas s_azul"><p class="negro_grande">Departamentos</p></div>
     <div class="limitado">
     <asp:GridView ID="tabla_departamentos" runat="server" CssClass="tabla" DataSource="<%# datos_departamentos() %>"
                            DataKeyNames="id_departamento" OnRowCommand="tabla_departamentos_OnRowCommand"
                            ShowHeaderWhenEmpty="True" AutoGenerateColumns="False" PagerSettings-Visible="false">
                            <HeaderStyle CssClass="GridHeader oculto" />
                            <PagerSettings Visible="False" />
                            <RowStyle CssClass="GridRow" HorizontalAlign="Left" />
                            <AlternatingRowStyle CssClass="GridRow" />
                                <Columns>
                                    <asp:BoundField HeaderText="ID" DataField="id_departamento" Visible="True"></asp:BoundField>
                                    <asp:BoundField HeaderText="Departamento" DataField="departamento"></asp:BoundField>
                                    <asp:TemplateField HeaderText="" ShowHeader="True">
                                <ItemTemplate>
                                    <asp:LinkButton ID="configurar" runat="server" CausesValidation="False" ToolTip="Configurar departamento"
                                        CommandName="configurar" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-gear controles_tablas"></i></asp:LinkButton>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                                </Columns>
                        </asp:GridView>
     </div>
      </div>


      <div class="main_derecho">
       <div class="separador_altas s_azul"><p class="negro_grande">Modulos</p></div>
   <div id="limitado" class="limitado" onscroll="obtener_posicion_scroll_vertical()">
     <asp:GridView ID="tabla_modulos" runat="server" CssClass="tabla" DataSource="<%# datos_modulos() %>"
                            DataKeyNames="id_modulo" OnRowCommand="tabla_modulos_OnRowCommand"
                            ShowHeaderWhenEmpty="True" AutoGenerateColumns="False" PagerSettings-Visible="false">
                            <HeaderStyle CssClass="GridHeader oculto" />
                            <PagerSettings Visible="False" />
                            <RowStyle CssClass="GridRow" HorizontalAlign="Left" />
                            <AlternatingRowStyle CssClass="GridRow" />
                                <Columns>
                                    <asp:BoundField HeaderText="ID" DataField="id_modulo" Visible="True"></asp:BoundField>
                                    <asp:BoundField HeaderText="Modulo" DataField="modulo"></asp:BoundField>
                                     <asp:TemplateField HeaderText="" ShowHeader="True">
                     <ItemTemplate>
                            <asp:LinkButton ID="activacion" runat="server" CausesValidation="False" ToolTip="Desactivar y activar modulos" 
                            CommandName="activacion" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-toggle-off c_texto rojo_desactivado"></i></asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                                </Columns>
                        </asp:GridView>
     </div>
            </div>
             <asp:Panel ID="mensajes" runat="server" CssClass="mensajes_cotizacion" Visible="False">
                        <asp:Panel ID="simbolo_mensaje" runat="server" CssClass="simbolos_mensajes_verde">
                            <asp:Label ID="icono_mensaje" CssClass="icono_mensaje" runat="server"><i class="fa fa-exclamation"></i></asp:Label>
                        </asp:Panel>
                        <asp:Label ID="mensaje" CssClass="mensaje" runat="server" Text="Error alguno de los campos se encuentra vacio"></asp:Label>
                        <asp:LinkButton ID="cerrar_mensaje" CssClass="cerrar_mensajes" runat="server" OnClick="cerrar_mensaje_Click"><i class="fa fa-close"></i></asp:LinkButton>
                    </asp:Panel>
            </div>
            <asp:LinkButton ID="boton_escanear" runat="server" Text="actualizar" Visible="True" Style="visibility: hidden"></asp:LinkButton>
            <asp:LinkButton ID="actualizar" runat="server" Text="actualizar" Visible="True" Style="visibility: hidden"></asp:LinkButton>
    </ContentTemplate>
    </asp:UpdatePanel>
    </form>
    </body>
    </html>
