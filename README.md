# 💕 Anniversary Website — Setup Guide

## Project Structure
```
anniversary/
├── backend/
│   ├── server.js       ← Express API server
│   ├── db.js           ← MySQL connection
│   ├── schema.sql      ← Database schema + seed data
│   ├── .env.example    ← Environment config template
│   └── package.json
└── frontend/
    └── public/
        └── index.html  ← Full SPA frontend
```

---

## Prerequisites
- Node.js v16+
- MySQL 5.7+ or MariaDB 10+

---

## Step 1 — Set Up MySQL Database

Open MySQL and run:
```sql
SOURCE /path/to/anniversary/backend/schema.sql;
```
Or paste the contents of `schema.sql` into your MySQL client (phpMyAdmin, MySQL Workbench, etc.).

This creates the `anniversary_db` database with all tables and sample data.

---

## Step 2 — Configure Environment

```bash
cd backend
cp .env.example .env
```

Edit `.env` with your MySQL credentials:
```
DB_HOST=localhost
DB_PORT=3306
DB_USER=root
DB_PASSWORD=your_password_here
DB_NAME=anniversary_db
PORT=3000
```

---

## Step 3 — Install Dependencies

```bash
cd backend
npm install
```

---

## Step 4 — Run the Server

```bash
npm start
```

The server will start at: **http://localhost:3000**

Open your browser and go to `http://localhost:3000` 🎉

---

## Features

| Feature | Description |
|---|---|
| 💕 **Anniversary Counter** | Live countdown of years, months, days since Dec 18, 2021 |
| 📸 **Memories** | Add, edit, delete photo memories with categories |
| 📅 **Milestones Timeline** | Beautiful vertical timeline of your journey |
| 💌 **Love Letters** | Write, pin, and read love letters |
| ✨ **Bucket List** | Dream together — check things off as you do them |

## API Endpoints

### Memories
- `GET    /api/memories`
- `GET    /api/memories/:id`
- `POST   /api/memories`
- `PUT    /api/memories/:id`
- `DELETE /api/memories/:id`

### Love Letters
- `GET    /api/letters`
- `GET    /api/letters/:id`
- `POST   /api/letters`
- `PUT    /api/letters/:id`
- `DELETE /api/letters/:id`

### Milestones
- `GET    /api/milestones`
- `POST   /api/milestones`
- `PUT    /api/milestones/:id`
- `DELETE /api/milestones/:id`

### Bucket List
- `GET    /api/bucket`
- `POST   /api/bucket`
- `PUT    /api/bucket/:id`
- `DELETE /api/bucket/:id`

### Anniversary Info
- `GET    /api/anniversary` → returns years, months, days, totalDays since Dec 18, 2021
