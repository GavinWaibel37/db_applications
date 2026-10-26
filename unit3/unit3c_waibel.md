**Before you start:** rename this file to `unit3c_lastname.md`, using your own last name. Read `unit3c_Walkthrough.md` first. Commit and push when you're done.

**Name:**

---

# Unit 3c — Normalization

Open **`unit3_Normalization.xlsx`** in Google Sheets. Work through the four sheets in order: **Flat_Table → 1NF → 2NF → 3NF**. The first character (Arnold) is filled in on each sheet so you can see the shape. Do the rest.

When you're done, paste your **final 3NF tables** here as markdown tables, and answer the questions.

**Link to my spreadsheet (or file name if you committed it):** Gavin Waibel - unit3_Normalization


## 1. First normal form — one value per cell

**a.** What was wrong with the `Special_Abilities` column in the flat table? Which 1NF rule does it break?

**Answer:** It had multiple values in one cell


**b.** After fixing it, one character = many rows. What is the primary key of the 1NF table? Why does it take two columns?

**Answer:** Its a composite key thats made by combining the character and the ability together. This makes a unique value.


## 2. Second normal form — the whole key

**c.** `Experience_Level` depends on only *part* of the composite key. Which part? What is that problem called?

**Answer:** Experience level only depends on the ability section of the table. This is partial dependancy. 


**d.** You split the 1NF table into two. Name them and give each one's primary key.

**Answer:** Characters, and Character abilities. The primary key is character.


## 3. Third normal form — nothing but the key

**e.** `Character_Rating` (Newcomer / Rising Star / Blockbuster) depends on `Experience_Level`, not directly on the character. What is that problem called? What happens if a character's experience goes from 3 to 4 and only one of the two columns gets updated?

**Answer:** There could be conflicts in data when changing it. This is transitive dependancy.


**f.** What table did you add to fix it?

**Answer:** The Ratings table. Its a dictionary of rating numbers.


## 4. Your final 3NF tables

Paste them here. Mark the PK and FK columns in the header, like `character_id (PK)`.

### Table A — CHARACTERS (rating column removed)

| Character (PK) | Experience_Level (FK → RATINGS) |
| :--- | :--- |
| Arnold | 9 |
| Agent 86 | 5 |
| Mr. Secretary | 7 |
| Bad Cop | 3 |

---

### Table C — RATINGS (lookup: one row per experience level)

| Experience_Level (PK) | Character_Rating |
| :--- | :--- |
| 1 | Newcomer |
| 2 | Newcomer |
| 3 | Newcomer |
| 4 | Rising Star |
| 5 | Rising Star |
| 6 | Rising Star |
| 7 | Blockbuster |
| 8 | Blockbuster |
| 9 | Blockbuster |

---

### Table B — CHARACTER_ABILITIES (unchanged from 2NF)

| Character (PK, FK → CHARACTERS) | Ability (PK) | Power |
| :--- | :--- | :--- |
| Arnold | one-liners | 8 |
| Arnold | explosions | 10 |
| Arnold | car chases | 7 |
| Arnold | hand-to-hand | 9 |
| Agent 86 | gadgets | 6 |
| Agent 86 | disguises | 4 |
| Mr. Secretary | negotiations | 8 |
| Mr. Secretary | hand-to-hand | 7 |
| Mr. Secretary | explosions | 5 |
| Bad Cop | interrogations | 4 |
| Bad Cop | car chases | 6 |
| Bad Cop | gadgets | 3 |
| Bad Cop | one-liners | 2 |

## 5. When to break the rules

Your 3NF design needs a join every time someone wants to see a character's rating. A game studio might decide to put `Character_Rating` back into the character table on purpose.

**g.** What is that called, and give one reason they would do it.

**Answer:** Denormalization, because joining a lot could slow down the database


## Closing 3c — Vocabulary

| Term | Your definition |
|---|---|
| 1NF | Removing multiple items in a cell |
| 2NF | Removing redundancy |
| 3NF | Making everything rely on the primary key |
| Partial dependency | Depending only on part of a primary key |
| Transitive dependency | Things that are in multiple spots that cant be changed without work |
| Denormalization | Purposefully adding redundancy to make the database faster |

**Partner check:** trade files. Say the golden rule ("the key, the whole key, and nothing but the key") and point at which of your partner's three tables proves each part.
