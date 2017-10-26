<%@ Page Language="C#" AutoEventWireup="true" CodeFile="codigo/autorizar_cotizaciones.aspx.cs"
    Inherits="autorizar_cotizaciones" %>
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script src="jquery-ui-1.12.1.custom/jquery-ui.js" type="text/javascript"></script>
<link href="jquery-ui-1.12.1.custom/jquery-ui.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" language="javascript">
    function cargar(boton) {
        document.getElementById("<%= panel_cargando.ClientID %>").style.display = "inline";
        if (boton.toString() == 'boton_buscar') {
            setTimeout(function () {
                var boton = document.getElementById('boton_oculto_buscar');
                boton.click();
            }, 600);
        }
    }
    function abrir() {
        window.moveTo(0, 0);
        window.resizeTo(screen.availWidth, screen.availHeight);
    }
    onload = abrir();
    function salir() {
        window.close();
    }
    function stopRKey(evt) {
        var evt = (evt) ? evt : ((event) ? event : null);
        var node = (evt.target) ? evt.target : ((evt.srcElement) ? evt.srcElement : null);
        if ((evt.keyCode == 13) && (node.type == "text")) { return false; }
    }
    document.onkeypress = stopRKey;
    function pageLoad() {


    }
</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" />
<html id="ventana" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Autorizar cotizaciones</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="css/base.css" rel="stylesheet" type="text/css" />
     <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Catamaran" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800' rel='stylesheet'type='text/css'>
     <link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.min.css">
</head>
<body>
    <form id="formulario" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
        <asp:Panel ID="panel_cargando" runat="server" Visible="True" Style="text-decoration: none;
                            display: none">
                        <asp:Label ID="loading_rojo" runat="server"><i class="fa fa-spinner fa-pulse fa-3x"></i></asp:Label>
                        </asp:Panel>
            <div class="principal">
                <div class="barra_superior">
                    <div class="espacio_logotipo">
                        <img class="logotipo" src="img/inklaser.jpeg" />
                    </div>
                   <asp:Label CssClass="titulo tipo_texto" ID="titulo" runat="server">Autorizar cotizaciones</asp:Label>
                     
                    <asp:LinkButton ID="boton_salir" runat="server" Text="" ToolTip="Salir" CssClass="boton_salir"
                        OnClick="boton_salir_Click"><i class="fa fa-times fa-lg"></i></asp:LinkButton>


                <asp:Label CssClass="nombre_usuario tipo_texto" ID="usuario" runat="server"></asp:Label>
                </div>
                <div class="contenido">
                <div class="limitado_chico">
               <asp:GridView ID="TablaCotizaciones" runat="server" CssClass="tabla" DataSource="<%# DatosCotizacionesPorAutorizar() %>"
                                    DataKeyNames="ClaveCotizacion" OnRowCommand="TablaCotizaciones_OnRowCommand"
                                    ShowHeaderWhenEmpty="True" AutoGenerateColumns="False" PagerSettings-Visible="false">
                                    <HeaderStyle CssClass="GridHeader" />
                                    <PagerSettings Visible="False" />
                                    <RowStyle CssClass="GridRow" HorizontalAlign="Left" />
                                    <AlternatingRowStyle CssClass="GridRow" />
                                    <Columns>
                                        <asp:BoundField HeaderText="Clave" DataField="ClaveCotizacion" Visible="True">
                                        </asp:BoundField>
                                        <asp:BoundField HeaderText="Cliente" DataField="Cliente"></asp:BoundField>
                                        <asp:BoundField HeaderText="Vendedor" DataField="Vendedor"></asp:BoundField>
                                        <asp:BoundField HeaderText="Cantidad" DataField="Cantidad"></asp:BoundField>
                                        <asp:TemplateField HeaderText="" ShowHeader="True">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="BotonMostrarCotizacionPorAutorizar" runat="server" CausesValidation="False" ToolTip="Aprobar cotizacion"
                                                    CommandName="AtenderCotizacion" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-check-circle-o controles_tablas"></i></asp:LinkButton>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                   

                    
                    
                      </div>  
                 <div class="separador"></div>
                </div>
                <div class="controles">
                <asp:Label ID="etiqueta_numero_requisiciones" CssClass="etiquetas_barra_superior" runat="server" Text="No. Cotizaciones"></asp:Label>
                                        <asp:TextBox ID="CajaNumeroCotizaciones" runat="server" CssClass="caja_buscar"
                                            Enabled="False"></asp:TextBox>
           </div>
            </div>
        </ContentTemplate>
        <Triggers>

        </Triggers>
    </asp:UpdatePanel>
    </form>
</body>
</html>


                          
                                            
              