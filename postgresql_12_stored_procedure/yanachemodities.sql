-- Drop table

-- DROP TABLE mi181_amlagsac."_client";

CREATE TABLE mi181_amlagsac."_client" (
	id serial NOT NULL,
	client_fname varchar(45) NULL DEFAULT NULL::character varying,
	client_lname varchar(45) NULL DEFAULT NULL::character varying,
	client_initial varchar(3) NULL DEFAULT NULL::character varying,
	client_address varchar(255) NULL DEFAULT NULL::character varying,
	client_contact varchar(9) NULL DEFAULT NULL::character varying,
	CONSTRAINT "_client_pkey" PRIMARY KEY (id)
);

-- Permissions

ALTER TABLE mi181_amlagsac."_client" OWNER TO datama2mi181;
GRANT ALL ON TABLE mi181_amlagsac."_client" TO datama2mi181;

-- Drop table

-- DROP TABLE mi181_amlagsac."_client_has_commodities";

CREATE TABLE mi181_amlagsac."_client_has_commodities" (
	id serial NOT NULL,
	client_id varchar(1) NULL DEFAULT NULL::character varying,
	commodities_id varchar(1) NULL DEFAULT NULL::character varying,
	commodities_employee_id varchar(1) NULL DEFAULT NULL::character varying,
	CONSTRAINT "_client_has_commodities_pkey" PRIMARY KEY (id),
	CONSTRAINT commodities_id FOREIGN KEY (id) REFERENCES _commodities(id) ON UPDATE CASCADE ON DELETE RESTRICT,
	CONSTRAINT employee_id FOREIGN KEY (id) REFERENCES _employee(id) ON UPDATE CASCADE ON DELETE RESTRICT
);

-- Permissions

ALTER TABLE mi181_amlagsac."_client_has_commodities" OWNER TO datama2mi181;
GRANT ALL ON TABLE mi181_amlagsac."_client_has_commodities" TO datama2mi181;


-- Drop table

-- DROP TABLE mi181_amlagsac."_commodities";

CREATE TABLE mi181_amlagsac."_commodities" (
	id serial NOT NULL,
	com_type varchar(45) NULL DEFAULT NULL::character varying,
	com_validity varchar(45) NULL DEFAULT NULL::character varying,
	com_worth varchar(45) NULL DEFAULT NULL::character varying,
	com_quantity int2 NULL,
	com_brand varchar(45) NULL DEFAULT NULL::character varying,
	employee_id int2 NULL,
	CONSTRAINT "_commodities_pkey" PRIMARY KEY (id)
);

-- Permissions

ALTER TABLE mi181_amlagsac."_commodities" OWNER TO datama2mi181;
GRANT ALL ON TABLE mi181_amlagsac."_commodities" TO datama2mi181;


-- Drop table

-- DROP TABLE mi181_amlagsac."_contract";

CREATE TABLE mi181_amlagsac."_contract" (
	id serial NOT NULL,
	con_signed varchar(45) NULL DEFAULT NULL::character varying,
	con_date varchar(45) NULL DEFAULT NULL::character varying,
	con_expiration varchar(45) NULL DEFAULT NULL::character varying,
	client_id varchar(45) NULL DEFAULT NULL::character varying,
	employee_id varchar(45) NULL DEFAULT NULL::character varying,
	employee_client_id varchar(45) NULL DEFAULT NULL::character varying,
	CONSTRAINT "_contract_pkey" PRIMARY KEY (id),
	CONSTRAINT employee_id FOREIGN KEY (id) REFERENCES _employee(id) ON UPDATE CASCADE ON DELETE RESTRICT
);

-- Permissions

ALTER TABLE mi181_amlagsac."_contract" OWNER TO datama2mi181;
GRANT ALL ON TABLE mi181_amlagsac."_contract" TO datama2mi181;


-- Drop table

-- DROP TABLE mi181_amlagsac."_delivery";

CREATE TABLE mi181_amlagsac."_delivery" (
	id serial NOT NULL,
	del_cour varchar(45) NULL DEFAULT NULL::character varying,
	del_data_receive varchar(45) NULL DEFAULT NULL::character varying,
	client_id varchar(45) NULL DEFAULT NULL::character varying,
	CONSTRAINT "_delivery_pkey" PRIMARY KEY (id),
	CONSTRAINT client_id FOREIGN KEY (id) REFERENCES _client(id) ON UPDATE CASCADE ON DELETE RESTRICT
);

-- Permissions

ALTER TABLE mi181_amlagsac."_delivery" OWNER TO datama2mi181;
GRANT ALL ON TABLE mi181_amlagsac."_delivery" TO datama2mi181;


-- Drop table

-- DROP TABLE mi181_amlagsac."_employee";

CREATE TABLE mi181_amlagsac."_employee" (
	id serial NOT NULL,
	emp_fname varchar(45) NULL DEFAULT NULL::character varying,
	emp_lname varchar(45) NULL DEFAULT NULL::character varying,
	emp_initial varchar(3) NULL DEFAULT NULL::character varying,
	emp_address varchar(255) NULL DEFAULT NULL::character varying,
	emp_dob varchar(19) NULL DEFAULT NULL::character varying,
	client_id int2 NULL,
	CONSTRAINT "_employee_pkey" PRIMARY KEY (id),
	CONSTRAINT client_id FOREIGN KEY (id) REFERENCES _client(id) ON UPDATE CASCADE ON DELETE RESTRICT
);

-- Permissions

ALTER TABLE mi181_amlagsac."_employee" OWNER TO datama2mi181;
GRANT ALL ON TABLE mi181_amlagsac."_employee" TO datama2mi181;

-- Drop table

-- DROP TABLE mi181_amlagsac."_financial_report";

CREATE TABLE mi181_amlagsac."_financial_report" (
	id serial NOT NULL,
	fr_amount varchar(45) NULL DEFAULT NULL::character varying,
	fr_date varchar(45) NULL DEFAULT NULL::character varying,
	CONSTRAINT "_financial_report_pkey" PRIMARY KEY (id)
);

-- Permissions

ALTER TABLE mi181_amlagsac."_financial_report" OWNER TO datama2mi181;
GRANT ALL ON TABLE mi181_amlagsac."_financial_report" TO datama2mi181;


-- Drop table

-- DROP TABLE mi181_amlagsac."_salary";

CREATE TABLE mi181_amlagsac."_salary" (
	id serial NOT NULL,
	sal_amount int4 NULL,
	sal_received int4 NULL,
	sal_date timestamp NULL,
	employee_id varchar(45) NULL DEFAULT NULL::character varying,
	employee_client_id varchar(45) NULL DEFAULT NULL::character varying,
	CONSTRAINT "_salary_pkey" PRIMARY KEY (id),
	CONSTRAINT employee_client_id FOREIGN KEY (id) REFERENCES _client(id) ON UPDATE CASCADE ON DELETE RESTRICT,
	CONSTRAINT employee_id FOREIGN KEY (id) REFERENCES _employee(id) ON UPDATE CASCADE ON DELETE RESTRICT
);

-- Permissions

ALTER TABLE mi181_amlagsac."_salary" OWNER TO datama2mi181;
GRANT ALL ON TABLE mi181_amlagsac."_salary" TO datama2mi181;


-- Drop table

-- DROP TABLE mi181_amlagsac."_training";

CREATE TABLE mi181_amlagsac."_training" (
	id serial NOT NULL,
	trai_location varchar(45) NULL DEFAULT NULL::character varying,
	trai_num_employ varchar(45) NULL DEFAULT NULL::character varying,
	employee_id varchar(45) NULL DEFAULT NULL::character varying,
	employee_client_id varchar(45) NULL DEFAULT NULL::character varying,
	employee_financial_report_id varchar(45) NULL DEFAULT NULL::character varying,
	CONSTRAINT "_training_pkey" PRIMARY KEY (id),
	CONSTRAINT employee_id FOREIGN KEY (id) REFERENCES _employee(id) ON UPDATE CASCADE ON DELETE RESTRICT,
	CONSTRAINT financial_report_id FOREIGN KEY (id) REFERENCES _financial_report(id) ON UPDATE CASCADE ON DELETE RESTRICT
);

-- Permissions

ALTER TABLE mi181_amlagsac."_training" OWNER TO datama2mi181;
GRANT ALL ON TABLE mi181_amlagsac."_training" TO datama2mi181;


CREATE OR REPLACE PROCEDURE mi181_amlagsac.sal_adjust(integer, numeric)
 LANGUAGE plpgsql
AS $procedure$
declare
temp_sal_date timestamp(6)without time zone;
begin
	update "mi181_amlagsac"."_salary"
	set sal_amount = sal_amount + $2
	where id = $1;

	update "mi181_amlagsac"."_salary"
	set sal_received = sal_received + $2
	where id = $1;

	temp_sal_date := current_timestamp;
	update mi181_amlagsac."_salary" set sal_date = temp_sal_date where mi181_amlagsac."_salary".id = $1;
	commit;
end;
$procedure$
;
