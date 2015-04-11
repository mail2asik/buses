<h2>Installation Steps</h2>

- Download this source and extract into http server

- Download the dependencies using the following composer command
  ```
  composer install (go to this path : buses\services\local & run the command)
  ```
- Create DB and add that DB details in the following page
  ```
  /buses/services/local/app/config/database.php
  ```

- Import SQL (Schema with sample data) from the following location
  ```
  /buses/install/DB-Structure-With-Data.sql
  ```

- Run it! 
  ```
  URL: http://localhost/buses/
  ```
