<div align="center">
  <h1>Vaccine Management System</h1>
  
  <p>
    <strong>Enterprise-grade vaccine record management solution built with Spring Boot</strong>
  </p>
  
  <p>
    <a href="#key-features">Key Features</a> •
    <a href="#technology-stack">Technology Stack</a> •
    <a href="#architecture">Architecture</a> •
    <a href="#getting-started">Getting Started</a> •
    <a href="#api-documentation">API Documentation</a> •
    <a href="#development">Development</a> •
    <a href="#testing">Testing</a> •
    <a href="#deployment">Deployment</a> •
    <a href="#license">License</a>
  </p>
  
  <img src="https://img.shields.io/badge/Java-21-orange" alt="Java 21" />
  <img src="https://img.shields.io/badge/Spring%20Boot-3.1.0-brightgreen" alt="Spring Boot 3.1.0" />
  <img src="https://img.shields.io/badge/MySQL-8.0-blue" alt="MySQL 8.0" />
  <img src="https://img.shields.io/badge/JUnit5-5.9.2-red" alt="JUnit 5.9.2" />
  <img src="https://img.shields.io/badge/License-MIT-yellow" alt="License MIT" />
</div>

## About

Vaccine Management System is a robust, enterprise-ready web application designed to streamline the management of vaccine information in healthcare facilities. The system provides a comprehensive set of tools for recording, tracking, and managing vaccine data with a responsive, user-friendly interface.

## Key Features

- **Comprehensive Vaccine Management**
  - Create, retrieve, update, and delete vaccine records
  - Track detailed vaccine information including name, description, type, and manufacturer
  - Filter vaccines by company name for specific data insights
  
- **Intuitive User Interface**
  - Clean, professional design with modern UI components
  - Fully responsive layout optimized for desktop and mobile devices
  - Accessible design following WCAG guidelines
  
- **Enterprise-Grade Architecture**
  - Multi-layered architecture with separation of concerns
  - Interface-driven service design for scalability and maintainability
  - Transactional data integrity with database-level consistency

- **Performance Optimized**
  - Efficient data fetching with optimized database queries
  - Stream-based filtering for improved memory performance
  - Minimal resource footprint

## Technology Stack

### Backend
- **Java 21**: Latest LTS version with enhanced performance
- **Spring Boot**: Application framework with auto-configuration
- **Spring MVC**: Web layer with RESTful endpoint support
- **Spring Data JPA**: Data access layer with repository abstraction
- **Jakarta EE**: Enterprise Java specifications
- **Maven**: Dependency management and build automation

### Frontend
- **JSP/JSTL**: Server-side rendering with tag libraries
- **HTML5/CSS3**: Modern markup and styling
- **CSS Custom Properties**: Dynamic theming with variables
- **Media Queries**: Responsive design support

### Database
- **MySQL 8.0**: Transactional data storage
- **Hibernate ORM**: Object-relational mapping
- **Connection Pooling**: HikariCP for efficient connections

### Testing & Quality Assurance
- **JUnit 5**: 
  - Comprehensive testing framework for unit and integration tests
  - Jupiter API for modern test authoring
  - Parameterized tests for data-driven testing
  - Assertions for thorough verification
  - Lifecycle management with @BeforeEach, @AfterEach annotations

- **Spring Boot Test**: 
  - Integration testing with application context
  - MockMVC for controller testing
  - TestRestTemplate for API testing

- **SLF4J/Logback**: 
  - Comprehensive application logging
  - Configurable log levels and formats
  - Rolling file appenders for log management

## Architecture

The application follows a layered architecture pattern with clear separation of concerns:
