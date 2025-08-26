using System;
using System.Configuration;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            LoadSystemInformation();
        }
    }

    private void LoadSystemInformation()
    {
        try
        {
            // Display current date and time
            lblCurrentDateTime.Text = DateTime.Now.ToString("dddd, MMMM dd, yyyy 'at' hh:mm:ss tt");
            
            // Display server name
            lblServerName.Text = Environment.MachineName;
            
            // Display .NET Framework version
            lblDotNetVersion.Text = Environment.Version.ToString();
            
            // Display environment from web.config
            string environment = ConfigurationManager.AppSettings["Environment"] ?? "Unknown";
            lblEnvironment.Text = environment;
            
            // Update welcome message with company name from config
            string companyName = ConfigurationManager.AppSettings["CompanyName"] ?? "Integra Scripts Test";
            lblWelcomeMessage.Text = "Welcome to " + companyName + "! This is a test application built with the same technology stack as the main healthcare system.";
            
            // Hide postback result panel initially
            pnlPostBackResult.Visible = false;
        }
        catch (Exception ex)
        {
            // Simple error handling - in production you'd log this
            lblWelcomeMessage.Text = "Error loading system information: " + ex.Message;
            lblWelcomeMessage.ForeColor = System.Drawing.Color.Red;
        }
    }

    protected void btnTestPostBack_Click(object sender, EventArgs e)
    {
        try
        {
            // Demonstrate classic Web Forms postback
            lblPostBackMessage.Text = "PostBack successful! Button clicked at: " + DateTime.Now.ToString("hh:mm:ss tt");
            pnlPostBackResult.Visible = true;
            
            // Optional: Add some ViewState demonstration
            if (ViewState["ClickCount"] == null)
            {
                ViewState["ClickCount"] = 1;
            }
            else
            {
                ViewState["ClickCount"] = (int)ViewState["ClickCount"] + 1;
            }
            
            lblPostBackMessage.Text += " (Click #" + ViewState["ClickCount"] + ")";
        }
        catch (Exception ex)
        {
            lblPostBackMessage.Text = "Error during postback: " + ex.Message;
            lblPostBackMessage.ForeColor = System.Drawing.Color.Red;
            pnlPostBackResult.Visible = true;
        }
    }
}