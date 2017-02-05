insert into OPERATIONS
values ('1', 'dry-clean');
insert into OPERATIONS
values ('2', 'wash');
insert into OPERATIONS
values ('3', 'care and maintenance');

insert into PLANS
values ('1', 'Plan A');
insert into PLANS
values ('2', 'Plan B');
insert into PLANS
values ('3', 'Plan C');
insert into PLANS
values ('4', 'Plan D');
insert into PLANS
values ('5', 'Plan E');


insert into DETERGENT
values ('1', 'laundry detergent');
insert into DETERGENT
values ('2', 'powder detergent');
insert into DETERGENT
values ('3', 'detergent pacs and tablets');
insert into DETERGENT
values ('4', 'fabric softener');
insert into DETERGENT
values ('5', 'bleach');
insert into DETERGENT
values ('6', 'starch and anti-static sprays');
insert into DETERGENT
values ('7', 'lint removal');
insert into DETERGENT
values ('8', 'fabric deodorizer');
insert into DETERGENT
values ('9', 'stain removal');

insert into CUSTOMER
values ('4695629999', 'Aaa', 'Wss', 'D');
insert into CUSTOMER
values ('4695628888', 'Baa', 'Ess', 'B');
insert into CUSTOMER
values ('4695627777', 'Caa', 'Rss', 'W');
insert into CUSTOMER
values ('4695626666', 'Daa', 'Sss', 'T');

insert into MEMBERSHIP_CARD
values ('11111', to_date('02-AUG-16','DD-MON-RR'),
	to_date('02-AUG-19','DD-MON-RR'), '4695629999');
insert into MEMBERSHIP_CARD
values ('22222', to_date('25-MAY-16','DD-MON-RR'),
	to_date('25-MAY-19','DD-MON-RR'), '4695628888');
insert into MEMBERSHIP_CARD
values ('33333', to_date('15-JUL-15','DD-MON-RR'),
	to_date('15-JUL-18','DD-MON-RR'), '4695627777');

insert into USE
values ('1', '3');
insert into USE
values ('2', '1');
insert into USE
values ('2', '2');
insert into USE
values ('2', '4');
insert into USE
values ('3', '5');
insert into USE
values ('3', '6');
insert into USE
values ('3', '7');
insert into USE
values ('3', '8');
insert into USE
values ('3', '9');

insert into CONTAIN
values ('1', '1');
insert into CONTAIN
values ('2', '2');
insert into CONTAIN
values ('3', '3');
insert into CONTAIN
values ('4', '1');
insert into CONTAIN
values ('4', '3');
insert into CONTAIN
values ('5', '2');
insert into CONTAIN
values ('5', '3');

insert into DRY_CLEANER_BRANCH
values ('1', '9:00-18:00', 'Dry Cleaner1', 'Plano',
	'4695621111', '123456789');
insert into DRY_CLEANER_BRANCH
values ('2', '9:00-18:00', 'Dry Cleaner2', 'Richardson',
	'4695622222', '234567890');

insert into EMPLOYEE
values ('111111111', 'Sgffg', 'F', 'Egfdfg',
	'4424565555', 'Plano', 'M', '1');
insert into EMPLOYEE
values ('222222222', 'Wgd', 'W', 'Fgf',
	'4424566666', 'Plano', 'F', '1');
insert into EMPLOYEE
values ('123456789', 'Egdf', 'B', 'Efdgfd',
	'4424562222', 'Plano', 'F', '1');
insert into EMPLOYEE
values ('999999999', 'Ssdd', 'F', 'Egdfbb',
	'4424562442', 'Plano', 'F', '2');
insert into EMPLOYEE
values ('234567890', 'Mfdf', 'H', 'Uddff',
	'4424561444', 'Richarsdon', 'M', '2');

insert into DATE_INFO
values (to_date('30-NOV-16','DD-MON-RR'), '1',
	to_date('2-DEC-16','DD-MON-RR'));
insert into DATE_INFO
values (to_date('12-NOV-16','DD-MON-RR'), '2',
	to_date('14-DEC-16','DD-MON-RR'));

insert into ORDERS
values ('1', '10.00', '110', to_date('30-NOV-16','DD-MON-RR'),
	null, '1', '1', '4695629999');
insert into ORDERS
values ('2', '12.22', '111', to_date('12-NOV-16','DD-MON-RR'),
	to_date('15-NOV-16','DD-MON-RR'), '2', '2', '4695628888');


