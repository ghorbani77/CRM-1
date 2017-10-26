<%@ Page Language="C#" AutoEventWireup="true" CodeFile="codigo/clientes.aspx.cs" Inherits="clientes" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script src="js/jquery-1.11.3.js" type="text/javascript"></script>
<script src="jquery-ui-1.12.1.custom/jquery-ui.js"></script>
<link href="jquery-ui-1.12.1.custom/jquery-ui.css" rel="stylesheet" type="text/css" />
<script src="jquery-timepicker-1.3.5/jquery.timepicker.js"></script>
<link href="jquery-timepicker-1.3.5/jquery.timepicker.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">

    function salir() {
        window.close();
    }    
    function pageLoad() {
        $(function () {
            $("#tabs").tabs();
        });
       
        $(function () {
            $("#date").datepicker({ dateFormat: 'yy/mm/dd', disableTextInput: true, minDate: "0D" }).val();
        });
        $(function () {
            $("#caja_fecha_reagendar").datepicker({ dateFormat: 'yy/mm/dd', disableTextInput: true, minDate: "0D" }).val();
        });
        $(function () {
            $("#fecha_inicio").datepicker({ dateFormat: 'yy/mm/dd' }).val();
        });
        $(function () {
            $("#fecha_final").datepicker({ dateFormat: 'yy/mm/dd' }).val();
        });
        $(document).ready(function () {
            $('input.timepicker').timepicker({
                timeFormat: 'h:mm p',
                interval: 30,
                minTime: '7:00am',
                maxTime: '8:00pm',
                defaultTime: '8',
                startTime: '8',
                dynamic: false,
                dropdown: true,
                scrollbar: true
            });
        });
    }/**Final pageLoad**/
    
    function nada(e) {
        var key_press = document.all ? key_press = e.keyCode : key_press = e.which;
        return false;
    }
    //****************************************************************************
    function up() {
        posicionar_cursor();
        var boton = document.getElementById('buscar');
        boton.click();
    }
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
    function validacion() {
        alert("No se permiten las comas en los comentarios");
    }
    function confirmacion() {
        document.getElementById('alrt').innerHTML = '<div class="notificacion_mensaje"><i class="fa fa-info-circle"></i> Guardado correctamente</div> ';
        setTimeout(function () { document.getElementById('alrt').innerHTML = ''; }, 3500);
    }
    function no_historial() {
        document.getElementById('alrt').innerHTML = '<div class="notificacion_mensaje"> <i class="fa fa-info-circle"></i> No existen registros para este cliente</div>';
        setTimeout(function () { document.getElementById('alrt').innerHTML = ''; }, 3500);
    }
    function campo_vacio() {
        document.getElementById('alrt').innerHTML = '<div class="notificacion_mensaje"><i class="fa fa-info-circle"></i> Campo Vacío</div> ';
        setTimeout(function () { document.getElementById('alrt').innerHTML = ''; }, 3500);
    }
    
    function no_citas() {
        document.getElementById('alrt').innerHTML = '<div class="notificacion_mensaje"> <i class="fa fa-info-circle"></i> No existen llamadas agendadas</div>';
        setTimeout(function () { document.getElementById('alrt').innerHTML = ''; }, 3500);
    }
    function abrir_editar_cliente() {
        window.open('modificar_cliente.aspx', '_blank', 'toolbar=0,location=0,menubar=0');
    }
    function alta_cliente() {
        window.open('alta_cliente.aspx', '_blank', 'toolbar=0,location=0,menubar=0');
    }
    </script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Clientes - Inklaser</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />     
    <script type="text/javascript" src="js/vendor/modernizr.js"></script>
    <script type="text/javascript" src="javascript/funciones.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Catamaran" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800' rel='stylesheet'type='text/css'>
    <link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.min.css">
    <link href="css/base.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="css/melissa.css" /> 
    <style type="text/css">
        body {
        font-family: 'Montserrat', sans-serif;
        }
        .notificacion_div{
            left:40%; 
            top:40%;
            position:absolute;
            z-index:999;
        }
        .notificacion_mensaje{
            background: #e81414;
            height: 30px;
            padding: 3px 10px;
            margin-bottom: 20px;
            text-transform: uppercase;
            font-weight: 400;
            font-size: 1.1em;
            text-align: center;
            color: #ffffff;
            /*opacity: 0.8;  */
            border-radius: 20px;
            font-weight: bold;
            z-index:999;
            top: 50%;
            left: 50%;
            width:30em;
           
            margin-top: -9em; 
            margin-left: -15em; 
            position:fixed;
            /*font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;*/
        }       
        a, a:hover, a:active, a:focus {
            text-decoration: none;
            outline: 0;
        }
        .ui-widget-header {
            border: 0px solid #dddddd;
            background: #2471a3;
            color: white;
            font-weight: bold;
        }
       .ui-state-active, .ui-widget-content .ui-state-active, .ui-widget-header .ui-state-active, a.ui-button:active, .ui-button:active, .ui-button.ui-state-active:hover {/* La pestaña activa*/
            border: none;
            background: white !important;
            font-weight: normal;
            text-decoration: none;
        }
       .ui-state-active a, .ui-state-active a:link, .ui-state-active a:visited {/*Para los links*/
           color: #2471a3 !important; 
           text-decoration: none; 
           border:none;
           text-decoration: none
        }
        .ui-tab:hover {/*Obviamente para el hover :v*/
            background: white;
            border:none;
        }
        .ui-tabs .ui-tabs-nav li {/* Margen de las tabs no activas*/
           margin: 0px; 
           padding:0px;
        }
        .ui-tabs .ui-tabs-nav {
            margin: 0;
            padding: 0px;
            padding-top:2px;
        }
        .ui-tabs .ui-tabs-nav li { background: #2471a3; }
        .ui-state-default, .ui-widget-content .ui-state-default, .ui-widget-header .ui-state-default, .ui-button, html .ui-button.ui-state-disabled:hover, html .ui-button.ui-state-disabled:active {/*BORDE*/
            border:0px;            
        }
        .ui-state-default a, .ui-state-default a:link .ui-button {
            color: white;
            text-decoration: none;
        }
        .ui-state-hover, .ui-widget-content .ui-state-hover, .ui-widget-header .ui-state-hover, .ui-state-focus, .ui-widget-content .ui-state-focus, .ui-widget-header .ui-state-focus, .ui-button:hover, .ui-button:focus {
            border: none;
            font-weight: normal;
        }
        .ui-state-default a, .ui-state-default a:link, .ui-state-default a:visited, a.ui-button, a:link.ui-button, a:visited.ui-button, .ui-button {
            color: #fffefe;
            text-decoration: none;
        }
       .ui-tabs { position: relative; padding: 0px; }
       .ui-widget-content { border:0px;}
        .ui-widget.ui-widget-content {
            border: 0px solid #c5c5c5;
        }       
       input[type="checkbox"] { 
        -webkit-appearance: checkbox;
        -webkit-box-shadow:inset 0px 1px 6px #ECF3F5 !important;
        box-shadow: inset 0px 1px 6px #ECF3F5 !important;
       }
       .ui-widget-content {
           /* border: 1px solid #dddddd;
            background: #ffffff;*/
            color: #143f5a;
       }
       ul.lista_banco li { 
           margin-left:20px; 
          /* line-height:3em;*/
       }
       fieldset {
          margin-top:1.5em;
          width: 50%;
          font:80%/1 sans-serif;
        }
       .input_form {
        color: #888;
        border: 1px solid #C5E2FF;
        outline: 0;
        -webkit-box-shadow:inset 0px 1px 6px #ECF3F5 !important;
        box-shadow: inset 0px 1px 6px #ECF3F5 !important;
        /*font: 200 12px/25px Arial, Helvetica, sans-serif;*/
        }
       .gv {width:90%;}

       .modulo-esp1 {
            background: #ffffff;
            box-shadow: 1px 1px 5px 1px #6e6e73;
            left: 48%;
            padding: 15px;
            position: fixed;
            top: 420px;
            transform: translate(-50%, -50%);
            z-index: 60;
        }
        .boton-cerrar {
            color:white;
            border-radius: 20px;
        }
        .boton-cerrar:hover {
            color:white;
        }
        .cerrar-modulo2 {
            background: #2471a3;
            /*height: 30px;*/
            padding: 3px 10px;
            margin-bottom: 20px;
            text-transform: uppercase;
            font-weight: 400;
            font-size: .9rem;
            text-align: center;
            border-radius: 4px;
            color:white;
        }
        button.success, .button.success {
            background-color: #254048;
            border-color: #254048;
            color: white;
            border-radius: 20px;
        }
  
        button.success, .button.success:hover {
            background-color: #4a7e8e;
            border-color: #4a7e8e;
            color: white;
        }
        button.success, .button.success:active {
            background-color: #4a7e8e;
            border-color: #4a7e8e;
            color: white;
        }
        button.success, .button.success:focus {
            background-color: #4a7e8e;
            border-color: #4a7e8e;
            color: white;
            border-radius: 20px;
        }
        #buscar {
            width: 68px !important;
            height: 40px !important;
            margin-right: 5px !important;
        }
    .limitado_chico {
        height:500px;
    }
    </style>     

</head>
<body bgcolor="#0080c0">
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
     <div class="principal" style="background-color:white;">
     <div class="barra_superior">
                    <div class="espacio_logotipo">
                        <img class="logotipo" src="img/inklaser.jpeg" />
                    </div>
                   <asp:Label CssClass="titulo tipo_texto" ID="titulo" runat="server">Clientes</asp:Label>
                   <asp:LinkButton ID="boton_salir" runat="server" Text="" ToolTip="Salir" CssClass="boton_salir" OnClick="boton_salir_Click" ><i class="fa fa-times fa-lg"></i></asp:LinkButton>                
    </div>
        <!--FORMULARIO-->
     <div id="principal" class="contenido" style=" height:100%; width:100%; position:fixed; top:0; left:0px;">
            <div id="tabs" style=" height:100%; width:100%;">
               <ul id="menu_principal" class="tabs">
                <li><a href="#inicio">Inicio</a></li>
                <li><a href="#sucursal_principal">Sucursal</a></li>
                <li><a href="#herramientas">Herramientas</a></li>
                <li><a href="#reportes">Reportes</a></li>
                <li><a href="#correo_masivo">Correo masivo</a></li>
              </ul>
             
             <div id="inicio" style=" height:100%; width:100%;">
                 <div id="menu_inicio" style="background-color:white; height:15%; width:100%; left:0px; position:fixed; top:105px; ">
                     <ul class="lista_banco">
                        <li> <asp:LinkButton ID="LinkButton5" runat="server" Text="" ToolTip="Salir" CssClass="" OnClientClick="alta_cliente();" >
                            <i class="fa fa-user-plus fa-3x" aria-hidden="true" style="color:#2471a3;"></i></asp:LinkButton>   </li>
                     </ul>
                 </div>
                 <div id="abajo_menu_inicio" style=" height:74%; width:100%; left:0px; position:fixed; bottom:0px; " >                    
                    <ul class="lista_banco">
                            <li><asp:Label ID="t_busqueda" runat="server" Text="Buscar: "></asp:Label></li>            
                            <li><div >
                                <asp:TextBox ID="caja_busqueda" placeholder="Introduce un nombre" onfocus="return posicionar_cursor(this.id);" runat="server" Enabled="True" CssClass="input_form" ontextchanged="caja_busqueda_TextChanged" onKeyUp="up();" ></asp:TextBox> <i class="fa fa-search"></i>                        
                                </div></li>
                            <li><asp:LinkButton ID="boton_administrar_llamadas" runat="server" ToolTip="" OnClick="abrir_panel_administracion" Visible="false" style="text-decoration:none;" CssClass="botones_requisiciones aprobar ">Ver registros de llamadas</asp:LinkButton></li> 
                            <li><asp:Label  ID="numero_llamadas_pendientes" runat="server"> Llamadas pendientes: </asp:Label></li>
                            <li><asp:LinkButton ID="boton_llamadas_pendientes_reporte" runat="server" ToolTip="" onclick="ver_llamadas_pendientes" style="text-decoration:none;" CssClass="botones_requisiciones aprobar ">Ver llamadas pendientes</asp:LinkButton></li>  
                         </ul> 
                       <asp:Button ID="buscar" runat="server"  Text="actualizar" onkeydown="buscar();" Visible="True" style="visibility:hidden" onclick="buscar_Click"/>                      
                   
                  <asp:Panel ID="panel_tabla" runat="server"  Visible="true"  >                
                    <asp:GridView ID="tabla_clientes" runat="server" AutoGenerateColumns="False" DataKeyNames="id"  DataSource='<%# datos_clientes() %>' onrowcommand="tabla_clientes_RowCommand" CssClass="tabla" ShowHeaderWhenEmpty="True" PageSize="100">
		            <HeaderStyle CssClass="GridHeader" />
                     <PagerSettings Visible="true" />
		            <RowStyle CssClass="GridRow " HorizontalAlign="Center" />
                    <Columns>
                        <asp:BoundField HeaderText="ID" DataField="id" Visible="false" >
                        </asp:BoundField>
                        <asp:BoundField HeaderText="NOMBRE" DataField="nombre" >
                        </asp:BoundField>
                        <asp:BoundField HeaderText="RFC" DataField="rfc" >                         
                        </asp:BoundField>
                        <asp:BoundField HeaderText="DIRECCIÓN" DataField="direccion" >                   
                        </asp:BoundField>
                        <asp:BoundField HeaderText="TELÉFONO" DataField="telefono" >                        
                        </asp:BoundField>
                
                         <asp:TemplateField HeaderText="" ShowHeader="True">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" ToolTip="Editar Cliente" CommandName="editar" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-pencil controles_tablas"></i></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>

                         <asp:TemplateField HeaderText="" ShowHeader="True">
                            <ItemTemplate>
                                    <asp:LinkButton ID="boton_llamada" runat="server" CausesValidation="False" ToolTip="Llamar" Enabled="True" 
                                    CommandName="llamada" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-phone iconos controles_tablas"></i></asp:LinkButton>
                            </ItemTemplate>
                             <ItemStyle HorizontalAlign="Center" />                           
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="" ShowHeader="True">
                            <ItemTemplate>
                                    <asp:LinkButton ID="boton_historial" runat="server" CausesValidation="False" ToolTip="Historial de llamadas" Enabled="True" 
                                    CommandName="historial" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-address-book iconos controles_tablas"></i></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />                         
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="" ShowHeader="True">
                            <ItemTemplate>
                                    <asp:LinkButton ID="boton_cotizar" runat="server" CausesValidation="False" ToolTip="Cotizar Sucursal" Enabled="False" 
                                    CommandName="cotizar" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-plus-square-o opcion_tabla controles_tablas"></i></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />                        
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="" ShowHeader="True">
                            <ItemTemplate>
                                    <asp:LinkButton ID="boton_bloquear" runat="server" CausesValidation="False" ToolTip="Bloquear Cliente" 
                                    CommandName="bloqueo" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-lock opcion_tabla controles_tablas"></i></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />                           
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="" ShowHeader="True">
                            <ItemTemplate>
                                    <asp:LinkButton ID="boton_desbloquear" runat="server" CausesValidation="False" ToolTip="Desbloquear Cliente" 
                                    CommandName="desbloqueo" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-unlock opcion_tabla controles_tablas"></i></asp:LinkButton>
                            </ItemTemplate>
                           <ItemStyle HorizontalAlign="Center" />                       
                        </asp:TemplateField>
                    </Columns>
                    </asp:GridView>                   
                </asp:Panel>

                  <asp:Panel ID="panel_admon" runat="server" CssClass="modulo-esp1" Visible="false" style="height:70%; width:65%;  " ScrollBars="Vertical"> 
                        <asp:LinkButton ID="btn_cerrar_admon" runat="server" CssClass="boton-cerrar" OnClick="cerrar_panel_admon" >
                                        <div class="cerrar-modulo2"><i class="fa fa-times"></i>&nbsp;Cerrar Módulo</div>    
                                </asp:LinkButton>
                           <asp:Panel ID="panel_admin" runat="server" CssClass="" Visible="true" >
                                <ul class="lista_banco">
                                     <li><asp:Label ID="vendedor" runat="server">Vendedor</asp:Label></li>
                                     <li><asp:DropDownList ID="lista_vendedores" runat="server" CssClass="input_form" ></asp:DropDownList></li>
                                     <li>Entre</li><li> <asp:TextBox ID="fecha_inicio" placeholder="Fecha Inicio" runat="server"  CssClass=" input_form"></asp:TextBox></li>
                                     <li> y </li><li><asp:TextBox ID="fecha_final" placeholder="Fecha Final" runat="server"  CssClass="input_form"></asp:TextBox></li>  
                                     <li><asp:LinkButton ID="boton_datos_vendendores" runat="server" ToolTip="" onclick="boton_vendedores" style="text-decoration:none;" CssClass="botones_requisiciones aprobar">Ver datos</asp:LinkButton></li> 
                                </ul>
                             </asp:Panel>
                              
                             <asp:Panel ID="panel_llamadas_historial" runat="server" CssClass="" Visible="false"  > 
                                <div  class="large-12 columns  separador-top" style="">                                    
                               
                                    <asp:GridView ID="tabla_llamadas_historial" runat="server" AutoGenerateColumns="False" DataSource='<%# datos_llamadas() %>'  CssClass="tabla" ShowHeaderWhenEmpty="True" PageSize="150">
                                    <HeaderStyle CssClass="GridHeader" />
		                            <PagerSettings Visible="False" />
		                            <RowStyle CssClass="GridRow" HorizontalAlign="Left" />
                                    <Columns>
                                        <asp:BoundField HeaderText="Nombre" DataField="nombre" ></asp:BoundField>
                                        <asp:BoundField HeaderText="Comentarios" DataField="comentario" ></asp:BoundField>
                                        <asp:BoundField HeaderText="Fecha agendada" DataField="fecha"></asp:BoundField>
                                        <asp:BoundField HeaderText="Fecha Registro" DataField="fecha_registro"></asp:BoundField>
                                         <asp:BoundField HeaderText="Estado" DataField="estado"></asp:BoundField>
                                    </Columns>
                                </asp:GridView>
                                 </div>  
                             </asp:Panel>  
                </asp:Panel> 

               <asp:Panel ID="panel_llamadas_pendientes" runat="server" CssClass="modulo-esp1" Visible="false" style="min-height:500px; min-width:700px; z-index:60;  " ScrollBars="Vertical"  > 
                    <asp:LinkButton ID="LinkButton2" runat="server" CssClass="boton-cerrar" OnClick="cerrar_panel_llamadas_pendientes" >
                                        <div class="cerrar-modulo2"><i class="fa fa-times"></i>&nbsp;Cerrar Módulo</div>    
                                </asp:LinkButton>

  
                                              
                                 <asp:GridView ID="tabla_llamadas_pendientes" runat="server" DataKeyNames="id" onrowcommand="tabla_pendientes_RowCommand" AutoGenerateColumns="False" DataSource='<%# datos_llamadas_pendientes() %>'  CssClass="tabla" ShowHeaderWhenEmpty="True" PageSize="150">
                                    <HeaderStyle CssClass="GridHeader" />
		                            <PagerSettings Visible="False" />
		                            <RowStyle CssClass="GridRow" HorizontalAlign="Left" />
                                    <Columns>
                                        <asp:BoundField HeaderText="Id" DataField="id" ></asp:BoundField>
                                        <asp:BoundField HeaderText="Nombre" DataField="nombre" ></asp:BoundField>
                                        <asp:BoundField HeaderText="Fecha" DataField="fecha"></asp:BoundField>
                                        <asp:BoundField HeaderText="Teléfono" DataField="contacto" ></asp:BoundField>

                                         <asp:TemplateField HeaderText="" ShowHeader="True">
                                            <ItemTemplate>
                                                    <asp:LinkButton ID="boton_llamar_pendiente" runat="server" CausesValidation="False" ToolTip="Llamar" Enabled="True" 
                                                    CommandName="llamada_pendientes" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-phone iconos "></i></asp:LinkButton>
                                            </ItemTemplate>
                                             <ItemStyle HorizontalAlign="Center" />                                               
                                        </asp:TemplateField>

                                    </Columns>
                                </asp:GridView>
                             
                 </asp:Panel>  
    
                <asp:Panel ID="panel_llamada" runat="server" CssClass="modulo-esp1" Visible="false" style="height:500px; width:500px; z-index:70; ">
                    <asp:LinkButton ID="LinkButton3" runat="server" CssClass="boton_cerrar_precios boton-cerrar" OnClick="cerrar_panel_llamada" >
                 <div class="cerrar-modulo2"><i class="fa fa-times"></i>&nbsp;Cerrar Módulo</div>  </asp:LinkButton>

                                <asp:HiddenField id="caja_id" runat="server"/>
                                    <center class="medio"><b>REGISTRO DE LLAMADA</b></center>
                                  <ul class="lista_banco">
                                        <li><asp:Label ID="Label_nombre_cliente" runat="server" Text=" " CssClass="medio"></asp:Label></li>
                                        <li><asp:Label ID="Label_contacto" runat="server" Text=" " CssClass="medio"></asp:Label></li> 
                                        <li><b><asp:Label ID="Label_telefono" runat="server" Text=" " CssClass=""></asp:Label></b></li> 
                                        <li><br/><b>Comentario anterior:</b> <asp:Label ID="label_comentarios" runat="server" Text=" " CssClass=""></asp:Label></li>
                                        <li><b>Fecha de último contacto:</b> <asp:Label ID="label_fecha_ultimo_contacto" runat="server" Text=" " CssClass=""></asp:Label></li>
                                      </ul>
                                      <ul class="lista_banco" style="line-height:none;">
                                        <li>Comentarios: <asp:TextBox ID="caja_comentarios_llamadas" placeholder="" runat="server"  CssClass=" llamada"></asp:TextBox></li>
                                       </ul>
                                      <ul class="lista_banco">
                                        <li><center class=""><b>Datos para próxima llamada</b></center></li>
                                           </ul>
                                      <ul class="lista_banco">
                                        <li><p class="">Fecha</p></li>
                                        <li><asp:TextBox ID="caja_fecha_reagendar" placeholder="Fecha para reagendar" runat="server"  CssClass=" llamada"></asp:TextBox></li>
                                           </ul>
                                      <ul class="lista_banco">
                                        <li><p class="">Hora</p></li>
                                        <li><asp:TextBox  ID="caja_hora_reagendar" placeholder="Hora para reagendar" runat="server" class="timepicker llamada"></asp:TextBox></li>
                                           </ul>
                                      <ul class="lista_banco">
                                        <li><asp:LinkButton ID="LinkButton8" runat="server" ToolTip="" onclick="boton_llamada" style="text-decoration:none;" CssClass="botones_requisiciones aprobar">Guardar</asp:LinkButton> 
                                   </ul>                                         
                            </asp:Panel>

  
       <asp:Panel ID="panel_historial" runat="server" CssClass="modulo-esp1" Visible="false" style="height:600px; width:600px; z-index:60;"  ScrollBars="Vertical" >
           <asp:LinkButton ID="LinkButton6" runat="server" CssClass="boton_cerrar_precios boton-cerrar" OnClick="cerrar_panel_historial" >
                 <div class="cerrar-modulo2"><i class="fa fa-times"></i>&nbsp;Cerrar Módulo</div>  </asp:LinkButton>
        <asp:GridView ID="tabla_historial" runat="server" AutoGenerateColumns="False" DataSource='<%# datos_historial() %>' CssClass="tabla" ShowHeaderWhenEmpty="True" PageSize="150">
               <HeaderStyle CssClass="GridHeader" />
		        <PagerSettings Visible="False" />
		        <RowStyle CssClass="GridRow" HorizontalAlign="Left" />
                <Columns>
                <asp:BoundField HeaderText="Fecha de llamada" DataField="fecha" ></asp:BoundField>
                <asp:BoundField HeaderText="Comentarios" DataField="comentarios" ></asp:BoundField>
                </Columns>
            </asp:GridView>                                      
        </asp:Panel>


                </div><!------------------------------------------------------------------------------------->
            </div>
            <!-------------PRINCIPAL--------------------------------------------------------------------------------------->
            <div id="sucursal_principal" style="">
             </div>
            <div id="herramientas" style="">
             </div>
            <div id="reportes" style="">
             </div>
                <div id="correo_masivo" style="">
             </div>
              </div><!-------------TABS--------------------------------------------------------------------------------------->
           </div><!-------------PRINCIPAL--------------------------------------------------------------------------------------->
        <div id="botones" class="contenido"  style=" position:fixed; background-color:white; height:10%; bottom:0; width:100%;">
             
                </div>
                      
<!---------------------------------------------------------------------------------------------------->
    <div id='alrt' class="notificacion_div"></div>
    <br/>
  </div></div>  
    </ContentTemplate>
    </asp:UpdatePanel>
    </form>