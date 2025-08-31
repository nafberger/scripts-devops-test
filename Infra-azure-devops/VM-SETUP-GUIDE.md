# Azure VM Deployment Setup Guide

This guide explains how to connect your Azure DevOps pipeline to your Azure VM for deployment.

## Option 1: Self-hosted Agent (Recommended)

### Step 1: Install Azure DevOps Agent on your VM

1. **RDP into your Azure VM**

2. **Download the agent:**
   - Go to Azure DevOps → Project Settings → Agent pools → Default → New agent
   - Download Windows x64 agent
   - Extract to `C:\agent`

3. **Install the agent:**
   ```powershell
   # Run as Administrator
   cd C:\agent
   .\config.cmd
   ```

4. **Configure the agent:**
   - Server URL: `https://dev.azure.com/{your-organization}`
   - Authentication type: PAT (Personal Access Token)
   - Agent pool: Create new pool named "AzureVM-Pool"
   - Agent name: Your VM name
   - Run as service: Yes

5. **Update the pipeline:**
   In `azure-pipelines.yml`, replace the deployment job with:
   ```yaml
   - deployment: DeployToVM
     displayName: 'Deploy to IIS on Azure VM'
     pool: 'AzureVM-Pool'  # Your agent pool name
     environment: 'Production'
     strategy:
       runOnce:
         deploy:
           steps:
           # ... rest of deployment steps
   ```

### Step 2: Required VM Configuration

Ensure your VM has:
- IIS installed with ASP.NET features
- .NET Framework 4.7.2 or higher
- PowerShell execution policy set appropriately

```powershell
# Install IIS and ASP.NET (run as Administrator)
Enable-WindowsOptionalFeature -Online -FeatureName IIS-WebServerRole, IIS-WebServer, IIS-ASPNET45

# Set PowerShell execution policy
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope LocalMachine
```

## Option 2: Environment with VM Resource

### Step 1: Register VM in Azure DevOps Environment

1. **In Azure DevOps:**
   - Go to Pipelines → Environments
   - Create/select "Production" environment
   - Add resource → Virtual machines

2. **On your Azure VM:**
   - Run the registration script provided by Azure DevOps
   - This installs a deployment agent

3. **Configure VM access:**
   - Ensure VM has public IP or VPN connectivity
   - Configure NSG rules if needed

### Step 2: Update Pipeline

Keep the current configuration:
```yaml
environment: 'Production'
```

## Option 3: Remote Deployment (Not Recommended)

If you must use remote deployment:

1. **Enable WinRM on VM:**
   ```powershell
   Enable-PSRemoting -Force
   Set-Item WSMan:\localhost\Client\TrustedHosts -Value "*" -Force
   ```

2. **Update pipeline to use remote tasks:**
   ```yaml
   - task: PowerShellOnTargetMachines@3
     inputs:
       Machines: 'YOUR-VM-IP'
       UserName: 'vmadmin'
       UserPassword: '$(VMPassword)'  # Store in pipeline variables
       ScriptType: 'InlineScript'
       InlineScript: |
         # Deployment commands here
   ```

## Recommended Approach

**Use Option 1 (Self-hosted Agent)** because:
- Direct access to VM file system
- No network configuration required
- More secure (no open ports)
- Better performance
- Easier troubleshooting

## Security Notes

- Store sensitive values (passwords, tokens) in Azure DevOps variable groups
- Use service accounts with minimal required permissions
- Enable VM disk encryption
- Configure firewall rules appropriately

## Troubleshooting

- **Agent not connecting:** Check firewall and proxy settings
- **Deployment fails:** Verify IIS permissions and app pool configuration
- **Health check fails:** Ensure website bindings and port availability