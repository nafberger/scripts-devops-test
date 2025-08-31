# Infrastructure Configuration

This folder contains the Azure DevOps pipeline and deployment configurations for the SimpleWebFormsTest application.

## Azure DevOps Pipeline Setup

### Prerequisites

1. **Azure VM with IIS enabled**
   - Windows Server with IIS role installed
   - .NET Framework 4.7.2 or higher
   - PowerShell execution policy set to allow scripts

2. **Azure DevOps Configuration**
   - Project connected to GitHub repository
   - Environment named "Production" configured with your Azure VM
   - Self-hosted agent installed on the Azure VM (recommended for deployment)

### Pipeline Configuration Steps

1. **Create New Pipeline in Azure DevOps:**
   - Go to Pipelines → New Pipeline
   - Select GitHub as source
   - Choose your repository: `nafberger/scripts-devops-test`
   - Select "Existing Azure Pipelines YAML file"
   - Choose `/infra/azure-pipelines.yml`

2. **Configure Environment:**
   - Go to Environments → New Environment
   - Name: "Production"
   - Add your Azure VM as a resource
   - Install self-hosted agent on VM for deployment tasks

3. **Pipeline Variables (if needed):**
   - `deploymentPath`: Default is `C:\inetpub\wwwroot\SimpleWebFormsTest`
   - Modify in the YAML file if deploying to different location

### Deployment Process

The pipeline performs these steps:

**Build Stage:**
1. Checkout source from GitHub
2. Build solution using MSBuild
3. Copy web application files
4. Publish artifacts

**Deploy Stage:**
1. Download build artifacts
2. Stop IIS application pool
3. Deploy files to IIS directory
4. Configure IIS application pool (.NET Framework 4.0)
5. Create/update IIS website on port 8080
6. Set proper permissions for IIS_IUSRS
7. Start application pool
8. Perform health check

### Access Application

After successful deployment:
- Application will be available at: `http://[VM-IP]:8080`
- IIS Application Pool: "SimpleWebFormsTest"
- Physical Path: `C:\inetpub\wwwroot\SimpleWebFormsTest`

### Troubleshooting

**Common Issues:**
- Ensure IIS is installed and running on Azure VM
- Verify .NET Framework 4.7.2+ is installed
- Check Windows Firewall allows port 8080
- Confirm IIS_IUSRS has proper permissions
- Verify self-hosted agent has admin privileges

**Logs:**
- Check Azure DevOps pipeline logs for build/deployment errors
- Review IIS logs at: `C:\inetpub\logs\LogFiles\W3SVC1\`
- Windows Event Viewer → Application logs for ASP.NET errors