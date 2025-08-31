# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is an ASP.NET MVC 5 web application targeting .NET Framework 4.7.2. The project is designed for deployment to Azure VMs using Azure DevOps pipelines.

## Architecture

**Solution Structure:**
- `TestWeb.sln` - Main Visual Studio solution file
- `TestWeb/` - Main web application project containing:
  - `Controllers/` - MVC controllers (HomeController with Index, About, Contact actions)
  - `Views/` - Razor view templates using shared layout
  - `App_Start/` - Configuration classes (Bundle, Filter, Route configs)
  - `Content/` - CSS files including Bootstrap
  - `Scripts/` - JavaScript files including jQuery and Bootstrap

**Key Dependencies:**
- ASP.NET MVC 5.2.7
- Bootstrap (for UI styling)
- jQuery 3.4.1
- Newtonsoft.Json 12.0.2
- Web optimization framework for bundling/minification

## Development Commands

**Build the solution:**
```
msbuild TestWeb.sln /p:Configuration=Release /p:Platform="Any CPU"
```

**Build for local development:**
```
msbuild TestWeb.sln /p:Configuration=Debug /p:Platform="Any CPU"
```

**Package for deployment:**
```
msbuild TestWeb/TestWeb.csproj /p:WebPublishMethod=FileSystem /p:DeployOnBuild=true /p:PublishProfile=FolderProfile /p:PublishUrl=publish_output
```

**Run locally (requires Visual Studio or IIS Express):**
- The application is configured to run on `https://localhost:44300` in development
- Uses IIS Express with SSL enabled

## Deployment

The project includes Azure DevOps pipeline configuration in `Infra-azure-devops/`:

**Deployment Target:**
- Azure VM with IIS
- Application pool: "SimpleWebFormsTest" (.NET Framework 4.0)
- Website port: 8080
- Physical path: `C:\inetpub\wwwroot\SimpleWebFormsTest`

**Pipeline Trigger:**
- Manual trigger only (`trigger: none` in azure-pipelines.yml)
- Requires "Production" environment configured in Azure DevOps

## File Structure Notes

- `packages/` directory contains NuGet package dependencies
- `obj/` and `bin/` directories contain build outputs (ignored by git)
- `.vs/` directory contains Visual Studio settings (ignored by git)
- `Infra/` directory is reserved for infrastructure-related files