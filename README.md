# Notes Management System

**GitHub Repository:** https://github.com/UMer438/Notes_Management-_System.git

```bash
git clone https://github.com/UMer438/Notes_Management-_System.git
cd Notes_Management-_System
```


A web-based notes management application built with Java Servlets, JSP, and MySQL.

## Features

- **User Management**
  - User registration and login
  - Secure authentication
  - Profile management

- **Notes Management**
  - Create, read, update, and delete notes
  - Search notes by title
  - Personal notes dashboard

- **Admin Panel**
  - Admin login
  - View all users and their notes
  - User management capabilities

## Technology Stack

- **Backend**: Java Servlets (Java 17)
- **Frontend**: HTML, CSS, JavaScript
- **Database**: MySQL 8.0
- **Build Tool**: Maven
- **Server**: Apache Tomcat 9
- **Containerization**: Docker & Docker Compose

## Prerequisites

Choose one of the following deployment methods:

### Option 1: Docker (Recommended - Easiest)
- Docker Desktop installed
- No other dependencies needed!

### Option 2: Local Development
- Java JDK 17 or higher
- Apache Maven 3.6+
- Apache Tomcat 9+
- MySQL 8.0+

## Quick Start with Docker (Recommended)

1. **Clone or navigate to the project directory**
   ```bash
   cd /Users/muhammadumeryasin/eclipse-workspace/NotesManagement
   ```

2. **Build the application**
   ```bash
   mvn clean package
   ```

3. **Start the application with Docker Compose**
   ```bash
   docker-compose up --build
   ```

4. **Access the application**
   - Open your browser and go to: http://localhost:8080
   - Default test user: `testuser` / `test123`
   - Default admin: `admin` / `admin123`

5. **Stop the application**
   ```bash
   docker-compose down
   ```

## Manual Deployment (Without Docker)

### Step 1: Set up MySQL Database

1. Install MySQL 8.0 and start the service

2. Create the database and tables:
   ```bash
   mysql -u root -p < database-setup.sql
   ```

### Step 2: Build the Application

```bash
mvn clean package
```

This will create `target/NotesManagement.war`

### Step 3: Deploy to Tomcat

1. Copy the WAR file to Tomcat's webapps directory:
   ```bash
   cp target/NotesManagement.war /path/to/tomcat/webapps/
   ```

2. Start Tomcat:
   ```bash
   /path/to/tomcat/bin/catalina.sh run
   ```

3. Access the application at: http://localhost:8080/NotesManagement

## Environment Variables

The application supports the following environment variables for database configuration:

- `DATABASE_URL`: JDBC connection string (default: `jdbc:mysql://localhost:3306/notesdb?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC`)
- `DB_USER`: Database username (default: `root`)
- `DB_PASSWORD`: Database password (default: `ROOTroot`)

## Project Structure

```
NotesManagement/
├── src/
│   └── main/
│       ├── java/
│       │   └── notes/
│       │       ├── servlets/          # Servlet controllers
│       │       ├── dao/               # Data access objects
│       │       ├── models/            # Entity classes
│       │       └── DatabaseConnection.java
│       └── webapp/
│           ├── WEB-INF/
│           │   └── web.xml           # Deployment descriptor
│           ├── *.html                # HTML pages
│           └── *.css                 # Stylesheets
├── pom.xml                           # Maven configuration
├── Dockerfile                        # Docker image configuration
├── docker-compose.yml                # Docker Compose configuration
└── database-setup.sql                # Database initialization script
```

## Available Pages

- `/` or `/Login.html` - User/Admin login page
- `/register.html` - User registration
- `/dashboard.html` - User dashboard (after login)
- `/notes.html` - Notes management
- `/AdminDashboard.html` - Admin dashboard

## Default Credentials

### Test User
- Username: `testuser`
- Password: `test123`

### Admin
- Username: `admin`
- Password: `admin123`

## Development

### Building the Project

```bash
mvn clean compile
```

### Running Tests

```bash
mvn test
```

### Creating WAR file

```bash
mvn clean package
```

The WAR file will be created at `target/NotesManagement.war`

## Troubleshooting

### Database Connection Issues

1. **Check MySQL is running**:
   ```bash
   # For Docker
   docker-compose ps
   
   # For local MySQL
   mysql -u root -p -e "status"
   ```

2. **Verify database exists**:
   ```bash
   mysql -u root -p -e "SHOW DATABASES LIKE 'notesdb';"
   ```

3. **Check connection string**: Ensure the DATABASE_URL environment variable is correct

### Application Not Starting

1. **Check Tomcat logs**:
   ```bash
   # For Docker
   docker-compose logs webapp
   
   # For local Tomcat
   tail -f /path/to/tomcat/logs/catalina.out
   ```

2. **Verify WAR file exists**:
   ```bash
   ls -lh target/NotesManagement.war
   ```

3. **Check port availability**:
   ```bash
   lsof -i :8080
   ```

### Build Errors

1. **Clean Maven cache**:
   ```bash
   mvn clean
   rm -rf ~/.m2/repository
   mvn package
   ```

2. **Verify Java version**:
   ```bash
   java -version  # Should be 17 or higher
   mvn -version   # Should show Java 17
   ```

## Docker Commands Reference

```bash
# Build and start services
docker-compose up --build

# Start services in background
docker-compose up -d

# Stop services
docker-compose down

# View logs
docker-compose logs -f

# Restart a specific service
docker-compose restart webapp

# Remove all containers and volumes
docker-compose down -v

# Access MySQL container
docker exec -it notesdb-mysql mysql -u root -pROOTroot notesdb
```

## Security Notes

⚠️ **Important**: This application is for educational/development purposes. For production use:

1. **Never hardcode passwords** - Use environment variables
2. **Hash passwords** - Implement bcrypt or similar
3. **Use HTTPS** - Enable SSL/TLS
4. **Sanitize inputs** - Prevent SQL injection
5. **Add CSRF protection** - Implement tokens
6. **Update dependencies** - Keep libraries current

## License

This project is for educational purposes.

## Support

For issues or questions, please check the troubleshooting section above or review the application logs.
