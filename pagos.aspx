<%@ Page Language="C#" AutoEventWireup="true" CodeFile="codigo/pagos.aspx.cs" Inherits="pagos" %>
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
    function guardado() {
        document.getElementById('alrt').innerHTML = '<div class="notificacion_mensaje">Pago agregado</div> ';
        setTimeout(function () { document.getElementById('alrt').innerHTML = ''; }, 2000);
        return false;
    }
    function error_estado() {
        document.getElementById('alrt').innerHTML = '<div class="notificacion_mensaje">No puede agregar un pago a esta factura</div> ';//PENDIENTE
        setTimeout(function () { document.getElementById('alrt').innerHTML = ''; }, 2000);
        return false;
    }
    function pageLoad() {
        $(function () {
            $("#tabs").tabs();
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
                /*if ($('#caja_metodo_pago').val() == $('#metodoHidden').val() && $('#caja_banco').val() == $('#bancoHidden').val() && $('#caja_cuenta').val() == $('#cuentaHidden').val()) {
                    alert("test 001");
                    return false;
                } else {
                    $("#panel_confirmacion").css('visibility', 'visible');
                    alert("Método: "+$('#caja_metodo_pago').val() +"//"+ $('#metodoHidden').val() +"Banco: "+ $('#caja_banco').val()+"//"+$('#bancoHidden').val() +"Cuenta: "+ $('#caja_cuenta').val() +"//"+ $('#cuentaHidden').val());
                    return false;
                }*/
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
        $("#banco_cuenta").css('visibility', 'visible');
    }
    function up_factura() {
        posicionar_cursor();
        var boton = document.getElementById('buscar_factura');
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

    </script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Pagos - Inklaser</title>
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
     font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; 
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
                   <asp:Label CssClass="titulo tipo_texto" ID="titulo" runat="server">Pagos</asp:Label>
                   <asp:LinkButton ID="boton_salir" runat="server" Text="" ToolTip="Salir" CssClass="boton_salir" ><i class="fa fa-times fa-lg"></i></asp:LinkButton>                
    </div>
        <!--FORMULARIO-->
     <asp:HiddenField id="mensaje" runat="server"/>

     <asp:HiddenField id="metodoHidden" runat="server"/>
     <asp:HiddenField id="cuentaHidden" runat="server"/>
     <asp:HiddenField id="bancoHidden" runat="server"/>

     <div id="principal" class="contenido" style=" height:100%; width:100%; position:fixed; top:0; left:0px;">
            <div id="tabs" style=" height:100%; width:100%;">
               <ul id="menu_principal" class="tabs">
                <li><a href="#inicio">Inicio</a></li>
                <!--<li><a href="#sucursal_principal">Sucursal</a></li>
                <li><a href="#herramientas">Herramientas</a></li>
                <li><a href="#reportes">Reportes</a></li>
                <li><a href="#correo_masivo">Correo masivo</a></li>-->
              </ul>
             
             <div id="inicio" style=" height:100%; width:100%;">
                <ul class="lista_banco">
                            <li><asp:Label ID="t_busqueda" runat="server" Text="Buscar: "></asp:Label></li>            
                            <li><div >
                                <asp:TextBox ID="caja_busqueda" placeholder="Introduce un nombre" onfocus="return posicionar_cursor(this.id);" runat="server" Enabled="True" CssClass="input_form" ontextchanged="caja_busqueda_TextChanged" onKeyUp="up();" ></asp:TextBox> <i class="fa fa-search"></i>                        
                                </div></li>                           
                             </ul> 
                       <asp:Button ID="buscar" runat="server"  Text="actualizar" onkeydown="buscar();" Visible="True" style="visibility:hidden" onclick="buscar_Click"/>                      
                 
                <div >  
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
                        <asp:BoundField HeaderText="TELÉFONO" DataField="telefono" >                        
                        </asp:BoundField>
                
                         <asp:TemplateField HeaderText="" ShowHeader="True">
                            <ItemTemplate>
                                    <asp:LinkButton ID="b_agregar_pago" runat="server" CausesValidation="False" ToolTip="Agregar pago" Enabled="True" 
                                    CommandName="pagar" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-usd iconos controles_tablas"></i></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="" ShowHeader="True">
                            <ItemTemplate>
                                    <asp:LinkButton ID="b_anticipo" runat="server" CausesValidation="False" ToolTip="Agregar anticipo" Enabled="True" 
                                    CommandName="anticipo" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-plus iconos controles_tablas"></i></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="" ShowHeader="True">
                            <ItemTemplate>
                                    <asp:LinkButton ID="b_estado_cuenta" runat="server" CausesValidation="False" ToolTip="Ver estado de cuenta" Enabled="True" 
                                    CommandName="estado" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-list-ol iconos controles_tablas"></i></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>

                    </Columns>
                    </asp:GridView>                   
                </asp:Panel>
                     </div>


               
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
       
         <asp:Panel ID="panel_agregar_pago" runat="server" CssClass="modulo-esp1 " Visible="false" style="height:70%; width:55%;  " ScrollBars="Vertical"> 
             <asp:LinkButton ID="btn_cerrar_admon" runat="server" CssClass="boton-cerrar" OnClick="cerrar_panel_pago" >
                 <div class="cerrar-modulo2"><i class="fa fa-times"></i>&nbsp;Cerrar Módulo</div>  </asp:LinkButton>

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

          <asp:Panel ID="panel_anticipo" runat="server" CssClass="modulo-esp1 " Visible="false" style="height:30%; width:40%;" ScrollBars="Vertical"> 
             <asp:LinkButton ID="LinkButton1" runat="server" CssClass="boton-cerrar" OnClick="cerrar_panel_anticipo" >
                 <div class="cerrar-modulo2"><i class="fa fa-times"></i>&nbsp;Cerrar Módulo</div>  </asp:LinkButton>
             <ul class="lista_banco">
                 <li>Saldo a favor acumulado <asp:TextBox ID="caja_saldo_acumulado"  runat="server" Enabled="false" CssClass=" input_form" ></asp:TextBox></li>
                 <li>Agregar anticipo de <asp:TextBox ID="caja_anticipo" runat="server"  CssClass=" input_form needed"></asp:TextBox></li>
              </ul>            
             <br />
            <asp:LinkButton ID="LinkButton2" runat="server" ToolTip="" style=" text-decoration:none; right:10%; position:absolute;" CssClass="botones_requisiciones aprobar" OnClick="guardar_anticipo">Guardar</asp:LinkButton> 
             
         </asp:Panel> 
            <asp:Panel ID="panel_confirmacion" runat="server" CssClass="banco " style="z-index:999; visibility:hidden; align-content:center; position:absolute; background-color:white; width:14em; height:7em; top:40%;left:45%; border:solid 1px #2471a3; border-radius:6px; padding:2em;" >
                El método de pago es distinto al de la factura, ¿desea continuar?<br /><br />
                <asp:LinkButton ID="botonCancelarPago" runat="server"  style="text-decoration:none;" CssClass="botones_requisiciones aprobar" >Cancelar</asp:LinkButton> 
                <asp:LinkButton ID="botonContinuarPago" runat="server" style="text-decoration:none; ;" CssClass="botones_requisiciones aprobar" OnClick="guardar_pago">Continuar</asp:LinkButton>              
         </asp:Panel>          
<!---------------------------------------------------------------------------------------------------->
         
    <div id='alrt' class="notificacion_div"></div>
    <br/>
  </div></div>  
    </ContentTemplate>
    </asp:UpdatePanel>
    </form>