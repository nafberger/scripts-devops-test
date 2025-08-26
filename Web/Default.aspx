<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Welcome - Integra Scripts Test</title>
    <meta name="robots" content="noindex,nofollow" />
    <link href="css/site.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        body {
            font-family: Lucida Grande, Arial, Helvetica, sans-serif;
            font-size: 12pt;
            background-color: #f5f5f5;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            background-color: #ffffff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        .header {
            text-align: center;
            border-bottom: 2px solid #0066cc;
            padding-bottom: 20px;
            margin-bottom: 30px;
        }
        .header h1 {
            color: #0066cc;
            font-size: 28px;
            margin: 0;
        }
        .welcome-message {
            background-color: #e8f4fd;
            border: 1px solid #b3d9ff;
            padding: 20px;
            border-radius: 5px;
            margin: 20px 0;
        }
        .info-panel {
            background-color: #f9f9f9;
            border: 1px solid #ddd;
            padding: 15px;
            margin: 20px 0;
            border-radius: 4px;
        }
        .button-panel {
            text-align: center;
            margin: 30px 0;
        }
        .asp-button {
            background-color: #0066cc;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
        }
        .asp-button:hover {
            background-color: #0052a3;
        }
        .footer {
            text-align: center;
            margin-top: 40px;
            padding-top: 20px;
            border-top: 1px solid #ddd;
            color: #666;
            font-size: 10pt;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="header">
                <h1>Welcome to Integra Scripts Test Application</h1>
                <p>ASP.NET Web Forms - Legacy Technology Stack Demo</p>
            </div>
            
            <div class="welcome-message">
                <asp:Label ID="lblWelcomeMessage" runat="server" 
                    Text="Welcome! This is a test application built with the same technology stack as the main Integra Scripts system.">
                </asp:Label>
            </div>
            
            <div class="info-panel">
                <h3>System Information</h3>
                <p><strong>Current Date/Time:</strong> 
                    <asp:Label ID="lblCurrentDateTime" runat="server"></asp:Label>
                </p>
                <p><strong>Server Name:</strong> 
                    <asp:Label ID="lblServerName" runat="server"></asp:Label>
                </p>
                <p><strong>.NET Framework Version:</strong> 
                    <asp:Label ID="lblDotNetVersion" runat="server"></asp:Label>
                </p>
                <p><strong>Application Environment:</strong> 
                    <asp:Label ID="lblEnvironment" runat="server"></asp:Label>
                </p>
            </div>
            
            <div class="info-panel">
                <h3>Technology Stack</h3>
                <ul>
                    <li>ASP.NET Web Forms (.NET Framework 4.7.2)</li>
                    <li>XHTML 1.0 Transitional</li>
                    <li>Server Controls with ViewState</li>
                    <li>Code-behind Pattern</li>
                    <li>Classic ASP.NET Configuration</li>
                </ul>
            </div>
            
            <div class="button-panel">
                <asp:Button ID="btnTestPostBack" runat="server" 
                    Text="Test Server PostBack" 
                    CssClass="asp-button"
                    OnClick="btnTestPostBack_Click" />
            </div>
            
            <div class="info-panel">
                <h3>PostBack Test Result</h3>
                <asp:Panel ID="pnlPostBackResult" runat="server" Visible="false">
                    <p style="color: green; font-weight: bold;">
                        <asp:Label ID="lblPostBackMessage" runat="server"></asp:Label>
                    </p>
                </asp:Panel>
            </div>
            
            <div class="footer">
                <p>&copy; 2024 Integra Scripts Test Application | Built with Classic ASP.NET Web Forms</p>
                <p>This application demonstrates the legacy technology stack used in healthcare systems.</p>
            </div>
        </div>
    </form>
</body>
</html>