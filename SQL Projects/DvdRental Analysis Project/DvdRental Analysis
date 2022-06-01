--  DvdRental Analysis

-- * Find the email address for customer name 'Nancy Thomas' from customer table
-- * Solution 
SELECT email FROM customer WHERE first_name = 'Nancy' AND last_name = 'Thomas';

-- * Give the description for the move 'Outlaw Hanky'
-- * Solution 
SELECT description FROM film WHERE title = 'Outlaw Hanky';

-- * Get the phone number for the customer who live at '259 Ipoh Drive'
-- * Solution
SELECT phone FROM address WHERE address = '259 Ipoh Drive';

-- * What are the customer ids of the first 10 customers who created a payment?
-- * Solution
SELECT customer_id FROM payment ORDER BY payment_date ASC LIMIT 10;

-- * What are the titles of the 10 shortest (in lenght of runtime) movies?
-- * Solution
SELECT title, length FROM film ORDER BY length ASC LIMIT 10;

-- * Find out how many movies having runtime 5o minutes or less
-- * Solution
SELECT COUNT(title) FROM film WHERE length <= 50;

-- * Find out how many customers first name start with 'J' and last name with 'S'
-- * Solution
SELECT COUNT(*) FROM customer WHERE first_name LIKE 'J%' AND last_name LIKE 'S%';

-- * How many payment transactions were greater than $5.00?
-- * Solution
SELECT COUNT(amount) FROM payment WHERE amount > 5.00;

-- * How many actors have a first name that starts with the letter 'P'?
-- * Solution
SELECT COUNT(*) FROM actor WHERE first_name LIKE 'P%';

-- * How many unique districts are our customers from?
-- * Solution
SELECT COUNT(DISTINCT(district)) FROM address;

-- * Retrieve the list of names for those distinct districts from the previous question.
-- * Solution
SELECT DISTINCT (district) FROM address;

-- * Retrieve the list films have a rating of R and a replacement cost between $5 and $15?
-- * Solution
SELECT COUNT(*) FROM film WHERE rating = 'R' AND replacement_cost BETWEEN 5 AND 15 ORDER BY replacement_cost;

-- * How many films have the word Truman somewhere in the title?
-- * Solution
SELECT COUNT(*) FROM film WHERE title LIKE '%Truman%';









