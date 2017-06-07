<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CS.aspx.cs" Inherits="WebAppProdPlan.CS" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Aplicación interactiva de planeación y producción</title>

    <link rel="shortcut icon" href="Media/skytex.ico" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link type="text/css" rel="stylesheet" href="<%=ResolveUrl("Content/bootstrap.css")%>" />

    <script type="text/javascript" src="<%= ResolveClientUrl("Scripts/jquery-1.7.1.min.js") %>"></script>
    <script type="text/javascript" src="<%= ResolveClientUrl("Scripts/highcharts.js") %>"></script>
    <script type="text/javascript" src="<%= ResolveClientUrl("Scripts/highcharts-3d.js") %>"></script>
    <script type="text/javascript" src="<%= ResolveClientUrl("Scripts/grid-light.js") %>"></script>
    <script type="text/javascript" src="<%= ResolveClientUrl("Scripts/graficoApProdPlan.js") %>"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:ScriptManager ID="script" runat="server" EnablePartialRendering="true"></asp:ScriptManager>
            <asp:Button ID="btn" runat="server" Text="Actualizar Adentro"  />
            <asp:UpdatePanel ID="up" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <fieldset>
                        <asp:Label ID="lbl" runat="server" Text="Label"></asp:Label>
                    </fieldset>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btn" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>
            <asp:Label ID="lbl2" runat="server" Text="Label"></asp:Label><br />
            <asp:Button ID="btn2" runat="server" Text="Actualizar Ambos" />
        </div>
    </form>
</body>
</html>
