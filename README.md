# Simple Web Forms Test Application

A test application built with the exact same technology stack as the main Integra Scripts healthcare system, designed for practicing DevOps deployment pipelines.

## Technology Stack

This application matches the legacy technology used in the main healthcare system:

- **ASP.NET Web Forms** (.NET Framework 4.7.2)
- **XHTML 1.0 Transitional** markup
- **Classic Server Controls** with ViewState
- **Code-behind Pattern** (aspx + aspx.cs files)
- **Legacy Visual Studio Project Format**
- **Traditional Web.config** configuration
- **Classic CSS** styling (no modern frameworks)

## Project Structure

```
SimpleWebFormsTest/
├── SimpleWebFormsTest.sln      # Visual Studio solution file
├── Web/                        # Web application
│   ├── Default.aspx           # Welcome page (ASPX markup)
│   ├── Default.aspx.cs        # Code-behind file
│   ├── Web.config             # Application configuration
│   └── css/
│       └── site.css           # Basic styling
└── README.md                  # This file
```

## Features

### Welcome Page (Default.aspx)
- Displays system information (server name, .NET version, current time)
- Demonstrates classic Web Forms postback model
- Shows ViewState functionality with click counter
- Uses server controls (`<asp:Label>`, `<asp:Button>`, `<asp:Panel>`)
- Classic XHTML markup structure

### Configuration
- **Web.config**: Standard .NET Framework configuration
- **App Settings**: Company name and environment settings
- **Connection Strings**: Example database connection setup
- **Authentication**: Forms authentication configured
- **Compilation**: Debug mode enabled for development

## Running the Application

### Prerequisites
- **Visual Studio** 2019 or later
- **.NET Framework 4.7.2** or higher
- **IIS Express** (included with Visual Studio)

### Development Setup
1. Open `SimpleWebFormsTest.sln` in Visual Studio
2. Build the solution (Ctrl+Shift+B)
3. Set Web project as startup project
4. Run with F5 or Ctrl+F5

### Manual Deployment to IIS
1. Build the solution in Release mode
2. Copy the entire `Web/` folder contents to IIS directory:
   ```
   C:\inetpub\wwwroot\SimpleWebFormsTest\
   ```
3. Configure IIS application pool for .NET Framework 4.7.2
4. Browse to the application

## DevOps Practice

This application is perfect for practicing:

### CI/CD Pipeline Setup
- **Source Control**: Git repository ready
- **Build Process**: Standard MSBuild compilation
- **Deployment**: File-based deployment to IIS
- **Testing**: Basic smoke tests possible

### Suggested Pipeline Steps
1. **Build**: `msbuild SimpleWebFormsTest.sln`
2. **Test**: Run any unit tests
3. **Package**: Create deployment package
4. **Deploy**: Copy files to IIS server
5. **Verify**: Test application health

### Environment Configuration
- **Development**: Use local IIS Express
- **Staging**: Deploy to test server
- **Production**: Deploy to production IIS server

## Comparison to Main System

This test app mirrors the main Integra Scripts system:

| Feature | Main System | Test App |
|---------|-------------|----------|
| Technology | ASP.NET Web Forms | ✅ Same |
| .NET Version | Framework 4.x | ✅ Framework 4.7.2 |
| Markup | XHTML 1.0 | ✅ Same |
| Architecture | Code-behind | ✅ Same |
| Deployment | File copy to IIS | ✅ Same |
| Config | Web.config | ✅ Same |

## Next Steps for DevOps

1. **Set up Git repository**
2. **Create build pipeline** (Azure DevOps, GitHub Actions, or Jenkins)
3. **Configure automated deployment**
4. **Add health checks and monitoring**
5. **Practice with multiple environments**

## Notes

- This is **legacy technology** (20+ years old) but still widely used in healthcare
- The code-behind pattern and ViewState are intentionally old-fashioned
- XHTML markup matches the style used in the main system
- Perfect for learning DevOps with legacy .NET Framework applications

## Support

This is a learning/testing application. For questions about the main Integra Scripts system, contact the development team.