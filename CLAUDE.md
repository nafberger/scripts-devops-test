# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a legacy ASP.NET Web Forms test application built with .NET Framework 4.7.2, designed to mirror the technology stack of the main Integra Scripts healthcare system for DevOps pipeline practice.

## Architecture

**Technology Stack:**
- ASP.NET Web Forms with .NET Framework 4.7.2
- XHTML 1.0 Transitional markup
- Classic server controls with ViewState
- Code-behind pattern (aspx + aspx.cs files)
- Traditional Web.config configuration

**Project Structure:**
- `SimpleWebFormsTest.sln` - Visual Studio solution file
- `Web/` - Main web application directory
  - `Default.aspx` - Main page with XHTML markup and server controls
  - `Default.aspx.cs` - Code-behind with system info display and postback handling
  - `Web.config` - Application configuration with .NET Framework 4.7.2 settings
  - `css/site.css` - Basic styling

## Development Commands

**Building:**
- Use Visual Studio: Build → Build Solution (Ctrl+Shift+B)
- Command line: `msbuild SimpleWebFormsTest.sln`

**Running:**
- Visual Studio: F5 or Ctrl+F5 (uses IIS Express)
- Manual deployment: Copy `Web/` contents to IIS directory

**Configuration:**
- Application runs on port 12346 (configured in .sln file)
- Uses Forms authentication with 30-minute timeout
- Debug mode enabled in development (Web.config compilation debug="true")

## Key Components

**Default.aspx Page:**
- Displays system information (server name, .NET version, current time)
- Demonstrates ViewState with click counter
- Uses classic postback model with server controls
- Configuration values loaded from Web.config appSettings

**Web.config Settings:**
- `CompanyName` and `Environment` in appSettings
- Connection string example for SQL Server
- Session state configured as InProc
- Custom errors set to Off for development
- Control rendering compatibility set to 4.0

## DevOps Notes

This application is specifically designed for practicing CI/CD pipelines with legacy .NET Framework applications. The deployment model is file-based copying to IIS servers, matching typical healthcare system deployment patterns.

Build process uses standard MSBuild compilation. No modern package managers or build tools are used, keeping the technology stack authentically legacy.