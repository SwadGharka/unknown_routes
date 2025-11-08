# Tour Package Showcase - Spring Boot

## What this project provides
- Simple Spring Boot backend exposing REST APIs to list & fetch tour packages.
- H2 in-memory database with sample data (src/main/resources/data.sql).
- Layered architecture: Controller -> Service -> Repository.
- Ready for future Payment Gateway or Booking integration.

## Run
1. Import as a Maven project in IntelliJ/Eclipse.
2. Run `TourAppApplication` (Java 17).
3. APIs:
   - GET `/api/packages` - list all packages
   - GET `/api/packages/{id}` - fetch package by id
4. H2 Console: `http://localhost:8080/h2-console` (JDBC URL: `jdbc:h2:mem:tourdb`, user `sa`).

## Notes
- Uses Lombok for getters/setters (`@Data`). Make sure Lombok plugin is enabled in your IDE.
