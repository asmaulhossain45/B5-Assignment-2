# B5-Assignment-2

## 1. What is PostgreSQL?
PostgreSQL হলো একটি ওপেন-সোর্স রিলেশনাল ডাটাবেস ম্যানেজমেন্ট সিস্টেম, সংক্ষেপে RDBMS। এটি SQL ব্যবহার করে খুব সহজেই ডাটা সংরক্ষন, পরিবর্তন, ডিলিট বা প্রয়োজন মতো ডাটা খুজে বের করা যায়। PostgreSQL এ ফুল-টেক্সট সার্চ, কাস্টম ডাটা টাইপ তৈরি, একই সময়ে একাধিক ব্যবহারকারী বিনা বাধায় এর ডাটা নিয়ে কাজ করতে পারে এবং JSON, XML ফরম্যাট ডাটা সাপোর্ট করে। PostgreSQL এর মাধ্যমে ছোট থেকে বড় এবং জটিল সব ধরনের প্রজেক্টে নিজস্ব প্রয়োজন মতো কাস্টোমাইজ করার সুবিধা দেয় যার ফলে অনেক স্কেলেবেল ও পারফর্মান্স অপ্টিমাইজড হয়।

## 2. What is the purpose of a database schema in PostgreSQL?
PostgreSQL -এ Schema হলো একটি লজিক্যাল কন্টেইনার বা নেমস্পেস যা ডাটাবেসের কাঠামোকে সুসংগঠিত ভাবে সজ্ঞায়িত করে। সহজভাবে বলতে গেলে, Schema হলো একটি ফোল্ডারের মতো, যেখানে ডাটাবেসের বিভিন্ন উপাদান যেমন টেবিল, ভিউ, ফাংশন ইত্যাদি থাকে। একটি ডাটাবেসে একাধিক Schema যুক্ত করা যায়, ফলে প্রয়োজন অনুসারে একাধিক schema -তে ডাটা সংরক্ষন করলে এটি ম্যানেজ করতে সুবিধা হয়। আবার একই নামে একাধিক টেবিল প্রয়োজন হলে খুব সহজেই আলাদা আলাদা schema তে একই নামে তৈরি করা যায়। বড় প্রজেক্টের ক্ষেত্রে ডাটার প্রয়োজন অনুসারে ভিন্ন ভিন্ন schema-র ব্যবহার ডাটাবেস ম্যানেজ-কে অনেক সহজ করে ফেলে। schema-তে ইউজার অনুসারে ডাটাবেস এক্সেস নির্ধারনের মাধ্যমে ডাটাবেসের নিরাপত্তা বাড়িয়ে দেয়।

- Schema তৈরি করার জন্য কমান্ডঃ
```
CREATE SCHEMA schema_name;
```
- Schema-তে টেবিল তৈরি করার জন্য কমান্ডঃ
```
CREATE TABLE schema_name.table_name (
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    region VARCHAR(50) NOT NULL
);
```

- Schema ডিলিট করার জন্য কমান্ডঃ
```
DROP SCHEMA schema_name CASCADE;
```

- Schema পরিবর্তন বা সিলেক্ট করা ঃ
```
SET search_path TO schema_name;
```

## 3. Explain the Primary Key and Foreign Key concepts in PostgreSQL.
## 4. What is the difference between the VARCHAR and CHAR data types?
## 5. Explain the purpose of the WHERE clause in a SELECT statement.
## 6. What are the LIMIT and OFFSET clauses used for?
## 7. How can you modify data using UPDATE statements?
## 8. What is the significance of the JOIN operation, and how does it work in PostgreSQL?
## 9. Explain the GROUP BY clause and its role in aggregation operations.
## 10. How can you calculate aggregate functions like COUNT(), SUM(), and AVG() in PostgreSQL?
