# README
*   Created with Ruby v3.1.2 and Rails v7.0.4
*   SQLite database - v3.4.0
*   Developed on Windows 10

## How to Install
*   Install the correct versions of the above and ensure the variables are added to your path and you have access to SQLite3 through the command line in your project directory.
*   Download files/clone the repository to a folder
*   Enter the folder containing the project, and run the command ```bundle_install``` to install packages from the gemfile
*   Create a database - ```rake db:create```
*   Run migrations - ```rake db:migrate```
*   There is a rake task to intake CSV files. Run ```rake db:import:load_csv_data[model_name,filepath]```
    * model_name must be one of these: WorkOrder, Technician, or Location
    * filepath is the path to where the csv file is located.
*   Provided that everything is installed correctly, running the command ```ruby bin\rails\server``` should start the server.
*   You should be able to access the application through http://localhost:3000
