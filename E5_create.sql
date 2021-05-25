-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2021-05-17 13:37:51.056

-- tables
-- Table: EVENTO
CREATE TABLE EVENTO (
    id_evento int  NOT NULL,
    fecha_evento date  NOT NULL,
    direccion varchar(30)  NOT NULL,
    ciudad varchar(30)  NOT NULL,
    tipo_e char(2)  NOT NULL,
    CONSTRAINT PK_EVENTO PRIMARY KEY (id_evento)
);

-- Table: EVENTO_PRIV
CREATE TABLE EVENTO_PRIV (
    id_evento int  NOT NULL,
    manager varchar(20)  NOT NULL,
    CONSTRAINT PK_EVENTO_PRIV PRIMARY KEY (id_evento)
);

-- Table: EVENTO_PUB
CREATE TABLE EVENTO_PUB (
    id_evento int  NOT NULL,
    tipo_organizacion varchar(20)  NOT NULL,
    nombre_organizacion varchar(50)  NOT NULL,
    CONSTRAINT PK_EVENTO_PUB PRIMARY KEY (id_evento)
);

-- Table: MODELO
CREATE TABLE MODELO (
    tipo_doc char(3)  NOT NULL,
    nro_doc int  NOT NULL,
    nombre_artistico varchar(50)  NOT NULL,
    nombre varchar(50)  NOT NULL,
    apellido varchar(50)  NOT NULL,
    instagram_oficial varchar(40)  NULL,
    CONSTRAINT AK_nombre_artistico UNIQUE (nombre_artistico) NOT DEFERRABLE  INITIALLY IMMEDIATE,
    CONSTRAINT PK_MODELO PRIMARY KEY (tipo_doc,nro_doc)
);

-- Table: PARTICIPA
CREATE TABLE PARTICIPA (
    id_evento int  NOT NULL,
    tipo_doc char(3)  NOT NULL,
    nro_doc int  NOT NULL,
    moneda varchar(20)  NOT NULL,
    monto int  NOT NULL,
    CONSTRAINT PK_PARTICIPA PRIMARY KEY (id_evento,tipo_doc,nro_doc)
);

-- foreign keys
-- Reference: FK_EVENTO_PRIV_EVENTO (table: EVENTO_PRIV)
ALTER TABLE EVENTO_PRIV ADD CONSTRAINT FK_EVENTO_PRIV_EVENTO
    FOREIGN KEY (id_evento)
    REFERENCES EVENTO (id_evento)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: FK_EVENTO_PUB_EVENTO (table: EVENTO_PUB)
ALTER TABLE EVENTO_PUB ADD CONSTRAINT FK_EVENTO_PUB_EVENTO
    FOREIGN KEY (id_evento)
    REFERENCES EVENTO (id_evento)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: FK_PARTICIPA_EVENTO (table: PARTICIPA)
ALTER TABLE PARTICIPA ADD CONSTRAINT FK_PARTICIPA_EVENTO
    FOREIGN KEY (id_evento)
    REFERENCES EVENTO (id_evento)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: FK_PARTICIPA_MODELO (table: PARTICIPA)
ALTER TABLE PARTICIPA ADD CONSTRAINT FK_PARTICIPA_MODELO
    FOREIGN KEY (tipo_doc, nro_doc)
    REFERENCES MODELO (tipo_doc, nro_doc)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

