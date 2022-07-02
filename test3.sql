CREATE TABLE user_test(
	id_user INT NOT NULL primary key,
	name VARCHAR(150),
	mobile BIGINT,
	birthdate DATE,
	email VARCHAR(150),
	password VARCHAR(150),
	status smallint
);

CREATE TABLE customer(
	id_customer INT NOT NULL primary key,	
	name VARCHAR(150),
	default_language VARCHAR(2),
	status smallint,
) ;

CREATE TABLE user_customer(
	id INT NOT NULL primary key,
	id_customer int not null,
	id_user int not null,
	FOREIGN KEY (id_customer) REFERENCES customer(id_customer),
	FOREIGN KEY (id_user) REFERENCES user_test(id_user)
);

insert into customer(id_customer, name, default_language, status) values(1, 'Ronald', 'Es', 1);
insert into customer(id_customer, name, default_language, status) values(2, 'Andres', 'Es', 1);
insert into customer(id_customer, name, default_language, status) values(3, 'Ricardo', 'In', 2);
insert into customer(id_customer, name, default_language, status) values(4, 'Messi', 'Es', 2);

insert into user_test(id_user, name, mobile, birthdate, email, password, status) values(1, 'Eduardo', 323456525, '01-07-2000','edu@gmail.com', '123', 1);
insert into user_test(id_user, name, mobile, birthdate, email, password, status) values(2, 'Michael', 323456526, '1999-07-01','mich@gmail.com', '123', 2);
insert into user_test(id_user, name, mobile, birthdate, email, password, status) values(3, 'Rodrigo', 323456527, '2018-07-01','rod@gmail.com', '123', 2);
insert into user_test(id_user, name, mobile, birthdate, email, password, status) values(4, 'Estefan', 323456522, '2017-07-01','este@gmail.com', '123', 2);

insert into user_customer(id, id_user, id_customer) values(1, 1, 1);
insert into user_customer(id, id_user, id_customer) values(2, 1, 2);
insert into user_customer(id, id_user, id_customer) values(3, 1, 3);
insert into user_customer(id, id_user, id_customer) values(4, 1, 4);

select 
u.name,
u.birthdate,
c.name as nombre_cliente
from user_test u inner join user_customer uc 
	on u.id_user = uc.id_user
	inner join customer c 
	on c.id_customer = uc.id_customer
where 
(
	(cast(convert(varchar(8),getdate(),112) as int)-
	cast(convert(varchar(8),u.birthdate,112) as int) ) / 10000
) > 18 
and u.status = 1
and c.status = 1
order by c.name;