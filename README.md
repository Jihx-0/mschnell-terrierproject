# 🛠️ Technician Scheduling App

## 📋 Overview

This is a Ruby on Rails application designed to manage and visualize technician work orders throughout a typical workday.

- The app manages **Technicians**, **Locations**, and **Work Orders**.  
- Each work order is assigned to a technician and linked to a location.  
- A dynamic daily schedule view displays technicians as columns and hourly time slots as rows, showing blocks representing assigned work orders and available free time between jobs.  
- This visualization helps businesses efficiently coordinate technician assignments and track workload distribution by location and time.

### ✨ Key Features

- 📅 Visual schedule with work order blocks sized and positioned by start time and duration  
- ⏳ Calculation and display of gaps between work orders for each technician  
- 🖱️ Simple interaction: clicking on free time blocks displays available minutes  
- ⚙️ Backend powered by Ruby on Rails with SQLite database  
- 📂 CSV import rake tasks for bulk loading of technicians, locations, and work orders  

> **⚠️ Note:** This project represents an early, functional implementation focused on core scheduling capabilities.

---

## 🧰 Technology Stack

- 💎 Ruby v3.1.2  
- 🚂 Rails v7.0.4  
- 🗄️ SQLite v3.4.0  
- 🖥️ Developed on Windows 10

---

## 🚀 Installation and Setup

1. ✅ Ensure Ruby, Rails, and SQLite3 are installed and accessible from your command line.  
2. 📥 Clone or download the repository to your local machine.  
3. 📂 Navigate to the project folder in your terminal or command prompt.  
4. 📦 Run `bundle install` to install gem dependencies.  
5. 🛠️ Create the database with:  
   ```bash
   rake db:create
6. 🗃️ Run database migrations:
   ```bash
   rake db:migrate
   ```
7. 📊 (Optional) Import CSV data into models using the provided rake task:
   ```bash
   rake db:import:load_csv_data[ModelName,filepath]
   ```
   - Replace ModelName with one of: WorkOrder, Technician, or Location
   - Replace filepath with the path to your CSV file
8. ▶️ Start the Rails server:
   ```bash
   ruby bin\rails server
   ```
9. 🌐 Open your browser and go to http://localhost:3000 to access the app.
