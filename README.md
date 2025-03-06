# Beauty Salon Management System

## Project Overview

This project consists of creating a management system for a beauty salon using a PostgreSQL database and a Bash script to interact with it. The goal is to allow customers to book appointments for various services offered by the salon, manage customer information, and maintain a record of scheduled appointments.

## General Description

The system consists of three main tables in the database:

- **Customers:** Stores customer information such as name and phone number.
- **Services:** Contains the services offered by the salon, such as haircuts, manicures, etc.
- **Appointments:** Records scheduled appointments, including the customer, requested service, and appointment time.

The Bash script (`salon.sh`) acts as the system's main interface, allowing users to interact with the database through a menu of options. The main functionalities include:

- **Display available services:** The script shows a numbered list of the services offered.
- **Book an appointment:** Users can select a service, provide their phone number, name (if not registered), and the desired appointment time.
- **Customer registration:** If the customer is not registered, the system requests their name and saves it in the database along with their phone number.
- **Appointment confirmation:** Once the appointment is successfully booked, the system displays a confirmation message with the appointment details.

## Project Structure

### Database

The database is structured into three main tables:

- **customers:** Stores customer information with columns such as `customer_id` (primary key), `name`, and `phone` (unique).
- **services:** Stores the salon services with columns such as `service_id` (primary key) and `name`.
- **appointments:** Records scheduled appointments with columns such as `appointment_id` (primary key), `customer_id` (foreign key referencing `customers`), `service_id` (foreign key referencing `services`), and `time`.

### Bash Script (salon.sh)

The Bash script is the core of the system, allowing users to interact with the database through a menu of options. The main functionalities implemented are:

- **Display available services:** The script shows a numbered list of the services offered, allowing the user to select one.
- **Book an appointment:** The script requests the user's phone number. If the customer is not registered, their name is requested and stored in the database. Then, the appointment time is requested and recorded in the `appointments` table.
- **Appointment confirmation:** Once the appointment is successfully booked, the system displays a confirmation message with details such as the service name, time, and customer name.

## Technologies Used

- **PostgreSQL:** For database management.
- **Bash:** For creating the script that interacts with the database.
- **Terminal:** For executing the script and interacting with the system.

## How to Run the Project

### Database Setup

1. Connect to PostgreSQL and create a database named `salon`.
2. Create the `customers`, `services`, and `appointments` tables with the necessary columns.
3. Insert some sample data into the `services` table to simulate the available services.

### Script Execution

1. Ensure the `salon.sh` file has execution permissions:
   ```bash
   chmod +x salon.sh
   ```
2. Run the script from the terminal:
   ```bash
   ./salon.sh
   ```
3. Follow the on-screen instructions to book an appointment.

## Learnings and Conclusions

This project allowed me to deepen my knowledge of relational database management with PostgreSQL, as well as creating Bash scripts to automate tasks and manage user interactions. Additionally, I reinforced concepts such as the use of primary and foreign keys, database normalization, and data manipulation through SQL queries.

This system is a basic but functional example of how a beauty salon can be managed, and it can be expanded with more features in the future, such as payment management, report generation, or integration with a graphical interface.

A project completed as part of the freeCodeCamp.org Relational Database Certification.


