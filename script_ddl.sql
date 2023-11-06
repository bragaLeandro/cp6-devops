CREATE SEQUENCE IF NOT EXISTS SQ_TB_USER START WITH 1 INCREMENT BY 1;

CREATE TABLE TAB_USER
(
    id_user      BIGINT NOT NULL,
    ds_name      VARCHAR(255),
    ds_email     VARCHAR(255),
    ds_password  VARCHAR(455),
    dateOfBirth  date,
    creationDate TIMESTAMP WITHOUT TIME ZONE,
    role         VARCHAR(255),
    CONSTRAINT pk_tab_user PRIMARY KEY (id_user)
);

CREATE SEQUENCE IF NOT EXISTS SQ_TB_RECIPE START WITH 1 INCREMENT BY 1;

CREATE TABLE TAB_RECIPE
(
    nm_id      BIGINT NOT NULL,
    ds_title   VARCHAR(255),
    difficulty VARCHAR(255),
    prep_time  VARCHAR(255),
    ds_recipe  VARCHAR(6000),
    CONSTRAINT pk_tab_recipe PRIMARY KEY (nm_id)
);

CREATE SEQUENCE IF NOT EXISTS SQ_TB_INGREDIENT START WITH 1 INCREMENT BY 1;

CREATE TABLE ingredient
(
    nm_id           BIGINT NOT NULL,
    ingredient_name VARCHAR(255),
    category        VARCHAR(255),
    CONSTRAINT pk_ingredient PRIMARY KEY (nm_id)
);

ALTER TABLE ingredient
    ADD CONSTRAINT uc_ingredient_ingredient_name UNIQUE (ingredient_name);

CREATE SEQUENCE IF NOT EXISTS SQ_TB_INGREDIENT START WITH 1 INCREMENT BY 1;

CREATE TABLE ingredient
(
    nm_id           BIGINT NOT NULL,
    ingredient_name VARCHAR(255),
    category        VARCHAR(255),
    CONSTRAINT pk_ingredient PRIMARY KEY (nm_id)
);

ALTER TABLE ingredient
    ADD CONSTRAINT uc_ingredient_ingredient_name UNIQUE (ingredient_name);

CREATE SEQUENCE IF NOT EXISTS SQ_TB_USER_RECIPE START WITH 1 INCREMENT BY 1;

CREATE TABLE TAB_USER_RECIPE
(
    id            BIGINT NOT NULL,
    recipe_id     BIGINT,
    user_id       BIGINT,
    creation_date TIMESTAMP WITHOUT TIME ZONE,
    CONSTRAINT pk_tab_user_recipe PRIMARY KEY (id)
);

ALTER TABLE TAB_USER_RECIPE
    ADD CONSTRAINT FK_TAB_USER_RECIPE_ON_RECIPE FOREIGN KEY (recipe_id) REFERENCES TAB_RECIPE (nm_id);

ALTER TABLE TAB_USER_RECIPE
    ADD CONSTRAINT FK_TAB_USER_RECIPE_ON_USER FOREIGN KEY (user_id) REFERENCES TAB_USER (id_user);