const express = require('express');
const cors = require('cors');
const path = require('path');
const { v4: uuidv4 } = require('uuid');
const db = require('./db');
require('dotenv').config();

const app = express();
const PORT = process.env.PORT || 3000;

app.use(cors());
app.use(express.json());
app.use(express.static(path.join(__dirname, '../frontend/public')));

// ─────────────────────────────────────────────
// ANNIVERSARY INFO
// ─────────────────────────────────────────────
app.get('/api/anniversary', (req, res) => {
  const start = new Date('2021-12-18');
  const now = new Date();
  const diffMs = now - start;
  const diffDays = Math.floor(diffMs / (1000 * 60 * 60 * 24));
  const years = Math.floor(diffDays / 365);
  const months = Math.floor((diffDays % 365) / 30);
  const days = diffDays % 30;
  res.json({ startDate: '2021-12-18', totalDays: diffDays, years, months, days });
});

// ─────────────────────────────────────────────
// MEMORIES CRUD
// ─────────────────────────────────────────────
app.get('/api/memories', async (req, res) => {
  try {
    const [rows] = await db.query('SELECT * FROM memories ORDER BY date DESC');
    res.json(rows);
  } catch (e) { res.status(500).json({ error: e.message }); }
});

app.get('/api/memories/:id', async (req, res) => {
  try {
    const [rows] = await db.query('SELECT * FROM memories WHERE id = ?', [req.params.id]);
    if (!rows.length) return res.status(404).json({ error: 'Not found' });
    res.json(rows[0]);
  } catch (e) { res.status(500).json({ error: e.message }); }
});

app.post('/api/memories', async (req, res) => {
  try {
    const { title, description, date, image_url, category, is_favorite } = req.body;
    if (!title || !date) return res.status(400).json({ error: 'title and date are required' });
    const id = uuidv4();
    await db.query(
      'INSERT INTO memories (id, title, description, date, image_url, category, is_favorite) VALUES (?,?,?,?,?,?,?)',
      [id, title, description || '', date, image_url || '', category || 'everyday', is_favorite || false]
    );
    const [rows] = await db.query('SELECT * FROM memories WHERE id = ?', [id]);
    res.status(201).json(rows[0]);
  } catch (e) { res.status(500).json({ error: e.message }); }
});

app.put('/api/memories/:id', async (req, res) => {
  try {
    const { title, description, date, image_url, category, is_favorite } = req.body;
    await db.query(
      'UPDATE memories SET title=?, description=?, date=?, image_url=?, category=?, is_favorite=? WHERE id=?',
      [title, description, date, image_url, category, is_favorite, req.params.id]
    );
    const [rows] = await db.query('SELECT * FROM memories WHERE id = ?', [req.params.id]);
    res.json(rows[0]);
  } catch (e) { res.status(500).json({ error: e.message }); }
});

app.delete('/api/memories/:id', async (req, res) => {
  try {
    await db.query('DELETE FROM memories WHERE id = ?', [req.params.id]);
    res.json({ success: true });
  } catch (e) { res.status(500).json({ error: e.message }); }
});

// ─────────────────────────────────────────────
// LOVE LETTERS CRUD
// ─────────────────────────────────────────────
app.get('/api/letters', async (req, res) => {
  try {
    const [rows] = await db.query('SELECT * FROM love_letters ORDER BY is_pinned DESC, created_at DESC');
    res.json(rows);
  } catch (e) { res.status(500).json({ error: e.message }); }
});

app.get('/api/letters/:id', async (req, res) => {
  try {
    const [rows] = await db.query('SELECT * FROM love_letters WHERE id = ?', [req.params.id]);
    if (!rows.length) return res.status(404).json({ error: 'Not found' });
    res.json(rows[0]);
  } catch (e) { res.status(500).json({ error: e.message }); }
});

app.post('/api/letters', async (req, res) => {
  try {
    const { title, content, mood, is_pinned } = req.body;
    if (!title || !content) return res.status(400).json({ error: 'title and content are required' });
    const id = uuidv4();
    await db.query(
      'INSERT INTO love_letters (id, title, content, mood, is_pinned) VALUES (?,?,?,?,?)',
      [id, title, content, mood || 'romantic', is_pinned || false]
    );
    const [rows] = await db.query('SELECT * FROM love_letters WHERE id = ?', [id]);
    res.status(201).json(rows[0]);
  } catch (e) { res.status(500).json({ error: e.message }); }
});

app.put('/api/letters/:id', async (req, res) => {
  try {
    const { title, content, mood, is_pinned } = req.body;
    await db.query(
      'UPDATE love_letters SET title=?, content=?, mood=?, is_pinned=? WHERE id=?',
      [title, content, mood, is_pinned, req.params.id]
    );
    const [rows] = await db.query('SELECT * FROM love_letters WHERE id = ?', [req.params.id]);
    res.json(rows[0]);
  } catch (e) { res.status(500).json({ error: e.message }); }
});

app.delete('/api/letters/:id', async (req, res) => {
  try {
    await db.query('DELETE FROM love_letters WHERE id = ?', [req.params.id]);
    res.json({ success: true });
  } catch (e) { res.status(500).json({ error: e.message }); }
});

// ─────────────────────────────────────────────
// MILESTONES CRUD
// ─────────────────────────────────────────────
app.get('/api/milestones', async (req, res) => {
  try {
    const [rows] = await db.query('SELECT * FROM milestones ORDER BY milestone_date ASC');
    res.json(rows);
  } catch (e) { res.status(500).json({ error: e.message }); }
});

app.post('/api/milestones', async (req, res) => {
  try {
    const { title, description, milestone_date, icon, color } = req.body;
    if (!title || !milestone_date) return res.status(400).json({ error: 'title and milestone_date are required' });
    const id = uuidv4();
    await db.query(
      'INSERT INTO milestones (id, title, description, milestone_date, icon, color) VALUES (?,?,?,?,?,?)',
      [id, title, description || '', milestone_date, icon || '💕', color || '#c9a96e']
    );
    const [rows] = await db.query('SELECT * FROM milestones WHERE id = ?', [id]);
    res.status(201).json(rows[0]);
  } catch (e) { res.status(500).json({ error: e.message }); }
});

app.put('/api/milestones/:id', async (req, res) => {
  try {
    const { title, description, milestone_date, icon, color } = req.body;
    await db.query(
      'UPDATE milestones SET title=?, description=?, milestone_date=?, icon=?, color=? WHERE id=?',
      [title, description, milestone_date, icon, color, req.params.id]
    );
    const [rows] = await db.query('SELECT * FROM milestones WHERE id = ?', [req.params.id]);
    res.json(rows[0]);
  } catch (e) { res.status(500).json({ error: e.message }); }
});

app.delete('/api/milestones/:id', async (req, res) => {
  try {
    await db.query('DELETE FROM milestones WHERE id = ?', [req.params.id]);
    res.json({ success: true });
  } catch (e) { res.status(500).json({ error: e.message }); }
});

// ─────────────────────────────────────────────
// BUCKET LIST CRUD
// ─────────────────────────────────────────────
app.get('/api/bucket', async (req, res) => {
  try {
    const [rows] = await db.query('SELECT * FROM bucket_list ORDER BY is_done ASC, priority DESC, created_at ASC');
    res.json(rows);
  } catch (e) { res.status(500).json({ error: e.message }); }
});

app.post('/api/bucket', async (req, res) => {
  try {
    const { dream, description, priority } = req.body;
    if (!dream) return res.status(400).json({ error: 'dream is required' });
    const id = uuidv4();
    await db.query(
      'INSERT INTO bucket_list (id, dream, description, priority) VALUES (?,?,?,?)',
      [id, dream, description || '', priority || 'someday']
    );
    const [rows] = await db.query('SELECT * FROM bucket_list WHERE id = ?', [id]);
    res.status(201).json(rows[0]);
  } catch (e) { res.status(500).json({ error: e.message }); }
});

app.put('/api/bucket/:id', async (req, res) => {
  try {
    const { dream, description, is_done, done_date, priority } = req.body;
    await db.query(
      'UPDATE bucket_list SET dream=?, description=?, is_done=?, done_date=?, priority=? WHERE id=?',
      [dream, description, is_done, done_date || null, priority, req.params.id]
    );
    const [rows] = await db.query('SELECT * FROM bucket_list WHERE id = ?', [req.params.id]);
    res.json(rows[0]);
  } catch (e) { res.status(500).json({ error: e.message }); }
});

app.delete('/api/bucket/:id', async (req, res) => {
  try {
    await db.query('DELETE FROM bucket_list WHERE id = ?', [req.params.id]);
    res.json({ success: true });
  } catch (e) { res.status(500).json({ error: e.message }); }
});

// SPA fallback
app.get('/{*path}', (req, res) => {
  res.sendFile(path.join(__dirname, '../frontend/public/index.html'));
});

app.listen(PORT, () => {
  console.log(`\n💕 Anniversary server running at http://localhost:${PORT}\n`);
});