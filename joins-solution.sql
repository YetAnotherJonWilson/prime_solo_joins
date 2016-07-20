# prime_solo_joins

-- 1. Get all customers and their addresses.
select * from customers left outer join addresses on customers.id = addresses.customer_id;

-- 2. Get all orders and their line items.
select * from orders left outer join line_items on orders.id = line_items.order_id;

-- 3. Which warehouses have cheetos?
select warehouse.warehouse from warehouse
join warehouse_product on warehouse.id = warehouse_product.warehouse_id
join products on products.id = warehouse_product.product_id
where products.description = 'cheetos';

-- 4. Which warehouses have diet pepsi?
select warehouse.warehouse from warehouse
join warehouse_product on warehouse.id = warehouse_product.warehouse_id
join products on products.id = warehouse_product.product_id
where products.description = 'diet pepsi';

-- 5. Get the number of orders for each customer. note: It is OK if those without orders are not included in results.
select customers.first_name, last_name, count(customers.last_name)from customers
join addresses on customers.id = addresses.customer_id
join orders on addresses.id = orders.address_id
group by customers.first_name, customers.last_name;

-- 6. How many customers do we have?
select count(*) from customers;

-- 7. How many products do we carry?
select count(*) from products;

-- 8. What is the total available on-hand quantity of diet pepsi?
SELECT SUM(on_hand) FROM warehouse_product
join products on warehouse_product.product_id = products.id
where products.description = 'diet pepsi';
