**Before you start:** rename this file to `unit3d_lastname.md`, using your own last name. Watch the video and read `unit3d_Walkthrough.md`. Commit and push when you're done.

**Name:** Gavin Waibel

---

# Unit 3d — Types of Databases

Answer every question. No SQL today.

---

## While you watch the video

**1.** Fill in the table while you watch [7 Database Paradigms – Fireship](https://www.youtube.com/watch?v=W2Z7fbCLSTw).

| Type | One product he names | Good for |
|---|---|---|
| Key-value | github | Caching, Pub / Sub, Leaderboards |
| Wide-column | Netflix | Time Series, Historical Records, High-write/low-read |
| Document | Game Data | Some apps, games, content management, IOT |
| Relational | Most Apps | Unstructured Data |
| Graph | Air Bnb recommendation | Graphs, recommendation engines |
| Full-text search | Solr | Search engines, typeahead |
| Multi-model | Fauna | EVERYTHING |

---

## After the video

**2.** Key-value databases keep their data in memory. What does that make them good at? What can't you do with them?

**Answer:** This makes key value databases super fast, because everything is on the system memory. This then means there a data limit because your system memory doesnt have much space.


**3.** What is the downside of a document database, according to the video?

**Answer:** Document databases dont have joins so writing and documenting data tends to be more complex.


**4.** A relational database needs a join table to connect many things to many things. In a graph database, what does that job instead?

**Answer:** Nodes are the data, and the connections are the edges.


**5.** Name one relational database product from the video.

**Answer:** Banks and financial institutions


---

## Pick the database

**6.** For each client, pick the best type of database and give one reason. Use the "How to pick one" table in the walkthrough.

**Choose from:** Relational · Document · Graph · Key-value · Full-text search · Wide-column

| # | Client says… | Type | One reason |
|:-:|---|---|---|
| a | "We run a pharmacy. Every prescription must link to one patient and one doctor, and nothing can ever be out of sync." | Relational | This way data always matches up |
| b | "Our store sells 40,000 products. Shoes have sizes, laptops have RAM. Every category has different information." | Document | The records for each thing dont look the same so they get categorized |
| c | "We want to suggest new friends: people who are friends with your friends." | Graph | This way we can use the connections between people as data as well. |
| d | "Our game needs a leaderboard. Scores change thousands of times a second." | Key Value | Just one key to one value and its quick |
| e | "Our website has 50,000 recipes, and people need to search them by any word." | Full-text search | This allows you to find any book even with typos |
| f | "We have 10,000 weather sensors sending a reading every second." | Wide-column | Lots of data comes in quickly from the sensors |

**7.** In 3a, the `teams` + `games` tables stored each team once and linked games to teams with `team_id`. Why is a relational database a good fit for NBA data?

**Answer:** This removes data redundancy from the flat file and connects players with their teams. it always keeps them matched up.


**8.** You're building an app for our school that keeps track of students, classes, and grades. Which type of database would you pick, and why?

**Answer:** Relational database because then the students, their classes, and their grades can all be linked with keys.
