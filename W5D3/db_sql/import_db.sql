PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS users;

CREATE TABLE users(
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL
);


CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    body VARCHAR(255) NOT NULL,
    author_id INTEGER NOT NULL,

    FOREIGN KEY (author_id) REFERENCES users(id)
);


CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);


CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    parent_reply_id INTEGER,
    author_id INTEGER NOT NULL,
    body VARCHAR(255) NOT NULL,

    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (parent_reply_id) REFERENCES replies(id),
    FOREIGN KEY (author_id) REFERENCES users(id)
);


CREATE TABLE question_likes(
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    author_id INTEGER NOT NULL,

    FOREIGN KEY (question_id) REFERENCES questions(id)
    FOREIGN KEY (author_id) REFERENCES users(id)
);

INSERT INTO
  users (fname, lname)
VALUES
  ('Arthur', 'Miller'),
  ('Eugene', 'O''Neill');

INSERT INTO
  questions (title, body, author_id)
VALUES
  ('admisions', 'When does the class start?', (SELECT id FROM users WHERE fname = 'Arthur' AND lname = 'Miller')),
  ('logistics', 'What are nearest bus lines?', (SELECT id FROM users WHERE fname = 'Eugene' AND lname = 'O''Neill'));

INSERT INTO
    question_follows(user_id, question_id)
VALUES
    ((SELECT id FROM users WHERE fname = 'Arthur' AND lname = 'Miller') , (SELECT id FROM questions WHERE title = 'logistics')),
    ((SELECT id FROM users WHERE fname = 'Eugene' AND lname = 'O''Neill'), (SELECT id FROM questions WHERE title = 'admitions'));

INSERT INTO
    replies(question_id, parent_reply_id, author_id, body)
VALUES
    (( SELECT id FROM questions WHERE title = logistics), 
    (SELECT id FROM users WHERE fname = 'Arthur' AND lname = 'Miller'), 'When does the class start?');

INSERT INTO
    question_likes(user_id, question_id)
VALUES
((SELECT id FROM users WHERE fname = 'Arthur' AND lname = 'Miller'),
(SELECT id FROM questions WHERE title = 'admisions'));


