---
title: Intro to NoSQL With MongoDB
type: Lesson
duration: '"1:25"'
creator:
    name: Jim Clark / Micah Rich
    city: LA
---

# ![](https://ga-dash.s3.amazonaws.com/production/assets/logo-9f88ae6c9c3871690e33280fcf557f33.png) Intro to NoSQL With MongoDB

### Lesson Objectives
- Describe how mongo databases came about and why they're useful.
- Compare and contrast NoSQL with SQL.
- Define a document in the context of MongoDB.
- Explain the difference between embedded and referenced documents and how we use each to model relationships in MongoDB.
- Issue basic CRUD commands to a database from the mongo shell.

## Intro: What Is MongoDB? (15 min)

#### Overview: Mongo and NoSQL Databases

MongoDB is one of the new breeds of databases known as **NoSQL databases**. NoSQL databases are heavily used in real time, big data and social media applications and are generally called NoSQL because they do things a little differently than traditional SQL databases. We'll find out what that means in a minute.

Just so you know: There are software "drivers" that allow MongoDB to be used with a multitude of programming languages and frameworks, including Node.js and Ruby on Rails; we'll be talking about this more later on. If you want to research using drivers in Sinatra or Rails, take a look at the `mongoid` gem.

For this module, we're using straight-up mongo. So, what does a mongo database look like?

#### Data Format

- A MongoDB database consists of _documents_.
- A _document_ in MongoDB is composed of _field_ and _value_ pairs.
- **Hint**: Remember our relational database (SQL) tables? You can think of each of these _documents_ as a row in your table. Let's take a look at what a MongoDB _document_ may look like:

```js
{
    _id: ObjectId("5099803df3f4948bd2f98391"),
    name: { first: "Alan", last: "Turing" },
    birth: new Date('Jun 23, 1912'),
    death: new Date('Jun 07, 1954'),
    contribs: [ "Turing machine", "Turing test", "Turingery" ],
    views: 1250000
}
```

__What does this data structure remind you of?__ JSON!

A MongoDB _document_ is very much like JSON, except that it is stored in the database in a format known as _BSON_ (think _Binary JSON_).

_BSON_ basically extends _JSON_ with additional data types such as __ObjectID__ and __Date__, shown above.

#### The Document `_id`

The `_id` is a special field that represents the document's _primary key_ and will always be listed as the first field. It must be unique.

We can explicitly set the `_id` like this:

```js
{
  _id: 2,
  name: "Suzy"
}
```
or this...

```js
{
  _id: "ABC",
  name: "Suzy"
}
```
However, it's more common to allow MongoDB to create it implicitly for us using its `ObjectID` data type.

#### Terminology: MongoDB vs. Relational SQL Databases 

Wondering what sets NoSQL apart from SQL? Here's a great analogy from StackOverflow:

> "NoSQL databases store information like you would recipes in a book. When you want to know how to make a cake, you go to that recipe and all of the information about how to make that cake (ingredients, preparation, mixing, baking, finishing, etc.) is all on that one page.
>
> "SQL is like shopping for the ingredients for the recipe. In order to get all of your ingredients into your cart, you have to go to many different aisles to get each ingredient. When you are done shopping, your grocery cart will be full of all the ingredients you had to run around and collect.
>
> "Wouldn’t it be nicer if there was a store that was organized by recipe, so you could go to one place in the store and grab everything you need from that one spot? Granted you’ll find ingredients like eggs in 50 different places, so there’s a bit of overhead when stocking the shelves, but from a consumer standpoint it would be much easier/faster to find what they're looking for."

-<a href="http://stackoverflow.com/questions/14428069/sql-and-nosql-analogy-for-the-non-technical/14428221#14428221" target="_blank">mgoffin, Jan 20 '13 at 19:15</a>

#### Key Differences of MongoDB

- It's schema-less.

The documents in a MongoDB collection can have completely different types and number of fields from each other.

__How does this compare to a SQL database such as PostgreSQL?__

- There are no table JOINs.

In a SQL database, we break up related data into separate tables.

In MongoDB, we often _embed_ related data in a single document; you'll see an example of this later.

The supporters of MongoDB highlight the lack of table JOINs as a performance advantage, as JOINs are expensive in terms of computer processing.

#### Differences in Terminology

![](http://4.bp.blogspot.com/-edz2_QrFvCE/UnzBhKZE3FI/AAAAAAAAAEs/bTEsqnZFTXw/s1600/SQL-MongoDB+Correspondence.PNG)

## Code-Along: Installing, Creating a DB, and Inserting Documents (15 min)

#### Installation

You may already have MongoDB installed on your system, so let's check in terminal `which mongod` (note the lack of a "b" at the end).

If you get `/usr/local/bin/mongod`, you're golden!

If you get a null response, let's use _Homebrew_ to install MongoDB:

1. Update Homebrew's database (this might take a bit of time): `brew update`.
2. Then install MongoDB:

 `brew install mongodb`

3. By default, MongoDB will look for data in a folder named `/data/db`. We would have needed to create this folder, but Homebrew did it for us (hopefully).
   1. Run this command in your terminal:
```shell
[ ! -d /data/db ] && sudo mkdir -p /data/db && sudo chown -R $(whoami) /data/db || ls -la /data
```
   2. You should get something like this:
```shell
total 0
drwxr-xr-x   3 root       wheel   102 Nov 11 13:06 .
drwxr-xr-x  38 root       wheel  1360 Nov 11 13:06 ..
drwxr-xr-x   8 jseminara  wheel   272 Nov 11 13:10 db
```

#### Start Your Engine

`mongod` is the name of the actual database engine process. The installation of MongoDB does not set MongoDB to start automatically. A common source of errors when beginning to work with MongoDB is forgetting to start the database engine.

To start the database engine, type `mongod` in terminal.

Press `control+c` to stop the engine.

#### Creating a Database and Inserting Documents

MongoDB installs with a client app, a JavaScript-based shell, that allows us to interact directly with MongoDB.

Start the app in terminal by typing `mongo`.

The app will load and the prompt will change to `>`.

List the shell's available commands: `> help`.

Show the list of databases: `> show dbs`.

Show the name of the currently active database: `> db`.

Switch to a different database: `> use [name of database to switch to]`.

Let's switch to the `local` database: `> use local`.

Show the collections of the current database: `> show collections`.

#### Creating a new Database

To create a new database in the mongo shell, we simply have to _use_ the database. Let's create a database named `myDB`:

```
> use myDB
```

#### Inserting Data Into a Collection

This is how we can create and insert a document into a collection named `people`:

```
> db.people.insert({
    name: "Fred", // Don't type the dots, they are from the
    age: 21     // shell, indicating multi-line mode
})
```

Using a collection for the first time creates it!

#### Adding Lots of New Documents

In a moment we'll practice querying our database, but let's get more data in there first. Here are a few more documents to put in your `people` collection. We can simply provide this __array__ to the `insert()` method, and it will create a document for each object in the array:

```js
db.people.insert([
  {
    "name": "Emma",
    "age": 20
  },
  {
    "name": "Ray",
    "age": 45
  },
  {
    "name": "Celeste",
    "age": 33
  },
  {
    "name": "Stacy",
    "age": 53
  },
  {
    "name": "Katie",
    "age": 12
  },
  {
    "name": "Adrian",
    "age": 47
  }
]);
```

> **Note**: Be sure to type the closing parent of the `insert()` method!


## Code-Along: Querying Documents (10 min)

To list all documents in a collection, we use the `find()` method on the collection without any arguments:

```
> db.people.find()
```

Again, unlike the rows in a relational database, our documents don't need to have the same fields!

### More Specific Queries

We can also use the `find()` method to query the collection by passing in an argument: A JavaScript object containing criteria with which to query:

```
> db.people.find( {name: "Emma"} )

```

There are a handful of special criteria variables we can use, too. Here's how we can use MongoDB's `$gt` query operator to return all `people` documents with an `age` greater than 20:

```
> db.people.find( {age: { $gt: 20 } } )
```

MongoDB comes with a slew of built-in [query operators](http://docs.mongodb.org/manual/reference/operator/query/#query-selectors) we can use to write complex queries.

__How would we write a query to retrieve people who are less than or equal to `age` 20?__

In addition to selecting which data is returned, we can modify how that data is returned by limiting the number of documents returned, sorting the documents, and projecting which fields are returned.

This sorts our `age` query and then sorts by `name`:

```
> db.people.find( {age: { $gt: 20 } } ).sort( {name: 1} )
```
The `1` indicates ascending order.

[This documentation](http://docs.mongodb.org/manual/core/read-operations-introduction/) provides more detail about reading data.

## Code-Along: Updating Data (5 min)

In MongoDB, we use the `update()` method of collections by specifying the _update criteria_ (as we did with `find()`) and use the `$set` action to set the new value:

```
> db.people.update( { name: "Emma" }, { $set: { age: 99 } })
```

By default, `update()` will only modify a single document. However, with the `multi` option, we can update all of the documents that match the query:

```
> db.people.update( { name: { $lt: "M" } }, { $inc: { age: 10 } }, { multi: true } )
```
We used the `$inc` update operator to increase the existing value.

Here is the list of [available update operators](http://docs.mongodb.org/manual/reference/operator/update/).

## Code-Along: Removing Data (5 min)

We use the `remove()` method on data from collections.

If you want to completely remove a collection, including all of its indices, use `[name of the collection].drop()`.

Call `remove({})` on the collection to remove all of its docs. Note: All documents will match the "empty" criteria.

Otherwise, specify a criteria to remove all documents that match it:

```
> db.people.remove( { age: { $lt: 50 } } )
```

## Intro: Data Modeling in MongoDB (10 min)

There are two ways to model related data in MongoDB:

- via __embedding__
- via __referencing__ (linking)

Both approaches can be used simultaneously in the same document.

### Embedded Documents

In MongoDB, by design, it's common to __embed__ data in a parent document.

Modeling data with the __embedded__ approach is different than what we've seen in a relational database where we spread our data across multiple tables. However, this is the way MongoDB is designed to work and the reason MongoDB can read and return large amounts of data far more quickly than a SQL database that requires JOIN operations.

To demonstrate __embedding__, we'll add another person to our `people` collection, but this time we want to include contact info. A person may have several ways to contact them, so we'll be modeling a typical one-to-many relationship.

## Code-Along: Modeling Data (15 min)

Let's walk through this command by entering it together:

```js
> db.people.insert({
    name: "Manny",
    age: 33,
    contacts: [
      {
        type: "email",
        contact: "manny@domain.com"
      },
      {
        type: "mobile",
        contact: "(555) 555-5555"
      }
    ]})
```

__What do you imagine could be a downside of embedding data?__

If the embedded data's growth is unbound, MongoDB's maximum document size of 16 megabytes could be exceeded.

The above approach of embedding `contact` documents provides a great deal of flexibility in what types and how many contacts a person may have. However, this flexibility slightly complicates querying.

However, what if our app only wanted to work with a person's multiple `emails` and `phoneNumbers`?

__Knowing this, pair up and discuss how you might alter the above structure.__

#### Referencing Documents

We can model data relationships using a __references__ approach, in which data is stored in separate documents. These documents, due to the fact that they hold different types of data, are likely stored in separate collections.

It may help to think of this approach as _linking_ documents together by including a reference to the related document's `_id` field.

Let's create a new `bankAccounts` collection:

```js
> use bankAccounts
```

> **Note**: Use the idea that the person might have a _joint account_, which is owned by more than one person.

For the sake of _data consistency_, keeping the account data in its own document would be a better design decision. In clearer terms, it would not be a good idea to store a bank account's balance in more than one place.

In our app, we have decided that all bank accounts will be retrieved through a person. This decision allows us to include a reference on the only person document.

Implementing the above scenario is as simple as assigning a `bankAccount` document's `_id` to a new field in our person document.

Let's first create a bank account:

```js
> db.bankAccounts.insert({
  balance: 2000,
})
```

Now let's get that account's `_id`:

```js
> db.bankAccounts.findOne({})
{ "_id" : ObjectId("56426f481779b50ee5267752"), "balance" : 2000 }
```

Next, let's insert a person and reference their bank account:

```js
> db.people.insert({
    name: "Miguel",
    age: 46,
    bankAccount: ObjectId("56426f481779b50ee5267752")
})
```

Again, because there are no "JOINs" in MongoDB, retrieving a person's bank account information would require a separate query on the `bankAccounts` collection:

```js
> db.bankAccounts.find({ "_id": db.people.findOne({ name: "Miguel" }).bankAccount })
{ "_id" : ObjectId("56426f481779b50ee5267752"), "balance" : 2000 }
```

## Discussion: Data Modeling Best Practices (10 min)

MongoDB was designed from the ground up with application development in mind. Specifically, what can and can't be done with regard to data is enforced in your application, not the database itself (as in a SQL database).

Here are a few things to keep in mind:

- For performance and simplicity reasons, lean toward _embedding_ over _referencing_.
- Prefer the _reference_ approach when the amount of child data is unbound.
- Prefer the _reference_ approach when multiple parent documents access the same child document and that child document changes frequently.
- Obtaining _referenced_ documents requires multiple queries by your application.
- In the _references_ approach, depending upon your application's needs, you may choose to maintain links to the related document's `_id` in either document, or both.

For more details regarding data modeling in MongoDB, start with [this section of MongoDB's documentation](http://docs.mongodb.org/manual/core/data-modeling-introduction/) or this [hour-long YouTube video](https://www.youtube.com/watch?v=PIWVFUtBV1Q).


## Conclusion (5 min)

- What are some of the differences between MongoDB and PostgreSQL databases?
- How do you add a document to a collection in the mongo shell?
- Describe the difference between embedding and referencing documents. Provide an example of when you might use each.
