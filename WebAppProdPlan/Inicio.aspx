<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="WebAppProdPlan.Inicio" %>

<!DOCTYPE html>
<html>
<link rel="shortcut icon" href="Media/skytex.ico">
    <head>
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/> 
        <link rel="stylesheet" href="Content/bootstrap.css" type="text/css"/>
        <link rel="stylesheet" href="Content/animacion.css" type="text/css"/>
        <title>Aplicación interactiva de planeación y producción </title>
    </head>
    
    <body onload="redirecciona();">
        <div class="container-fluid">
            <div class="container" id="centro">
                <center>
                    <div class="row">
                        <div class="">
                            <iframe id="skytexGif.html" src="Media/Skytex/skytexGif.html" frameborder="0" scrolling="no" allowTransparency="true"></iframe>
                            <!--<img src="img/logo2.png" class="img-responsive" width="300" height="75" />-->
                        </div>
                    </div>  
                    <br>
                    <div class="row">
                        <div class="">
                            <div id="preloader6" class="text-center">
                                <span></span>
                                <span></span>
                                <span></span>
                                <span></span>
                            </div>
                        </div>
                    </div> 
                </center> 
            </div>
        <div>
    </body>
    <script>
        function redirecciona() {
            setTimeout("location.href='Planeacion.aspx'", 4000);
        }
    </script>
</html>