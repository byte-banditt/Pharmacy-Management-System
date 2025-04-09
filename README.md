# Project for the course Database Systems

## ER Diagram for a pharmacy
![Alt text](/docs/ER%20Diagram.png)

## Setup Instructions
To set up the project locally with Oracle SQL*Plus:
1. **Clone the Repository**:
   ```bash
   git clone https://github.com/your-username/NovaPharmacyDB.git
   cd NovaPharmacyDB

2. **Install Oracle Database Locally**:

    Download and install [Oracle Database Express Edition](https://www.oracle.com/database/technologies/oracle21c-windows-downloads.html) on your machine.

    Follow the installation instructions for your OS (e.g., Windows installer or Linux RPM).

    Verify SQL*Plus installation:
    ```bash
    sqlplus -v
    
3. **Create New User**:

    ```bash
    sqlplus
    CREATE USER nova_user IDENTIFIED BY password DEFAULT TABLESPACE users QUOTA UNLIMITED ON users GRANT CONNECT, RESOURCE TO nova_user;

4. **Open Terminal in Cloned Repository**:

    Open sqlplus and connect to nova_user

    Execute the following instructions:
    ```bash
    @schema/tables.sql
    @schema/constraints.sql
    @schema/triggers.sql
    @data/initial_data.sql

 

    