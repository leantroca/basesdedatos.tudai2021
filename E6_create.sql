-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2021-05-17 13:38:46.457

-- tables
-- Table: ALQUILA
CREATE TABLE ALQUILA (
    tipo_doc char(3)  NOT NULL,
    nro_doc int  NOT NULL,
    id_oficina int  NOT NULL,
    fecha_desde date  NOT NULL,
    fecha_hasta date  NOT NULL,
    CONSTRAINT PK_ALQUILA PRIMARY KEY (tipo_doc,nro_doc,id_oficina)
);

-- Table: CLIENTE
CREATE TABLE CLIENTE (
    tipo_doc char(3)  NOT NULL,
    nro_doc int  NOT NULL,
    nombre varchar(50)  NOT NULL,
    apellido varchar(50)  NOT NULL,
    e_mail varchar(50)  NOT NULL,
    CONSTRAINT PK_CLIENTE PRIMARY KEY (tipo_doc,nro_doc)
);

-- Table: OFICINA
CREATE TABLE OFICINA (
    id_oficina int  NOT NULL,
    superficie int  NOT NULL,
    cant_max_personas int  NOT NULL,
    monto_alquiler decimal(10,2)  NOT NULL,
    tipo_o char(1)  NOT NULL,
    CONSTRAINT PK_OFICINA PRIMARY KEY (id_oficina)
);

-- Table: OFICINA_REG
CREATE TABLE OFICINA_REG (
    id_oficina int  NOT NULL,
    cant_escritorios int  NOT NULL,
    cant_pc int  NOT NULL,
    CONSTRAINT PK_OFICINA_REG PRIMARY KEY (id_oficina)
);

-- Table: SALA_CONVENCION
CREATE TABLE SALA_CONVENCION (
    id_oficina int  NOT NULL,
    cant_sillas int  NOT NULL,
    cant_pantallas int  NOT NULL,
    CONSTRAINT PK_SALA_CONVENCION PRIMARY KEY (id_oficina)
);

-- foreign keys
-- Reference: FK_ALQUILA_CLIENTE (table: ALQUILA)
ALTER TABLE ALQUILA ADD CONSTRAINT FK_ALQUILA_CLIENTE
    FOREIGN KEY (tipo_doc, nro_doc)
    REFERENCES CLIENTE (tipo_doc, nro_doc)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: FK_ALQUILA_OFICINA (table: ALQUILA)
ALTER TABLE ALQUILA ADD CONSTRAINT FK_ALQUILA_OFICINA
    FOREIGN KEY (id_oficina)
    REFERENCES OFICINA (id_oficina)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: FK_OFICINA_REG_OFICINA (table: OFICINA_REG)
ALTER TABLE OFICINA_REG ADD CONSTRAINT FK_OFICINA_REG_OFICINA
    FOREIGN KEY (id_oficina)
    REFERENCES OFICINA (id_oficina)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: FK_SALA_CONVENCION_OFICINA (table: SALA_CONVENCION)
ALTER TABLE SALA_CONVENCION ADD CONSTRAINT FK_SALA_CONVENCION_OFICINA
    FOREIGN KEY (id_oficina)
    REFERENCES OFICINA (id_oficina)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

