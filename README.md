# Project for the course Database Systems

## ER Diagram for a pharmacy
![Alt text](/docs/ER%20Diagram.png)

## Setup Instructions
To set up the project locally with Oracle SQL*Plus:
1. **Clone the Repository**:
   ```bash
   git clone https://github.com/byte-banditt/DBS-Project.git
   cd DBS-Project

2. **Install Oracle Database Locally**:

    Download and install [Oracle Database Express Edition](https://www.oracle.com/in/database/technologies/xe-downloads.html) on your machine.

    Follow the installation instructions for your OS (e.g., Windows installer or Linux RPM).

    Verify SQL*Plus installation:
    ```bash
    sqlplus -v
    
3. **Create New User**:

    ```bash
    sqlplus
    CREATE USER nova IDENTIFIED BY password; 
    GRANT CONNECT, RESOURCE TO nova;
    ALTER USER nova QUOTA UNLIMITED ON USERS;

4. **Open Terminal in Cloned Repository**:

    Open sqlplus and connect to nova_user

    Execute the following instructions:
    ```bash
    @schema/tables.sql
    @schema/constraints.sql
    @schema/triggers.sql
    @procedures/createProcedures.sql
    