# Prerequisites for GitHub Actions IIS Deployment (Option B)

This document lists the **one-time prerequisites** you need on your IIS VM and GitHub repository before the GitHub Actions workflow can build and deploy your **Web Site Project (WSP)**.

---

## 1. IIS VM Setup
- **Install a Self-Hosted GitHub Runner**  
  - Download from your repo/org: `Settings → Actions → Runners → New self-hosted runner`  
  - Configure on the IIS VM:
    ```powershell
    .\config.cmd --url https://github.com/<org>/<repo> --token <TOKEN>
    .\run.cmd
    .\svc install
    .\svc start
    ```
  - Make sure the runner runs as a Windows service with **permissions to `C:\inetpub\wwwroot\...`** and the ability to manage IIS.

- **Install Web Deploy (MSDeploy)**  
  - Download **Web Deploy 3.x** from Microsoft.  
  - Install with default settings.

- **Enable Web Management Service (WMSvc)**  
  - Open **IIS Manager → Management Service**.  
  - Set service to **Automatic** and **Start** it.  
  - Confirm it listens on **TCP 8172** (localhost is fine if the runner is on the box).

- **Create/Enable a Deployment User**  
  - Either a local Windows user or domain account.  
  - Grant this account **IIS Manager Permissions** for the site.  
  - Make sure it can authenticate with Web Deploy.

---

## 2. IIS Site & Application Pool
- Create or confirm an **App Pool** for your site.  
  - Example: `SimpleWebFormsTest`  
  - Runtime: **.NET v4.0**  
  - Enable **32-bit apps** if needed.

- Create or confirm the **Website** in IIS.  
  - Example: `SimpleWebFormsTest` → Physical Path: `C:\inetpub\wwwroot\SimpleWebFormsTest`  
  - Port: `8080` (or as required).

---

## 3. GitHub Repository Setup
- **Repository Secrets** (Settings → Secrets and variables → Actions):
  - `MSDEPLOY_USER` → the deploy user name.  
  - `MSDEPLOY_PASSWORD` → the deploy user password.

- **Environment Protection** (Settings → Environments → `production`):
  - Create an environment called `production`.  
  - Add **Required Reviewers** (so only managers can approve deploys).  
  - Store secrets here if you want stricter scoping.

---

## 4. Networking & Security
- If deploying over **localhost:8172** with a self-hosted runner, no external ports need to be opened.  
- If you want remote deploys (from a hosted runner), open **TCP 8172** inbound and configure WMSvc for remote connections.  
- Ensure firewall rules allow the runner to reach `https://localhost:8172/msdeploy.axd`.

---

## 5. Health Check
- Your IIS app should expose a **URL endpoint** (e.g., `/` or `/health`) that returns **HTTP 200 OK**.  
- The workflow will fail if the health check does not succeed.

---

✅ Once these prerequisites are complete, you can run the GitHub Actions workflow to deploy your WebForms site with **no inline PowerShell**, using Marketplace actions for:
- Stopping/starting the App Pool
- Deploying files via Web Deploy
- Running the health check
