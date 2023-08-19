create database oficina;
-- drop database oficina;
use oficina;

create table customer(
	idCustomer int auto_increment primary key not null,
  firstName varchar(20) not null,
  lastName varchar(20),
  phone char(11) not null,
  email varchar(25),
  cpf char(11),
  birthdate Date,
  constraint unique_cpf_customer unique(cpf)
);

alter table customer auto_increment=1;

create table vehicle(
	idVehicle int auto_increment primary key not null,
  vCustomerID int not null,
  make varchar(45) not null,
  model varchar(45) not null,
  vyear char(4) not null,
  VIN char(17) not null,
  constraint fk_VehiCust_id foreign key (vCustomerID) references customer(idCustomer)
);

alter table vehicle auto_increment=1;

create table employee(
	idEmployee int auto_increment primary key not null,
  eName varchar(45) not null,
  jobTitle varchar(45) not null,
  salary float not null
);

alter table employee auto_increment=1;

create table service(
	idService int auto_increment primary key not null,
  serviceName varchar(45) not null,
  servDescription varchar(45) not null,
  servPrice float,
  assignedEpye int not null,
  constraint fk_assigndE_id foreign key (assignedEpye) references employee(idEmployee)
);
    
alter table service auto_increment=1;

create table appointment(
	idAppointment int auto_increment primary key not null,
  aCustomerID int not null,
  aVehicleID int not null,
  serviceID int not null,
  appointmentDate Date not null,
  appointmentTime Time not null,
  constraint fk_ACustm_id foreign key (aCustomerID) references customer(idCustomer),
  constraint fk_AVeh_id foreign key (aVehicleID) references vehicle(idVehicle),
  constraint fk_AServ_id foreign key (serviceID) references service(idService)
);

alter table appointment auto_increment=1;

create table parts(
	idParts int auto_increment primary key not null,
  vehPtId int not null,
  ptName varchar(45) not null,
  ptdescription varchar(45),
  ptPrice float not null,
  constraint fk_vehpt_id foreign key (vehptId) references appointment(aVehicleID)
);

alter table parts auto_increment=1;

create table supplier(
	idsupplier int auto_increment primary key not null,
  idpartS int not null,
  partDescription varchar(45),
  contact char(11),
  constraint fk_id_sup_part foreign key (idpartS) references parts(idParts)
);

alter table supplier auto_increment=1;