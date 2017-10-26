<%@ Page Language="C#" AutoEventWireup="true" CodeFile="codigo/estado_cuenta.aspx.cs" Inherits="estado_cuenta" %>
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
            $("#date").datepicker({ dateFormat: 'yy/mm/dd', disableTextInput: true, minDate: "0D" }).val();
        });
        $(function () {
            $("#caja_fecha_reagendar").datepicker({ dateFormat: 'yy/mm/dd', disableTextInput: true, minDate: "0D" }).val();
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

       $(function () {
           $("#fecha_inicio").datepicker({ dateFormat: 'yy/mm/dd' }).val();
       });
       $(function () {
           $("#fecha_final").datepicker({ dateFormat: 'yy/mm/dd' }).val();
       });
       $(function () {
           $("#caja_fecha_movimiento").datepicker({ dateFormat: 'yy/mm/dd' }).val();
       });



        function nada(e) {
            var key_press = document.all ? key_press = e.keyCode : key_press = e.which;
            return false;
        }
        
        $('#boton_agregar_pago').click(function () {
            var error = 0;
            $(".needed").each(function () {
                var id = $(this).attr('id');
                if ($(this).val() == '') {
                    $("#" + id).css('border-width', '2px');
                    $("#" + id).css('border-color', '#f75252');
                    error++;
                } else {
                    $("#" + id).css('border-width', '1px');
                    $("#" + id).css('border-color', '#cccccc');
                }
            });
            if (error == 0) {
               
            } else {
                document.getElementById('alrt').innerHTML = '<div class="notificacion_mensaje">Campos incompletos, revise nuevamente</div> ';
                setTimeout(function () { document.getElementById('alrt').innerHTML = ''; }, 3500);
                return false;
            }
        });
        
        $('.banco1').change(function () {
            if ($(".banco1").val() != 1) {
                $("#banco_label").css('visibility', 'visible');
                $("#caja_banco").css('visibility', 'visible');
                $("#cuenta_label").css('visibility', 'visible');
                $("#caja_cuenta").css('visibility', 'visible');
            } else {
                $("#banco_label").css('visibility', 'hidden');
                $("#caja_banco").css('visibility', 'hidden');
                $("#cuenta_label").css('visibility', 'hidden');
                $("#caja_cuenta").css('visibility', 'hidden');
            }            
        });

        $('#botonCancelarPago').click(function () {
            $("#panel_confirmacion").css('visibility', 'hidden');
            return false;
        });
        $('#botonContinuarPago').click(function () {
            $("#panel_confirmacion").css('visibility', 'hidden');
            return false;
        });
       

    }
        
    //****************************************************************************
    function up() {
        posicionar_cursor();
        var boton = document.getElementById('buscar');
        boton.click();
    }
    function banco_visible() {
        $("#panel_banco").css('visibility', 'visible');
    }
    function up_factura() {
        posicionar_cursor();
        var boton = document.getElementById('buscar_factura');
        boton.click();
    }

    function up_factura_busqueda() {
        posicionar_cursor();
        var boton = document.getElementById('boton_busqueda_factura');
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
    function imprimir() {
        var h = screen.height-100;
        var w = screen.width -30;
        window.open('imprimir_estado_cuenta.aspx', '_blank', 'toolbar=0,location=0,menubar=0,width=' + w + ',height=' + h + ', fullscreen=yes');
    }

    </script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Estado de cuenta</title> 
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
    .enlacesBotones {
        border:0px solid #2471a3;
        color:#2471a3; 
        padding:.5em;
        border-radius:6px; 
    }
    
    .enlacesBotones:hover {
        border: 0px solid #ffffff;
        color: #ffffff; 
        padding: .5em;
        border-radius: 6px;
        background-color: #2471a3; 
    }
      
    body {   
     font-family: 'Montserrat', sans-serif;
     color: #2C3E50;
    } 
        .notificacion_div{
            left:40%; 
            top:40%;
            position:absolute;
            z-index:999;
        }
        .notificacion_mensaje{
            background:#f75252;/* #e81414;*/
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
            font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
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
           line-height:3em;
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
        font: 200 12px/25px Arial, Helvetica, sans-serif;
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
<body bgcolor="white">
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
                   <asp:Label CssClass="titulo tipo_texto" ID="titulo" runat="server">Estado de cuenta</asp:Label>
                   <asp:LinkButton ID="boton_salir" runat="server" Text="" ToolTip="Salir" CssClass="boton_salir" ><i class="fa fa-times fa-lg"></i></asp:LinkButton>                
    </div>
        <!--FORMULARIO-->
    
     <div id="principal" class="contenido" style=" background-color:#ffffff;">
           <div style="" >
               <ul class="lista_banco">
                   <li><b>Id #:</b> <asp:Label ID="id_label" runat="server"></asp:Label></li>
                   <li><b>Cliente:</b> <asp:Label ID="nombre_label" runat="server"></asp:Label> </li>
                   <li><b>Por fechas: </b></li>
                   <li><asp:TextBox ID="fecha_inicio" placeholder="Fecha Inicio" runat="server"  CssClass="input_form"></asp:TextBox></li>
                   <li><asp:TextBox ID="fecha_final" placeholder="Fecha Final" runat="server"  CssClass="input_form"></asp:TextBox></li>  
                   <li><asp:LinkButton ID="boton_facturas_fechas" runat="server" ToolTip="" onclick="boton_por_fecha" style="text-decoration:none;" CssClass="enlacesBotones"><b><i class="fa fa-search"></i> Buscar</b></asp:LinkButton></li> 
                 
                     <li><b>Por factura </b></li>
                   <asp:Button ID="boton_busqueda_factura" runat="server"  Text="" onkeydown="buscar_factura();" Visible="True" style="visibility:hidden" onclick="consultar_factura_Click"/> 
                   <li><asp:TextBox ID="caja_factura_clave" runat="server"  CssClass="input_form"  onfocus="return posicionar_cursor(this.id);" ontextchanged="caja_busqueda_factura_TextChanged" onKeyUp="up_factura_busqueda();"></asp:TextBox></li>
             
                </ul>
               <ul class="lista_banco">
                   <li><asp:LinkButton ID="historial_Button" runat="server" CssClass="enlacesBotones" OnClick="boton_historial"><b><i class="fa fa-history "></i>  Historial</b></asp:LinkButton> 
                     <asp:DropDownList ID="historial_dropdown"  runat="server"  CssClass=" input_form" style="width:10em;height:2em;">
                     <asp:ListItem >Todo</asp:ListItem>
                     <asp:ListItem >Contado</asp:ListItem>
                     <asp:ListItem >Credito</asp:ListItem>
                     </asp:DropDownList><li></li>
                    </li>
                   <li><asp:LinkButton ID="deuda_Button" runat="server" CssClass="enlacesBotones" OnClick="boton_deuda"><b><i class="fa fa-exclamation-triangle"></i>  Facturas en deuda</b></asp:LinkButton></li>
                   <li><asp:LinkButton ID="LinkButton1" runat="server" CssClass="enlacesBotones" OnClick="abrir_panel_llamadas"><b><i class="fa fa-phone"></i> Registrar llamadas</b></asp:LinkButton></li>
                   <li><asp:LinkButton ID="LinkButton2" runat="server" CssClass="enlacesBotones" OnClick="historial_llamadas"><b><i class="fa fa-list-alt"></i> Historial de llamadas</b></asp:LinkButton></li>
               
               </ul>
           </div>
            

         <asp:Panel ID="panel_tabla" runat="server"  Visible="true"  >                
                    <asp:GridView ID="tabla_facturas" runat="server" AutoGenerateColumns="False" DataKeyNames="clave"  DataSource='<%# datos_facturas() %>' onrowcommand="tabla_facturas_RowCommand" CssClass="tabla"  ShowHeaderWhenEmpty="True" PageSize="100">
		            <HeaderStyle CssClass="GridHeader" />
                     <PagerSettings Visible="true" />
		            <RowStyle CssClass="GridRow " HorizontalAlign="Center" />
                    <Columns>
                        <asp:BoundField HeaderText="FECHA DE EMISIÓN" DataField="fecha" ></asp:BoundField>
                        <asp:BoundField HeaderText="VENCIMIENTO" DataField="vencimiento" ></asp:BoundField>
                        <asp:BoundField HeaderText="FOLIO" DataField="clave" ></asp:BoundField>
                        <asp:BoundField HeaderText="ESTADO" DataField="estado" ></asp:BoundField>                        
                        <asp:BoundField HeaderText="MÉTODO DE PAGO" DataField="metodo_pago" ></asp:BoundField> 
                        <asp:BoundField HeaderText="DESCRIPCIÓN" DataField="descripcion" ></asp:BoundField> 
                        <asp:BoundField HeaderText="CARGO" DataField="cargo" ></asp:BoundField>  
                        <asp:BoundField HeaderText="ABONO" DataField="abono" ></asp:BoundField>  
                        <asp:BoundField HeaderText="SALDO" DataField="saldo" ></asp:BoundField>   
                        
                        <asp:TemplateField HeaderText="" ShowHeader="True">
                            <ItemTemplate>
                                    <asp:LinkButton ID="b_agregar_pago" runat="server" CausesValidation="False" ToolTip="Agregar pago" Enabled="True" 
                                    CommandName="pagar" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-usd iconos controles_tablas"></i></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>  
                        <asp:TemplateField HeaderText="" ShowHeader="True">
                            <ItemTemplate>
                                    <asp:LinkButton ID="b_pdf" runat="server" CausesValidation="False" ToolTip="Ver factura" Enabled="True" 
                                    CommandName="imprimir" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-file-pdf-o iconos controles_tablas"></i></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField> 
                                             
                    </Columns>
                    </asp:GridView>                   
                </asp:Panel>

         <div style=" margin-top:2em;" >
              <ul class="lista_banco">
                   <li><b>Total facturas:</b> <asp:Label ID="total_facturas_label" runat="server"></asp:Label></li>
                   <li><b>Saldo total:</b> <asp:Label ID="saldo_total_label" runat="server"></asp:Label> </li>
               </ul>
           </div>
         <asp:Panel ID="panel_historial" runat="server"  CssClass="modulo-esp1 " Visible="false" ScrollBars="Auto"  style="height:70%; width:55%;  ">                
             <asp:LinkButton ID="cerrar_historial" runat="server" CssClass="boton-cerrar" OnClick="cerrar_panel_historial" >
                 <div class="cerrar-modulo2"><i class="fa fa-times"></i>&nbsp;Cerrar Módulo</div>  </asp:LinkButton>
                        <asp:Label ID="Label2" runat="server" style="font-weight:bold;">Historial de facturas</asp:Label> 
             <asp:LinkButton ID="boton_pdf_historial" runat="server" CssClass="enlacesBotones" style="float:right;" OnClick="historial_facturas_click"><b><i class="fa fa-file-pdf-o"></i>  Exportar a pdf</b></asp:LinkButton>
               
                    <asp:GridView ID="tabla_historial" runat="server" AutoGenerateColumns="False" DataKeyNames="clave"  DataSource='<%# datos_historial() %>' CssClass="tabla" ShowHeaderWhenEmpty="True" PageSize="500">
		            <HeaderStyle CssClass="GridHeader" />
                     <PagerSettings Visible="true" />
		            <RowStyle CssClass="GridRow " HorizontalAlign="Center" />
                    <Columns>
                        <asp:BoundField HeaderText="FECHA" DataField="fecha" ></asp:BoundField>
                        <asp:BoundField HeaderText="VENCIMIENTO" DataField="vencimiento" ></asp:BoundField>
                        <asp:BoundField HeaderText="FOLIO" DataField="clave" ></asp:BoundField>
                        <asp:BoundField HeaderText="ESTADO" DataField="estado" ></asp:BoundField>   
                        <asp:BoundField HeaderText="TIPO DE VENTA" DataField="tipo_venta" ></asp:BoundField>                       
                        <asp:BoundField HeaderText="MÉTODO DE PAGO" DataField="metodo_pago" ></asp:BoundField> 
                        <asp:BoundField HeaderText="CARGO" DataField="cargo" ></asp:BoundField>  
                    </Columns>
                    </asp:GridView>                   
                </asp:Panel>

          <asp:Panel ID="panel_deudas" runat="server"  CssClass="modulo-esp1 " Visible="false" ScrollBars="Auto"  style="height:70%; width:55%;  ">                
             <asp:LinkButton ID="cerrar_deudas" runat="server" CssClass="boton-cerrar " OnClick="cerrar_panel_deudas" >
                 <div class="cerrar-modulo2"><i class="fa fa-times"></i>&nbsp;Cerrar Módulo</div>  </asp:LinkButton>
                        <asp:Label ID="Label1" runat="server" style="font-weight:bold;" >Facturas en deuda</asp:Label>
                  <asp:LinkButton ID="boton_pdf_deudas" runat="server" CssClass="enlacesBotones" style="float:right;" OnClick="facturas_deuda_click"><b><i class="fa fa-file-pdf-o"></i>  Exportar a pdf</b></asp:LinkButton>

                    <asp:GridView ID="tabla_deudas" runat="server" AutoGenerateColumns="False" DataKeyNames="clave"  DataSource='<%# datos_deudas() %>' CssClass="tabla" ShowHeaderWhenEmpty="True" PageSize="500">
		            <HeaderStyle CssClass="GridHeader" />
                     <PagerSettings Visible="true" />
		            <RowStyle CssClass="GridRow " HorizontalAlign="Center" />
                    <Columns>
                        <asp:BoundField HeaderText="FECHA" DataField="fecha" ></asp:BoundField>
                        <asp:BoundField HeaderText="VENCIMIENTO" DataField="vencimiento" ></asp:BoundField>
                        <asp:BoundField HeaderText="FOLIO" DataField="clave" ></asp:BoundField>
                        <asp:BoundField HeaderText="TIPO DE VENTA" DataField="tipo_venta" ></asp:BoundField>   
                        <asp:BoundField HeaderText="MÉTODO DE PAGO" DataField="metodo_pago" ></asp:BoundField> 
                        <asp:BoundField HeaderText="CARGO" DataField="cargo" ></asp:BoundField>  
                    </Columns>
                    </asp:GridView>                   
                </asp:Panel>


         <!---P A G  A R ---------------------------------------------------------------------------------------------------------------------------------->
         <asp:Panel ID="panel_agregar_pago" runat="server" CssClass="modulo-esp1 " Visible="false" style="height:70%; width:55%;  " ScrollBars="Vertical"> 
             <asp:LinkButton ID="btn_cerrar_admon" runat="server" CssClass="boton-cerrar" OnClick="cerrar_panel_pago" >
                 <div class="cerrar-modulo2"><i class="fa fa-times"></i>&nbsp;Cerrar Módulo</div>  </asp:LinkButton>
             <asp:HiddenField id="metodoHidden" runat="server"/>
             <asp:HiddenField id="cuentaHidden" runat="server"/>
             <asp:HiddenField id="bancoHidden" runat="server"/>
             <ul class="lista_banco">
                 <li>Cliente <asp:TextBox ID="caja_sucursal"  runat="server"  CssClass=" input_form" style="    width:350px;"></asp:TextBox></li>
                 <li>Sucursal <asp:DropDownList ID="subsucursal_dropdown"  runat="server"  CssClass=" input_form"></asp:DropDownList></li>
                 <li>Fecha <asp:TextBox ID="caja_fecha_movimiento" runat="server"  CssClass=" input_form needed"></asp:TextBox></li>
              </ul>

             <ul class="lista_banco">
                 <li>Factura #<asp:TextBox ID="caja_factura" runat="server"  CssClass=" input_form needed" style="text-transform:uppercase;" onfocus="return posicionar_cursor(this.id);" ontextchanged="caja_factura_TextChanged" onKeyUp="up_factura();"></asp:TextBox></li>
                 <asp:Button ID="buscar_factura" runat="server"  Text="" onkeydown="buscar_factura();" Visible="True" style="visibility:hidden" onclick="buscar_factura_Click"/> 
                 <li>Moneda <asp:DropDownList ID="caja_moneda"  runat="server"  CssClass=" input_form">
                     <asp:ListItem>Pesos</asp:ListItem>
                     <asp:ListItem>Dolares</asp:ListItem>
                     </asp:DropDownList>
                 </li>
                 <li>Tipo de cambio <asp:TextBox ID="caja_tipo_cambio"  runat="server" Enabled="false" CssClass=" input_form" style="width:200px;"></asp:TextBox></li>
             </ul>
             <ul class="lista_banco"> <li>Descripción: <asp:TextBox ID="caja_descripcion_pago"  runat="server"  CssClass=" input_form " style="width:69em;"></asp:TextBox></li></ul>

             <ul class="lista_banco">
                 <li>Tipo de depósito a cortes: <asp:DropDownList ID="caja_tipo_deposito"  runat="server"  CssClass=" input_form">
                    <asp:ListItem>No generar movimiento</asp:ListItem>   
                     <asp:ListItem>Depositar al banco</asp:ListItem>
                     <asp:ListItem>Depositar a caja chica</asp:ListItem>
                 </asp:DropDownList></li>
                 <li>Importe <asp:TextBox ID="caja_importe"  runat="server"  CssClass=" input_form needed" style="width:200px;"></asp:TextBox></li>
                 <li>Saldo a favor: <asp:TextBox ID="caja_saldo_favor" Enabled="false" runat="server" style="font-weight:bolder;" CssClass="input_form"></asp:TextBox> </li>   
             </ul>

             <ul class="lista_banco">
                  <li>Método de pago <asp:DropDownList ID="caja_metodo_pago"  runat="server"  CssClass="banco1 input_form">
                    </asp:DropDownList></li>
                 <li><asp:Label ID="banco_label" runat="server"  style="visibility:hidden;">Banco </asp:Label>
                     <asp:DropDownList ID="caja_banco"  runat="server"  CssClass=" input_form needed" style="visibility:hidden;">
                         <asp:ListItem Value="0" Text="Seleccionar"></asp:ListItem></asp:DropDownList></li>
                    <li ><asp:Label ID="cuenta_label" runat="server"  style="visibility:hidden;">Cuenta </asp:Label><asp:TextBox ID="caja_cuenta"  runat="server" style="font-weight:bolder; visibility:hidden;" CssClass="input_form"></asp:TextBox> </li>  
             </ul>           

             <asp:Panel ID="panel_tabla_documentos_pendientes" runat="server" CssClass=" " Visible="false" >
             <asp:GridView ID="tabla_documentos_por_pagar" runat="server" DataKeyNames="clave_factura" AutoGenerateColumns="False" DataSource='<%# datos_facturas_pendientes() %>' CssClass="tabla" ShowHeaderWhenEmpty="True" PageSize="150">
               <HeaderStyle CssClass="GridHeader" />
		        <PagerSettings Visible="False" />
		        <RowStyle CssClass="GridRow" HorizontalAlign="Center" />
                <Columns>
                    <asp:BoundField HeaderText="Factura" DataField="clave_factura" ></asp:BoundField>
                    <asp:BoundField HeaderText="Fecha" DataField="fecha" ></asp:BoundField>
                    <asp:BoundField HeaderText="Total" DataField="total" ></asp:BoundField>
                    <asp:TemplateField >
                    <ItemTemplate>
                        <asp:CheckBox ID="facturacion" runat="server" Checked="false"/>
                    </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView> 
            </asp:Panel> 
             <ul class="lista_banco">
             </ul>
             <br />
            <asp:LinkButton ID="boton_agregar_pago" runat="server" ToolTip="" style="text-decoration:none; right:10%; position:absolute;" CssClass="botones_requisiciones aprobar" OnClick="guardar_pago">Guardar</asp:LinkButton> 
             
         </asp:Panel> 
<!----------------------------------------------------------------------------------------------------------------------------------------------------------->

         <asp:Panel ID="panel_historial_llamadas" runat="server" CssClass="modulo-esp1" Visible="false" style="height:600px; width:600px; z-index:60;"  ScrollBars="Vertical" >
           <asp:LinkButton ID="LinkButton6" runat="server" CssClass="boton_cerrar_precios boton-cerrar" OnClick="cerrar_panel_historial_llamadas" >
                 <div class="cerrar-modulo2"><i class="fa fa-times"></i>&nbsp;Cerrar Módulo</div>  </asp:LinkButton>
        <asp:GridView ID="tabla_historial_llamadas" runat="server" AutoGenerateColumns="False" DataSource='<%# datos_historial_llamadas() %>' CssClass="tabla" ShowHeaderWhenEmpty="True" PageSize="150">
               <HeaderStyle CssClass="GridHeader" />
		        <PagerSettings Visible="False" />
		        <RowStyle CssClass="GridRow" HorizontalAlign="Left" />
                <Columns>
                <asp:BoundField HeaderText="Fecha de llamada" DataField="fecha" ></asp:BoundField>
                <asp:BoundField HeaderText="Comentarios" DataField="comentarios" ></asp:BoundField>
                </Columns>
            </asp:GridView>                                      
        </asp:Panel>

         <asp:Panel ID="panel_llamada" runat="server" CssClass="modulo-esp1" Visible="false" style="height:500px; width:500px; z-index:70; ">
                    <asp:LinkButton ID="LinkButton3" runat="server" CssClass="boton_cerrar_precios boton-cerrar" OnClick="cerrar_panel_llamada" >
                 <div class="cerrar-modulo2"><i class="fa fa-times"></i>&nbsp;Cerrar Módulo</div>  </asp:LinkButton>
                                <asp:HiddenField id="caja_id" runat="server"/>
                                    <center class="medio"><b>REGISTRO DE LLAMADA</b></center>
                                  
                                      <ul class="" style="list-style-type:none; line-height:2;">
                                        <li><asp:Label ID="Label_nombre_cliente" runat="server" Text=" " CssClass="medio"></asp:Label></li>
                                        <li><asp:Label ID="Label_contacto" runat="server" Text=" " CssClass="medio"></asp:Label></li> 
                                        <li><b><asp:Label ID="Label_telefono" runat="server" Text=" " CssClass=""></asp:Label></b></li> 
                                        <li><b>Comentario anterior:</b> <asp:Label ID="label_comentarios" runat="server" Text=" " CssClass=""></asp:Label></li>
                                        <li><b>Fecha de último contacto:</b> <asp:Label ID="label_fecha_ultimo_contacto" runat="server" Text=" " CssClass=""></asp:Label></li>
                                        <li>Comentarios: <asp:TextBox ID="caja_comentarios_llamadas" placeholder="" runat="server"  CssClass=" llamada"></asp:TextBox></li>
                                        <li></li>
                                        <li><center class=""><b>Datos para próxima llamada</b></center></li>
                                        <li>Fecha <asp:TextBox ID="caja_fecha_reagendar" placeholder="Fecha para reagendar" runat="server"  CssClass=" llamada"></asp:TextBox></li>
                                        <li>Hora <asp:TextBox  ID="caja_hora_reagendar" placeholder="Hora para reagendar" runat="server" class="timepicker llamada"></asp:TextBox></li>
                                      </ul>
                                      <ul class="lista_banco">
                                        <li><asp:LinkButton ID="LinkButton8" runat="server" ToolTip="" onclick="boton_llamada" style="text-decoration:none;" CssClass="botones_requisiciones aprobar">Guardar</asp:LinkButton> 
                                   </ul>                                         
                            </asp:Panel>

                



     </div><!-------------PRINCIPAL--------------------------------------------------------------------------------------->
            
                      
<!---------------------------------------------------------------------------------------------------->
    <div id='alrt' class="notificacion_div"></div>
    <br/>
  </div> 
    </ContentTemplate>
    </asp:UpdatePanel>
    </form>