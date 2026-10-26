**Before you start:** rename this file to `unit3e_Music_lastname.md`, using your own last name. Read `unit3e_Walkthrough.md` and `unit3e_Music_Client.md` first. Commit and push this file **and** your Excel file when you're done.

**Name:** Gavin

**Partner(s):** Logan

---

# Unit 3e — Design a Database for a Client: Music Streaming App

Both partners turn in the same design.

**Something we disagreed on, and how we settled it:** Nothing, my partner was at band.


**Our Excel file name (commit it to your repo next to this file, like `unit3e_Music_garcia.xlsx`):** unit3e_music_waibel


## 1. The client's spreadsheet

Look at the `Client_Export` tab.

**a.** Which column breaks 1NF? Which 1NF rule does it break?

**Answer:** on_playlist because they put multiple playlists in one box


**b.** Find Ariana Grande's album *Sweetener*. How many rows repeat its release date? If the date were wrong, what would you have to do? What is that problem called?

**Answer:** 13 repeats, one that is incorrect. I had to fix it. Data intergrity.


**c.** Can `song_name` be the primary key of a songs table? Give an example from the data that shows why not. What should the key be instead?

**Answer:** No because there are multiple songs with same name. That means they need a special ID.


## 2. First normal form

Look at the `1NF` tab. Each row is one song on one playlist.

**d.** What is the primary key of the 1NF table? Why does it take more than one column? 

**Answer:** The primary key is song id, and playlist id. This is a composite key.


## 3. Second normal form — the whole key

For each column, check what it depends on: the song, the playlist, or both. Use your 1NF key from **d**.

| Column | Depends on the song? | Depends on the playlist? | Needs the whole key? |
|---|:-:|:-:|:-:|
| `popularity` | Yes | No | No |
| `album_name` | Yes | No | No |
| `playlist_name` | No | Yes | No |
| `playlist_genre` | No | Yes | No |

**e.** What is it called when a column depends on only part of the key? Which tables did you move those columns into?

**Answer:** This is called a partial dependency


**f.** After you split out songs and playlists, what columns are left in PLAYLIST_SONGS? Why so few?

**Answer:** The only columns left in PLAYLIST_SONGS are playlist_id and track_id. This is a junction table to connect the two.


## 4. Third normal form — nothing but the key

**g.** `album_release_date` is in every song row, but it isn't really a fact about the song. What does it depend on? What is that problem called?

**Answer:** This depends on the album ID, and this is called transitive dependency


**h.** `artist_country` has the same problem. What does it depend on?

**Answer:** It depends on artist rather than song


## 5. The client's mistakes

When you used Remove duplicates, two tables had one row too many. Find both mistakes.

| Table | What was wrong | What we kept |
|---|---|---|
| | | |
| | | |

**i.** Why would these mistakes be impossible in your finished design?

**Answer:**


## 6. Our tables

For each table, list every column and mark keys as `(PK)`, `(FK)`, or `(PK, FK)`. Give the number of rows your table has in the Sheet.

| Table | Columns | Rows |
|---|---|:-:|
| ARTISTS | 3| 20 |
| ALBUMS |3 |114 |
| SONGS |8 |181 |
| PLAYLISTS |3 |9 |
| PLAYLIST_SONGS |2 |198 |

**j.** Fill in the relationships. **Choose from:** one-to-one · one-to-many · many-to-many

| Relationship | Type | Where is the foreign key? |
|---|---|---|
| ARTISTS → SONGS |One-Many |Artist_ID |
| ALBUMS → SONGS |One-Many |Album_ID |
| SONGS ↔ PLAYLISTS |Many-Many |playlist_ID |

**k.** Which table is the junction table? What is its primary key?

**Answer:playlist_songs, song_ID*


## 7. ER diagram (AI writes the code)

Give your tables to AI and have it write the Mermaid code. Proof it and test it on mermaid.live. Then paste it here.

```mermaid
erDiagram
    erDiagram
    ARTISTS ||--o{ ALBUMS : "releases"
    ALBUMS ||--o{ SONGS : "contains"
    SONGS ||--o{ PLAYLIST_SONGS : "included in"
    PLAYLISTS ||--o{ PLAYLIST_SONGS : "has"

    ARTISTS {
        int Artist_ID PK
        string Artist_Name
        string Home_Country
    }

    ALBUMS {
        string Album_ID PK
        string Album_Name
        date Release_Date
        int Artist_ID FK
    }

    SONGS {
        string track_id PK
        string song_name
        string artist
        string artist_country
        int popularity
        int duration_ms
        float danceability
        float energy
        string Album_ID FK
    }

    PLAYLISTS {
        string playlist_id PK
        string playlist_name
        string playlist_genre
    }

    PLAYLIST_SONGS {
        string song_ID PK_FK
        string playlist_id PK_FK
    }

```

**Paste the prompt you gave the AI:**

![alt text](image.png)
![alt text](image-1.png)
![alt text](image-2.png)
![alt text](image-3.png)
![alt text](image-4.png)
could you make a mermaid.live diagram combining all of these tables
```

**l.** What did you have to fix in the AI's diagram? If nothing, what did you check?

**Answer:I checked how they all connected and in what way they were connected**


## 8. Check your design

- [X] Every table has a primary key
- [V] Every many-to-many goes through a junction table
- [V] No cell holds a list
- [V] No fact is stored in two places
- [V] Every foreign key points at a primary key in another one of our tables

**Which normal form does your design reach, and how do you know?**

**Answer:3nf as there is no transitive dependancy or partial dependancy**


