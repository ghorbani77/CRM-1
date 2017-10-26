<%@ Page Language="C#" AutoEventWireup="true" CodeFile="codigo/chat.aspx.cs" Inherits="chat" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script src="js/jquery-1.11.3.js" type="text/javascript"></script>
<script type="text/javascript">
    function salir() {
        window.close();
    }
    (function () {
        var mouse = false, teclado = false;
        document.onmousemove = function () {
            mouse = true;
        };
        document.onkeydown = function () {
            teclado = true;
        };
        setInterval(function () {
            if (!mouse && !teclado) {
            }
            else {
                mouse = false;
                teclado = false;
                window.opener.document.getElementById('caja_contador').value = "0";
            }
        }, 1000);
    })()
    function stopRKey(evt) {
        var evt = (evt) ? evt : ((event) ? event : null);
        var node = (evt.target) ? evt.target : ((evt.srcElement) ? evt.srcElement : null);
        if ((evt.keyCode == 13) && (node.type == "text")) { return false; }
    }
    document.onkeypress = stopRKey;
    function verificar_enter(e) {
        var key_press = document.all ? key_press = e.keyCode : key_press = e.which;
        if (key_press == 13) {
            var boton = document.getElementById('enviar');
            boton.click();
            document.getElementById('caja_mensaje').value = "";
        }
        else {
            return ((key_press >= 0 && key_press < 39) || (key_press > 39 && key_press < 92) || key_press > 92);
        }
    }
    function obtener_posicion_scroll_vertical() {
        document.getElementById('scroll_contactos').value = document.getElementById('contenedor_contactos').scrollTop;
        document.getElementById('scroll_chat').value = document.getElementById('mensajes').scrollTop;
        if (document.getElementById('scroll_chat').value < document.getElementById('mensajes').scrollHeight - 1270) {
            $('#nuevos_mensajes').css("visibility", "visible");
        }
        else {
            $('#nuevos_mensajes').css("visibility", "hidden");
            var button = document.getElementById('marcar_mensajes');
            button.click();
        }
    }
    function restablecer_posicion_scroll_vertical() {
        document.getElementById('contenedor_contactos').scrollTop = document.getElementById('scroll_contactos').value;
        document.getElementById('mensajes').scrollTop = document.getElementById('scroll_chat').value;
    }
    function bajar_scroll() {
        document.getElementById('scroll_chat').value = document.getElementById('mensajes').scrollHeight;
        if (screen.width < 800) {
            $('#cuadro_contactos').css("display", "none");
        }
    }
    function marcar(caja_mensaje) {
        var button = document.getElementById('marca');
        button.click();
    }
    function pageLoad() {
        $('#simbolo_nuevos_mensajes').click(function () {
            document.getElementById('scroll_chat').value = document.getElementById('mensajes').scrollHeight;
            document.getElementById('mensajes').scrollTop = document.getElementById('scroll_chat').value;
            return false;
        });
        $('#nuevos_mensajes_oculto').click(function () {
            document.getElementById('mensajes').scrollTop = document.getElementById('mensajes').scrollHeight;
            var button = document.getElementById('marcar_mensajes');
            button.click();
            return true;
        });
        $('.boton').click(function () {
            if (screen.width < 800) {
                $('#barra_informacion_usuario').css("display", "none");
                $('#cuadro_contactos').css("display", "none");
                $('#contenedor_contactos').css("display", "none");
                $('#cuadro_mensajes').css("display", "inline-block");
                $('#mensajes').css("display", "inline-block");
                return true;
            }
        });
        $('#volver').click(function () {
            if (screen.width < 800) {
                $('#barra_informacion_usuario').css("display", "inline-block");
                $('#cuadro_contactos').css("display", "inline-block");
                $('#contenedor_contactos').css("display", "inline-block");
                $('#cuadro_mensajes').css("display", "none");
                $('#mensajes').css("display", "none");
            }
        });
        restablecer_posicion_scroll_vertical();
    }
    window.onload = function () {
    }
    function abrir() {
        window.moveTo(0, 0);
        window.resizeTo(screen.availWidth, screen.availHeight);
    }
    onload = abrir();
</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head" runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Mensajeria instantanea</title>
    <link href="css/chat.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.min.css" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
</head>
<body>
    <form id="formulario_chat" runat="server">
        <input type="hidden" id="scroll_contactos" runat="server" />
        <input type="hidden" id="scroll_chat" runat="server" />
        <asp:ScriptManager ID="ScriptManager" runat="server">
        </asp:ScriptManager>
        <div class="principal modo_diseño">
            <asp:UpdatePanel ID="panel_actualizacion_contactos" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div id="cuadro_contactos" class="modo_diseño" runat="server">
                        <div id="barra_informacion_usuario">
                            <asp:Image ID="imagen_usuario" CssClass="imagen_usuario" runat="server" />
                            <asp:Label ID="nombre_usuario" CssClass="nombre_usuario" runat="server"></asp:Label>
                        </div>
                        <asp:Panel ID="contenedor_contactos" class="modo_diseño" onscroll="obtener_posicion_scroll_vertical()"
                            runat="server" Visible="True">
                        </asp:Panel>
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="reloj" EventName="Tick" />
                </Triggers>
            </asp:UpdatePanel>
            <div id="cuadro_mensajes" class="modo_diseño" runat="server">
                <div id="barra_informacion_usuario_receptor">
                    <asp:UpdatePanel ID="panel_actualizacion_usuario_receptor" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:LinkButton ID="volver" runat="server"><i class="fa fa-arrow-left"></i></asp:LinkButton>
                            <asp:Image ID="imagen_usuario_receptor" CssClass="imagen_oculta" runat="server" />
                            <asp:Label ID="nombre_usuario_receptor" CssClass="nombre_usuario_receptor" runat="server"></asp:Label>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                <asp:UpdatePanel ID="panel_actualizacion_chat" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:Panel ID="panel_nuevos_mensajes" runat="server" Visible="False">
                            <asp:Label ID="numero_mensajes" runat="server" Visible="True" CssClass="simbolo_nuevos_mensajes">1</asp:Label>
                        </asp:Panel>
                        <asp:Panel ID="panel_nuevos_mensajes_oculto" Visible="False" runat="server">
                            <asp:LinkButton ID="nuevos_mensajes_oculto" runat="server" Text="Enviar" CssClass="simbolo_nuevos_mensajes"><i class="fa fa-angle-double-down fa-2x"></i></asp:LinkButton>
                        </asp:Panel>
                        <div id="mensajes" class="modo_diseño" onscroll="obtener_posicion_scroll_vertical()">
                            <asp:Panel ID="contenedor_chat" CssClass="m_chat" runat="server">
                            </asp:Panel>
                            <asp:Timer ID="reloj" runat="server" Interval="1000" OnTick="reloj_Tick">
                            </asp:Timer>
                            <asp:Button ID="marcar_mensajes" runat="server" Text="Enviar" Style="visibility: hidden;"
                                OnClick="marcar_mensajes_Click" />
                            <asp:Button ID="enviar" runat="server" Text="Enviar" Style="visibility: hidden;"
                                OnClick="enviar_Click" />
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="enviar" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="reloj" EventName="Tick" />
                        <asp:AsyncPostBackTrigger ControlID="marcar_mensajes" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>
                <asp:Panel ID="nuevos_mensajes" runat="server">
                    <asp:LinkButton ID="simbolo_nuevos_mensajes" runat="server" CssClass="simbolo_nuevos_mensajes"><i class="fa fa-angle-double-down fa-2x"></i></asp:LinkButton>
                </asp:Panel>
                <asp:UpdatePanel ID="panel_actualizacion_controles" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div id="controles" class="modo_diseño">
                            <asp:TextBox ID="caja_mensaje" runat="server" CssClass="caja_mensaje">
                            </asp:TextBox>
                            <asp:LinkButton ID="boton_enviar" ToolTip="Enviar mensaje" runat="server"><i class="fa fa-send-o"></i></asp:LinkButton>
                            <img class="logo" src="img/logo-ink.png">
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="enviar" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>
        </div>
    </form>
</body>
</html>
