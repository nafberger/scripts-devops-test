# GitHub Actions Azure VM Setup Guide

This guide explains how to set up GitHub Actions to deploy to your Azure VM using the pipeline in this Infra folder.

## Setup Steps

### Step 1: Install GitHub Actions Runner on your Azure VM

1. **RDP into your Azure VM**

2. **Download the GitHub runner:**
   - Go to your GitHub repository → Settings → Actions → Runners
   - Click "New self-hosted runner"
   - Select Windows x64
   - Download and extract to `C:\actions-runner`

3. **Install the runner:**
   ```cmd
   # Run as Administrator
   cd C:\actions-runner
   .\config.cmd
   ```

4. **Configure the runner:**
   - GitHub repository URL: `https://github.com/your-username/your-repo`
   - Runner token: (provided by GitHub)
   - Runner group: Default
   - Runner name: Your VM name
   - Work folder: `C:\actions-runner\_work`
   - Run as service: Yes

5. **Install as Windows service:**
   ```cmd
   .\svc.cmd install
   .\svc.cmd start
   ```

### Step 2: Configure your Azure VM

Ensure your VM has:
- IIS installed with ASP.NET features
- .NET Framework 4.7.2 or higher

```cmd
# Install IIS and ASP.NET (run as Administrator)
dism /online /enable-feature /featurename:IIS-WebServerRole /featurename:IIS-WebServer /featurename:IIS-ASPNET45 /all
```

### Step 3: Configure GitHub Environment

1. **In GitHub:**
   - Go to repository → Settings → Environments
   - Create "production" environment
   - Add your self-hosted runner as a protection rule (optional)

### Step 4: Run the Pipeline

The pipeline in `github-actions-deploy.yml` will:
- Build your ASP.NET MVC app on GitHub-hosted runner
- Deploy to your VM using the self-hosted runner
- Use `microsoft/iis-deploy@v1` marketplace action for deployment

## Pipeline Overview

**Build Job (GitHub-hosted):**
- Checkout code
- Setup MSBuild and NuGet  
- Build and publish MVC app
- Upload artifact

**Deploy Job (Self-hosted on your VM):**
- Download artifact
- Deploy to IIS using marketplace action

## Troubleshooting

- **Runner not connecting:** Check firewall and GitHub connectivity
- **Deployment fails:** Verify IIS is installed and running
- **Build artifacts not found:** Check artifact names match between jobs

## Security Notes

- Self-hosted runner runs with local system privileges
- Store secrets in GitHub repository secrets
- Consider using environment protection rules
- Keep runner software updated