# B5-Assignment-2

## 1. What is PostgreSQL?
PostgreSQL হলো একটি ওপেন-সোর্স রিলেশনাল ডাটাবেস ম্যানেজমেন্ট সিস্টেম, সংক্ষেপে RDBMS। এটি SQL ব্যবহার করে খুব সহজেই ডাটা সংরক্ষন, পরিবর্তন, ডিলিট বা প্রয়োজন মতো ডাটা খুজে বের করা যায়। PostgreSQL এ ফুল-টেক্সট সার্চ, কাস্টম ডাটা টাইপ তৈরি, একই সময়ে একাধিক ব্যবহারকারী বিনা বাধায় এর ডাটা নিয়ে কাজ করতে পারে এবং JSON, XML ফরম্যাট ডাটা সাপোর্ট করে। PostgreSQL এর মাধ্যমে ছোট থেকে বড় এবং জটিল সব ধরনের প্রজেক্টে নিজস্ব প্রয়োজন মতো কাস্টোমাইজ করার সুবিধা দেয় যার ফলে অনেক স্কেলেবেল ও পারফর্মান্স অপ্টিমাইজড হয়।

## 2. What is the purpose of a database schema in PostgreSQL?
PostgreSQL -এ Schema হলো একটি লজিক্যাল কন্টেইনার বা নেমস্পেস যা ডাটাবেসের কাঠামোকে সুসংগঠিত ভাবে সজ্ঞায়িত করে। সহজভাবে বলতে গেলে, Schema হলো একটি ফোল্ডারের মতো, যেখানে ডাটাবেসের বিভিন্ন উপাদান যেমন টেবিল, ভিউ, ফাংশন ইত্যাদি থাকে। একটি ডাটাবেসে একাধিক Schema যুক্ত করা যায়, ফলে প্রয়োজন অনুসারে একাধিক schema -তে ডাটা সংরক্ষন করলে এটি ম্যানেজ করতে সুবিধা হয়। আবার একই নামে একাধিক টেবিল প্রয়োজন হলে খুব সহজেই আলাদা আলাদা schema তে একই নামে তৈরি করা যায়। বড় প্রজেক্টের ক্ষেত্রে ডাটার প্রয়োজন অনুসারে ভিন্ন ভিন্ন schema-র ব্যবহার ডাটাবেস ম্যানেজ-কে অনেক সহজ করে ফেলে। schema-তে ইউজার অনুসারে ডাটাবেস এক্সেস নির্ধারনের মাধ্যমে ডাটাবেসের নিরাপত্তা বাড়িয়ে দেয়।

Schema তৈরি করার জন্য কমান্ডঃ
```
CREATE SCHEMA schema_name;
```
Schema-তে টেবিল তৈরি করার জন্য কমান্ডঃ
```
CREATE TABLE schema_name.table_name (
    ranger_id SERIAL PRIMARY KEY
);
```
Schema ডিলিট করার জন্য কমান্ডঃ
```
DROP SCHEMA schema_name CASCADE;
```

Schema পরিবর্তন বা সিলেক্ট করা ঃ
```
SET search_path TO schema_name;
```

## 3. Explain the Primary Key and Foreign Key concepts in PostgreSQL.
### প্রাইমারি কী (Primary Key) কী?
প্রাইমারি কি হলো কোনো ডাটাবেসের একটি টেবিলের এমন একটি কলাম বা কলামের সমষ্টি যা ঐ টেবিলের প্রতিটি রো-কে আলাদা ভাবে চিহ্নিত করতে সক্ষম। অর্থাৎ যে এক বা একাধিক কলামের সাহায্যে একটি টেবিলের প্রত্যেকটি রো-কে নির্দিষ্ট ভাবে শনাক্ত করা যায় তাকে প্রাইমারি কি বলে। প্রাইমারি কি ইউনিক হতে হয় অর্থাৎ একাধিক রো-তে একই কি থাকতে পারে না আবার এটা NULL হইতে পারে না অর্থাৎ প্রতিটি রো-তে অবশ্যই এর মান থাকতে হবে। একটি টেবিলে কেবল একটি অথবা একাধিক প্রাইমারি কি থাকতে পারে। প্রাইমারি কি এর মাধ্যমে টেবিলের প্রতিটি রো-কে নির্দিষ্ট ভাবে শনাক্ত করা যায় ফলে নির্দিষ্ট রো খুজে বের করা বা ম্যানেজ করা যায়।


প্রাইমারি কি এর সাহায্যে টেবিল তৈরির কমান্ডঃ
```
CREATE TABLE rangers (
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    region VARCHAR(50) NOT NULL
);
```

টেবিলে প্রাইমারি কি-এর উদাহারণঃ
```
| ranger_id | name             | region         |
|-----------|------------------|--------------- |
| 1         | Alice Green      | Northern Hills |
| 2         | Bob White        | River Delta    |
| 3         | Carol King       | Mountain Range |
```
এখানে ranger_id হলো প্রাইমারি কি, যা প্রতিটি রো-কে নির্দিষ্ট ভাবে চিহ্নিত করতে সক্ষম।

### ফরেন কী (Foreign Key) কী?
ফরেন কি হলো এমন একটি কলাম বা কলামের সমষ্টি যা অন্য একটি টেবিলের প্রাইমারি কি-কে রেফার করে। অর্থাৎ ফরেন কি একটি টেবিলকে অন্য একটি টেবিলের সাথে যুক্ত করে। ফরেন কি মূলত দুইটি টেবিলের মধ্যে সম্পর্ক তৈরি করে। এটি একটি টেবিলের প্রাইমারি কি-কে Reference করে এবং অন্য এক্টি টেবিলে সংরক্ষিত থাকে। ফরেন কি ব্যবহার করে দুটি টেবিলের মধ্যে ডেটার সামঞ্জস্য এবং নির্ভুলতা বজায় রাখা যায়।

ফরেন কি এর সাহায্যে টেবিল তৈরির কমান্ডঃ
```
CREATE TABLE sightings (
    sighting_id SERIAL PRIMARY KEY,
    ranger_id INTEGER NOT NULL REFERENCES rangers (ranger_id),
    location VARCHAR(100) NOT NULL
);
```
টেবিলে ফরেন কি-এর উদাহারণঃ
```
| sighting_id | ranger_id | location          |
|-------------|-----------|-------------------|
| 1           | 1         | Peak Ridge        |
| 2           | 2         | Bankwood Area     |
| 3           | 3         | Bamboo Grove East |
| 4           | 2         | Snowfall Pass     |
```
এখানে ranger_id হলো ফরেন কী, যা rangers টেবিলের ranger_id প্রাইমারি কি-কে রেফার করে। যা sightings টেবিলের সাথে rangers টেবিলের মধ্যে সম্পর্ক স্থাপন করে।


## 4. What is the difference between the VARCHAR and CHAR data types?
## 5. Explain the purpose of the WHERE clause in a SELECT statement.
## 6. What are the LIMIT and OFFSET clauses used for?
## 7. How can you modify data using UPDATE statements?
## 8. What is the significance of the JOIN operation, and how does it work in PostgreSQL?
## 9. Explain the GROUP BY clause and its role in aggregation operations.
## 10. How can you calculate aggregate functions like COUNT(), SUM(), and AVG() in PostgreSQL?
