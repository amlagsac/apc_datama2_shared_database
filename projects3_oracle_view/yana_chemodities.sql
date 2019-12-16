CREATE TABLE "MI181_AMLAGSAC"."_client" 
(	"ID" NUMBER NOT NULL ENABLE, 
"CLIENT_FNAME" VARCHAR2(45) DEFAULT cast(NULL as  varchar2(4000)), 
"CLIENT_LNAME" VARCHAR2(45) DEFAULT cast(NULL as  varchar2(4000)), 
"CLIENT_INITIAL" VARCHAR2(3) DEFAULT cast(NULL as  varchar2(4000)), 
"CLIENT_ADDRESS" VARCHAR2(255) DEFAULT cast(NULL as  varchar2(4000)), 
"CLIENT_CONTACT" VARCHAR2(9) DEFAULT cast(NULL as  varchar2(4000)), 
    CONSTRAINT "CLIENT_PKEY" PRIMARY KEY ("ID")
USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
TABLESPACE "USERS"  ENABLE
) SEGMENT CREATION IMMEDIATE 
PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
NOCOMPRESS LOGGING
STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
TABLESPACE "USERS" ;

CREATE TABLE "MI181_AMLAGSAC"."_client_has_commodities" 
(	"ID" NUMBER NOT NULL ENABLE, 
"CLIENT_ID" VARCHAR2(1) DEFAULT cast(NULL as  varchar2(4000)), 
"COMMODITIES_ID" VARCHAR2(1) DEFAULT cast(NULL as  varchar2(4000)), 
"COMMODITIES_EMPLOYEE_ID" VARCHAR2(1) DEFAULT cast(NULL as  varchar2(4000)), 
    CONSTRAINT "CLIENT_HAS_COMMODITIES_PKEY" PRIMARY KEY ("ID")
USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
TABLESPACE "USERS"  ENABLE, 
    CONSTRAINT "COMMODITIES_ID" FOREIGN KEY ("ID")
    REFERENCES "MI181_AMLAGSAC"."_commodities" ("ID") ENABLE, 
    CONSTRAINT "EMPLOYEE_ID_3" FOREIGN KEY ("ID")
    REFERENCES "MI181_AMLAGSAC"."_employee" ("ID") ENABLE
) SEGMENT CREATION DEFERRED 
PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
NOCOMPRESS LOGGING
TABLESPACE "USERS" ;

CREATE TABLE "MI181_AMLAGSAC"."_commodities" 
(	"ID" NUMBER NOT NULL ENABLE, 
"COM_TYPE" VARCHAR2(45) DEFAULT cast(NULL as  varchar2(4000)), 
"COM_VALIDITY" VARCHAR2(45) DEFAULT cast(NULL as  varchar2(4000)), 
"COM_WORTH" VARCHAR2(45) DEFAULT cast(NULL as  varchar2(4000)), 
"COM_QUANTITY" NUMBER(5,0), 
"COM_BRAND" VARCHAR2(45) DEFAULT cast(NULL as  varchar2(4000)), 
"EMPLOYEE_ID" NUMBER(5,0), 
    CONSTRAINT "COMMODITIES_PKEY" PRIMARY KEY ("ID")
USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
TABLESPACE "USERS"  ENABLE
) SEGMENT CREATION IMMEDIATE 
PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
NOCOMPRESS LOGGING
STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
TABLESPACE "USERS" ;

CREATE TABLE "MI181_AMLAGSAC"."_contract" 
(	"ID" NUMBER NOT NULL ENABLE, 
"CON_SIGNED" VARCHAR2(45) DEFAULT cast(NULL as  varchar2(4000)), 
"CON_DATE" VARCHAR2(45) DEFAULT cast(NULL as  varchar2(4000)), 
"CON_EXPIRATION" VARCHAR2(45) DEFAULT cast(NULL as  varchar2(4000)), 
"CLIENT_ID" VARCHAR2(45) DEFAULT cast(NULL as  varchar2(4000)), 
"EMPLOYEE_ID" VARCHAR2(45) DEFAULT cast(NULL as  varchar2(4000)), 
"EMPLOYEE_CLIENT_ID" VARCHAR2(45) DEFAULT cast(NULL as  varchar2(4000)), 
    CONSTRAINT "CONTRACT_PKEY" PRIMARY KEY ("ID")
USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
TABLESPACE "USERS"  ENABLE, 
    CONSTRAINT "EMPLOYEE_ID" FOREIGN KEY ("ID")
    REFERENCES "MI181_AMLAGSAC"."_employee" ("ID") ENABLE
) SEGMENT CREATION DEFERRED 
PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
NOCOMPRESS LOGGING
TABLESPACE "USERS" ;

CREATE TABLE "MI181_AMLAGSAC"."_delivery" 
(	"ID" NUMBER NOT NULL ENABLE, 
"DEL_COUR" VARCHAR2(45) DEFAULT cast(NULL as  varchar2(4000)), 
"DEL_DATA_RECEIVE" VARCHAR2(45) DEFAULT cast(NULL as  varchar2(4000)), 
"CLIENT_ID" VARCHAR2(45) DEFAULT cast(NULL as  varchar2(4000)), 
    CONSTRAINT "DELIVERY_PKEY" PRIMARY KEY ("ID")
USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
TABLESPACE "USERS"  ENABLE, 
    CONSTRAINT "CLIENT_ID_2" FOREIGN KEY ("ID")
    REFERENCES "MI181_AMLAGSAC"."_client" ("ID") ENABLE
) SEGMENT CREATION DEFERRED 
PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
NOCOMPRESS LOGGING
TABLESPACE "USERS" ;

CREATE TABLE "MI181_AMLAGSAC"."_employee" 
(	"ID" NUMBER NOT NULL ENABLE, 
"EMP_FNAME" VARCHAR2(45) DEFAULT cast(NULL as  varchar2(4000)), 
"EMP_LNAME" VARCHAR2(45) DEFAULT cast(NULL as  varchar2(4000)), 
"EMP_INITIAL" VARCHAR2(3) DEFAULT cast(NULL as  varchar2(4000)), 
"EMP_ADDRESS" VARCHAR2(255) DEFAULT cast(NULL as  varchar2(4000)), 
"EMP_DOB" VARCHAR2(19) DEFAULT cast(NULL as  varchar2(4000)), 
"CLIENT_ID" NUMBER(5,0), 
    CONSTRAINT "EMPLOYEE_PKEY" PRIMARY KEY ("ID")
USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
TABLESPACE "USERS"  ENABLE, 
    CONSTRAINT "CLIENT_ID" FOREIGN KEY ("ID")
    REFERENCES "MI181_AMLAGSAC"."_client" ("ID") ENABLE
) SEGMENT CREATION IMMEDIATE 
PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
NOCOMPRESS LOGGING
STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
TABLESPACE "USERS" ;

CREATE TABLE "MI181_AMLAGSAC"."_financial_report" 
(	"ID" NUMBER NOT NULL ENABLE, 
"FR_AMOUNT" VARCHAR2(45) DEFAULT cast(NULL as  varchar2(4000)), 
"FR_DATE" VARCHAR2(45) DEFAULT cast(NULL as  varchar2(4000)), 
    CONSTRAINT "FINANCIAL_REPORT_PKEY" PRIMARY KEY ("ID")
USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
TABLESPACE "USERS"  ENABLE
) SEGMENT CREATION DEFERRED 
PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
NOCOMPRESS LOGGING
TABLESPACE "USERS" ;

CREATE TABLE "MI181_AMLAGSAC"."_salary" 
(	"ID" NUMBER NOT NULL ENABLE, 
"SAL_AMOUNT" VARCHAR2(45) DEFAULT cast(NULL as  varchar2(4000)), 
"SAL_RECEIVED" VARCHAR2(45) DEFAULT cast(NULL as  varchar2(4000)), 
"EMPLOYEE_ID" VARCHAR2(45) DEFAULT cast(NULL as  varchar2(4000)), 
"EMPLOYEE_CLIENT_ID" VARCHAR2(45) DEFAULT cast(NULL as  varchar2(4000)), 
    CONSTRAINT "SALARY_PKEY" PRIMARY KEY ("ID")
USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
TABLESPACE "USERS"  ENABLE, 
    CONSTRAINT "EMPLOYEE_CLIENT_ID" FOREIGN KEY ("ID")
    REFERENCES "MI181_AMLAGSAC"."_client" ("ID") ENABLE
) SEGMENT CREATION DEFERRED 
PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
NOCOMPRESS LOGGING
TABLESPACE "USERS" ;

CREATE TABLE "MI181_AMLAGSAC"."_training" 
(	"ID" NUMBER NOT NULL ENABLE, 
"TRAI_LOCATION" VARCHAR2(45) DEFAULT cast(NULL as  varchar2(4000)), 
"TRAI_NUM_EMPLOY" VARCHAR2(45) DEFAULT cast(NULL as  varchar2(4000)), 
"EMPLOYEE_ID" VARCHAR2(45) DEFAULT cast(NULL as  varchar2(4000)), 
"EMPLOYEE_CLIENT_ID" VARCHAR2(45) DEFAULT cast(NULL as  varchar2(4000)), 
"EMPLOYEE_FINANCIAL_REPORT_ID" VARCHAR2(45) DEFAULT cast(NULL as  varchar2(4000)), 
    CONSTRAINT "TRAINING_PKEY" PRIMARY KEY ("ID")
USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
TABLESPACE "USERS"  ENABLE, 
    CONSTRAINT "EMPLOYEE_ID_2" FOREIGN KEY ("ID")
    REFERENCES "MI181_AMLAGSAC"."_employee" ("ID") ENABLE, 
    CONSTRAINT "FINANCIAL_REPORT_ID" FOREIGN KEY ("ID")
    REFERENCES "MI181_AMLAGSAC"."_financial_report" ("ID") ENABLE
) SEGMENT CREATION DEFERRED 
PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
NOCOMPRESS LOGGING
TABLESPACE "USERS" ;