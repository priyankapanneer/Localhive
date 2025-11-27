# LocalHive – Service Booking Platform

## Overview
**LocalHive** is a **web-based platform** that connects customers with nearby service providers for both **normal and emergency services**. Customers can book services, choose preferred times, and report late arrivals, while providers and admins can manage bookings, view analytics, and download reports. The system is built with **PHP, MySQL (XAMPP), HTML, CSS, and Bootstrap 5**, with a strong focus on **UI/UX**.

---

## Features

### **Customer Features**
- Register & Login with role-based access.
- Browse nearby service providers.
- Book services as **normal** or **emergency**.
- Choose preferred date and time.
- Report late arrival of providers.
- View booking history and status.

### **Service Provider Features**
- Login to view assigned bookings.
- Mark bookings as **completed**, **pending**, or **cancelled**.
- Download reports of completed services.
- Receive notifications for new bookings.

### **Admin Features**
- Manage users, service providers, and services.
- Approve or reject bookings if needed.
- View dashboard analytics: total bookings, pending requests, completed services, emergency requests.
- Export reports in CSV format for monitoring and record-keeping.

---

## UI/UX Highlights
- Clean, modern, and responsive dashboard.
- Color-coded badges for booking status.
- Separate tabs for **normal** and **emergency** bookings.
- Interactive tables with pagination and filtering.
- Polished typography and design using Bootstrap 5.

---

## Tech Stack
- **Frontend:** HTML, CSS, Bootstrap 5, JavaScript
- **Backend:** PHP
- **Database:** MySQL (XAMPP)
- **Tools:** XAMPP, Visual Studio Code

---

## Database Structure
The system uses main tables such as:
- **users** – Customer and admin accounts.
- **providers** – Service provider details.
- **services** – Services offered by providers.
- **bookings** – Tracks customer bookings with type (normal/emergency), status, and timestamps.

---

## Installation / Setup

1. **Clone the repository:**
   ```bash
   git clone https://github.com/username/localhive.git
