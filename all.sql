create type intensity as enum('minor', 'moderate', 'major');
create type order_status as enum('delivered', 'not_yet_placed', 'being_fulfilled');
create type prescription_type as enum('OTC', 'RPW', 'RPZ', 'RP');

create table medicine(
    medicine_id serial primary key,
    trade_name text not null,
    dosage text,
    pack_size text not null,
    contraindications text not null,
    recommendations text not null,
    prescription_type prescription_type not null
);

create table availability_in_warehouse(
    medicine_id int not null references medicine,
    quantity int not null
);

create table client(
    client_id serial primary key,
    firstname text not null,
    surname text not null
);

create table prescription(
    prescription_id serial primary key,
    expiration_date date not null,
    client_id int not null references client,
    prescription_type prescription_type not null
);

create table pharmacy(
    pharmacy_id serial primary key,
    pharmacy_name text not null
);

create table medicine_in_pharmacy(
    pharmacy_id int not null references pharmacy,
    medicine_id int not null references medicine,
    quantity int not null
);

create table prescribed_medicine(
    medicine_id int not null references medicine,
    prescription_id int not null references prescription,
    quantity int not null
);

create table active_substance(
    active_substance_id serial not null primary key,
    "name" text not null,
    international_name text not null,
    description text not null
);

create table substance_interaction(
    substance_one int not null references active_substance(active_substance_id),
    substance_two int not null references active_substance(active_substance_id),
    description text not null,
    intensity intensity not null
);

create table psychotropy_evidence(
    client_id int not null references client,
    active_substance_id int not null references active_substance,
    quantity int not null,
    dispensed_date date not null,
    pharmacy_id int not null references pharmacy
);

create table warehouse_order(
    warehouse_order_id serial not null primary key,
    pharmacy_id int not null references pharmacy,
    order_date date not null,
    order_status order_status not null
);

create table medicine_substance_map(
    active_substance_id int not null references active_substance,
    medicine_id int not null references medicine
);

create table warehouse_order_item(
    warehouse_order_id int not null references warehouse_order,
    quantity int not null,
    medicine_id int not null references medicine
);


insert into client(firstname, surname) values('Krystian', 'Lechowicz');  -- id 1
insert into client(firstname, surname) values('Lucjan', 'Kuk'); -- id 2
insert into client(firstname, surname) values('Jakub', 'Mazur'); -- id 3
insert into client(firstname, surname) values('Jan', 'Kozak'); -- id 4
insert into client(firstname, surname) values('Leszek', 'Nowicki'); -- id 5
insert into client(firstname, surname) values('Piotr', 'Kopeć'); -- id 6
insert into client(firstname, surname) values('Tadeusz', 'Papierok'); -- id 7
insert into client(firstname, surname) values('Łukasz', 'Dróżdż'); -- id 8
insert into client(firstname, surname) values('Stefan', 'Szymczyk'); -- id 9
insert into client(firstname, surname) values('Kajetan', 'Rapacki'); -- id 10
insert into client(firstname, surname) values('Antoni', 'Saja'); -- id 11
insert into client(firstname, surname) values('Eugeniusz', 'Sawicki'); -- id 12
insert into client(firstname, surname) values('Waldemar', 'Mielcarek'); -- id 13
insert into client(firstname, surname) values('Wiesław', 'Mężyński'); -- id 14
insert into client(firstname, surname) values('Serhii', 'Kureń'); -- id 15
insert into client(firstname, surname) values('Przemysław', 'Janas'); -- id 16
insert into client(firstname, surname) values('Tadeusz', 'Kozdra'); -- id 17
insert into client(firstname, surname) values('Krzysztof', 'Szewców'); -- id 18
insert into client(firstname, surname) values('Paweł', 'Sieradzki'); -- id 19
insert into client(firstname, surname) values('Andrzej', 'Nowak'); -- id 20
insert into client(firstname, surname) values('Robert', 'Fiedoruk'); -- id 21
insert into client(firstname, surname) values('Józef', 'Naus'); -- id 22
insert into client(firstname, surname) values('Henryk', 'Brzeźniak'); -- id 23
insert into client(firstname, surname) values('Jakub', 'Żurek'); -- id 24
insert into client(firstname, surname) values('Marek', 'Kaczor'); -- id 25
insert into client(firstname, surname) values('Stanisław', 'Kotarba'); -- id 26
insert into client(firstname, surname) values('Józef', 'Sipak'); -- id 27
insert into client(firstname, surname) values('Krzysztof', 'Michalski'); -- id 28
insert into client(firstname, surname) values('Piotr', 'Macioszczyk'); -- id 29
insert into client(firstname, surname) values('Stefan', 'Mencweld'); -- id 30
insert into client(firstname, surname) values('Piotr', 'Gwizdała'); -- id 31
insert into client(firstname, surname) values('Sylwester', 'Taisner'); -- id 32
insert into client(firstname, surname) values('Mikołaj', 'Owsiany'); -- id 33
insert into client(firstname, surname) values('Krzysztof', 'Kozikowski'); -- id 34
insert into client(firstname, surname) values('Henryk', 'Dzikoń'); -- id 35
insert into client(firstname, surname) values('Patryk', 'Kozicki'); -- id 36
insert into client(firstname, surname) values('Patryk', 'Deja'); -- id 37
insert into client(firstname, surname) values('Franciszek', 'Kobojek'); -- id 38
insert into client(firstname, surname) values('Adam', 'Kusa'); -- id 39
insert into client(firstname, surname) values('Stefan', 'Mrugowski'); -- id 40
insert into client(firstname, surname) values('Ihor', 'Chmura'); -- id 41
insert into client(firstname, surname) values('Andrzej', 'Ławrynowicz'); -- id 42
insert into client(firstname, surname) values('Krzysztof', 'Bejger'); -- id 43
insert into client(firstname, surname) values('Jakub', 'Palewski'); -- id 44
insert into client(firstname, surname) values('Piotr', 'Bechert'); -- id 45
insert into client(firstname, surname) values('Zbigniew', 'Dworakowski'); -- id 46
insert into client(firstname, surname) values('Sebastian', 'Baranowski'); -- id 47
insert into client(firstname, surname) values('Jerzy', 'Madej'); -- id 48
insert into client(firstname, surname) values('Wilhelm', 'Żyła'); -- id 49
insert into client(firstname, surname) values('Mariusz', 'Jakubiszak'); -- id 50
insert into client(firstname, surname) values('Artur', 'Bronowski'); -- id 51
insert into client(firstname, surname) values('Jan', 'Kossakowski'); -- id 52
insert into client(firstname, surname) values('Adam', 'Jagodziński'); -- id 53
insert into client(firstname, surname) values('Gustaw', 'Kurowski'); -- id 54
insert into client(firstname, surname) values('Grzegorz', 'Mateusiak'); -- id 55
insert into client(firstname, surname) values('Cezary', 'Maziarz'); -- id 56
insert into client(firstname, surname) values('Marek', 'Polit'); -- id 57
insert into client(firstname, surname) values('Henryk', 'Maciuk'); -- id 58
insert into client(firstname, surname) values('Alan', 'Wawrzynek'); -- id 59
insert into client(firstname, surname) values('Grzegorz', 'Skonieczny'); -- id 60
insert into client(firstname, surname) values('Jacek', 'Kurasz'); -- id 61
insert into client(firstname, surname) values('Władysław', 'Lendzion'); -- id 62
insert into client(firstname, surname) values('Mateusz', 'Stańczuk'); -- id 63
insert into client(firstname, surname) values('Sylwester', 'Błasiak'); -- id 64
insert into client(firstname, surname) values('Akaki', 'Baran'); -- id 65
insert into client(firstname, surname) values('Tadeusz', 'Grzegorzewski'); -- id 66
insert into client(firstname, surname) values('Kajetan', 'Ciesielski'); -- id 67
insert into client(firstname, surname) values('Mirosław', 'Wawoczny'); -- id 68
insert into client(firstname, surname) values('Radosław', 'Chrzanowski'); -- id 69
insert into client(firstname, surname) values('Jerzy', 'Szyngira'); -- id 70
insert into client(firstname, surname) values('Witold', 'Halo'); -- id 71
insert into client(firstname, surname) values('Jacek', 'Kowalski'); -- id 72
insert into client(firstname, surname) values('Szymon', 'Cymek'); -- id 73
insert into client(firstname, surname) values('Dawid', 'Głogowski'); -- id 74
insert into client(firstname, surname) values('Dominik', 'Mazurek'); -- id 75
insert into client(firstname, surname) values('Jakub', 'Gliwa'); -- id 76
insert into client(firstname, surname) values('Sławomir', 'Stankiewicz'); -- id 77
insert into client(firstname, surname) values('Adam', 'Piechowiak'); -- id 78
insert into client(firstname, surname) values('Aleksander', 'Cichowicz'); -- id 79
insert into client(firstname, surname) values('Radosław', 'Kulczyński'); -- id 80
insert into client(firstname, surname) values('Krzysztof', 'Mączka'); -- id 81
insert into client(firstname, surname) values('Jan', 'Leśniewski'); -- id 82
insert into client(firstname, surname) values('Kamil', 'Marszalik'); -- id 83
insert into client(firstname, surname) values('Dariusz', 'Pawliszak'); -- id 84
insert into client(firstname, surname) values('Krzysztof', 'Zhabotynskyi'); -- id 85
insert into client(firstname, surname) values('Eugeniusz', 'Domański'); -- id 86
insert into client(firstname, surname) values('Konrad', 'Jędrzejewski'); -- id 87
insert into client(firstname, surname) values('Kazimierz', 'Jachimczak'); -- id 88
insert into client(firstname, surname) values('Teodor', 'Titov'); -- id 89
insert into client(firstname, surname) values('Łukasz', 'Tomczak'); -- id 90
insert into client(firstname, surname) values('Janusz', 'Siuśta'); -- id 91
insert into client(firstname, surname) values('Jan', 'Łącz'); -- id 92
insert into client(firstname, surname) values('Roman', 'Masood'); -- id 93
insert into client(firstname, surname) values('Zygmunt', 'Taradejna'); -- id 94
insert into client(firstname, surname) values('Marcin', 'Bator'); -- id 95
insert into client(firstname, surname) values('Roman', 'Koryga'); -- id 96


insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Abaktal', 'Lz', '80 mg/ml', '10 amp. 5 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Abaktal', 'Rp', '400 mg', '10 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Abasaglar', 'Rp', '100 j./ml', '10 wkładów 3 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('ABE', 'OTC', '89 mg + 89 mg/g', '1 but. 8 g ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Abelcet', 'Lz', '5 mg/ml', '10 fiolek 20 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Abilify', 'Rp', '7,5 mg/ml', '1 fiolka 1,3 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Abilify', 'Rp', '15 mg', '28 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Abilify', 'Rp', '15 mg', '56 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Abilify', 'Rp', '30 mg', '56 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Abilify Maintena', 'Rp', '400 mg', '1 fiolka + 1 fiolka rozp. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Abrea', 'OTC', '75 mg', '90 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Absenor', 'Rp', '300 mg', '100 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Absenor', 'Rp', '500 mg', '100 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Acard 300 mg', 'OTC', '300 mg', '1 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Acard 300 mg', 'OTC', '300 mg', '10 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Acard', 'OTC', '75 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Acard', 'OTC', '75 mg', '60 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Acard', 'OTC', '75 mg', '120 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Acard 150 mg', 'OTC', '150 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Acard 150 mg', 'OTC', '150 mg', '60 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Acatar Acti-Tabs', 'OTC', '60 mg + 2,5 mg', '4 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Acatar Acti-Tabs', 'OTC', '60 mg + 2,5 mg', '12 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Acatar Allergy', 'OTC', '1 mg/ml', '1 but. 10 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Acatar Control', 'OTC', '0,5 mg/ml', '1 poj. 15 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Acatar Zatoki', 'OTC', '200 mg + 30 mg', '12 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('ACC classic', 'OTC', '20 mg/ml', '1 but. 100 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('ACC classic', 'OTC', '20 mg/ml', '1 but. 200 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('ACC Hot', 'OTC', '200 mg', '20 saszetek 3 g ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('ACC', 'OTC', '200 mg', '20 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('ACC', 'OTC', '200 mg', '20 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('ACC mini', 'OTC', '100 mg', '20 saszetek 3 g ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('ACC mini', 'OTC', '100 mg', '20 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Accofil', 'Rpz', '30 mln j.m. - 0,3 mg/0,5 ml', '1 amp.-strzyk. 0,5 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Accofil', 'Rpz', '30 mln j.m. - 0,3 mg/0,5 ml', '5 amp.-strzyk. 0,5 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Accofil', 'Rpz', '30 mln j.m. - 0,3 mg/0,5 ml', '7 amp.-strzyk. 0,5 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Accofil', 'Rpz', '48 mln j.m. - 0,48 mg/0,5 ml', '1 amp.-strzyk. 0,5 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Accofil', 'Rpz', '48 mln j.m. - 0,48 mg/0,5 ml', '5 amp.-strzyk. 0,5 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Accofil', 'Rpz', '48 mln j.m. - 0,48 mg/0,5 ml', '7 amp.-strzyk. 0,5 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('ACC optima Active', 'OTC', '600 mg', '10 saszetek ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('ACC optima Hot', 'OTC', '600 mg', '10 saszetek 3 g ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('ACC optima', 'OTC', '600 mg', '10 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Accordeon', 'Rpw', '5 mg', '100 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Accordeon', 'Rpw', '10 mg', '60 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Accordeon', 'Rpw', '10 mg', '100 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Accordeon', 'Rpw', '20 mg', '60 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Accordeon', 'Rpw', '20 mg', '100 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Accordeon', 'Rpw', '40 mg', '100 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Accordeon', 'Rpw', '80 mg', '100 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Accupro 5', 'Rp', '5 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Accupro 10', 'Rp', '10 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Accupro 20', 'Rp', '20 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Accupro 40', 'Rp', '40 mg', '28 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Acebutolol Aurovitas', 'Rp', '200 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Acebutolol Aurovitas', 'Rp', '400 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Acenocumarol WZF', 'Rp', '1 mg', '60 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Acenocumarol WZF', 'Rp', '4 mg', '60 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Acenol', 'OTC', '300 mg', '20 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Acenol Forte', 'OTC', '500 mg', '20 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Acerin', 'OTC', '195 mg + 98 mg/g', '1 op. 8 g ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Acesan', 'OTC', '30 mg', '63 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Acetylcysteine Sandoz', 'Rp', '100 mg/ml', '5 amp. 3 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Acetylcysteinum Flegamina', 'OTC', '600 mg', '10 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Aciclovir Jelfa', 'Lz', '250 mg', '5 fiolek ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Aciclovir Ziaja', 'OTC', '50 mg/g', '1 tuba 5 g ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Acidum folicum Hasco', 'Rp', '5 mg', ' Acidum folicum Hasco (Rp)', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Acidum folicum Richter', 'Rp', '5 mg', ' Acidum folicum Richter (Rp)', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Aciprex', 'Rp', '10 mg', '28 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Aciprex', 'Rp', '10 mg', '56 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Acitren', 'Rp', '10 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Acitren', 'Rp', '10 mg', '100 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Acitren', 'Rp', '25 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Acitren', 'Rp', '25 mg', '100 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Acix 500', 'Lz', '500 mg', '10 fiolek ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Aclasta', 'Rpz', '5 mg/100 ml', '1 but. 100 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Aclexa', 'Rp', '100 mg', '10 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Aclexa', 'Rp', '100 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Aclexa', 'Rp', '100 mg', '60 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Aclexa', 'Rp', '200 mg', '10 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Aclexa', 'Rp', '200 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Aclexa', 'Rp', '200 mg', '60 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Aclotin', 'Rp', '250 mg', '20 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Aclotin', 'Rp', '250 mg', '60 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Acnatac', 'Rp', '10 mg + 0,25 mg/g', '1 tuba 30 g ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Acnelec', 'Rp', '1 mg/g', '1 tuba 30 g ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Acnelec', 'Rp', '1 mg/g', '1 tuba 30 g ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Acodin Duo', 'OTC', '50 mg + 15 mg/5 ml', '1 but. 100 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Acodin', 'OTC', '15 mg', '10 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Acodin', 'OTC', '15 mg', '20 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Acodin 150 Junior', 'Rp', '50 mg + 7,5 mg/5 ml', '1 but. 100 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Actelsar HCT', 'Rp', '80 mg + 12,5 mg', '28 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Actelsar HCT', 'Rp', '80 mg + 25 mg', '28 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Actelsar', 'Rp', '40 mg', '28 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Actelsar', 'Rp', '80 mg', '28 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Actifed', 'OTC', '1,25 mg + 30 mg + 10 mg/5 ml', '1 but. 100 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Actiferol Fe 15 mg', 'Supl', '15 mg', '30 saszetek ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Actiferol Fe 30 mg', 'Supl', '30 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Actiferol Fe 30 mg', 'Supl', '30 mg', '30 saszetek ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Actiferol Fe 7 mg', 'Supl', '7 mg', '30 saszetek ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Actiferol Fe Krople', 'Supl', '2,5 mg/5 kropli', '1 but. 30 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Acti-trin', 'OTC', '1,25 mg + 30 mg + 10 mg/5 ml', '1 but. 100 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Activelle', 'Rp', '1 mg + 0,5 mg', '28 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Actrapid Penfill', 'Rp', '100 j.m./ml', '5 wkładów 3 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Actusept', 'OTC', '1,5 mg/ml', '1 but. 30 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Acular', 'Rp', '5 mg/ml', '1 but. 10 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Acurenal', 'Rp', '5 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Acurenal', 'Rp', '10 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Acurenal', 'Rp', '20 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Acurenal', 'Rp', '40 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Adablok', 'Rp', '5 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Adablok', 'Rp', '10 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Adadox', 'Rp', '2 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Adadox', 'Rp', '4 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Adadox', 'Rp', '4 mg', '90 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Adadut', 'Rp', '0,5 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Adalift', 'Rp', '5 mg', '28 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Adalift', 'Rp', '10 mg', '4 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Adalift', 'Rp', '20 mg', '2 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Adalift', 'Rp', '20 mg', '4 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Adamon SR 50', 'Rp', '50 mg', ' Adamon SR 100 (Rp)', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('', '100 mg', ' Adamon SR 150', 'Rp', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Adaring', 'Rp', '0,12 mg + 0,015 mg/24 h', '1 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Adaring', 'Rp', '0,12 mg + 0,015 mg/24 h', '3 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Adartrel', 'Rp', '0,25 mg', '12 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Adartrel', 'Rp', '0,5 mg', '28 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Adartrel', 'Rp', '2 mg', '28 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Adaster', 'Rp', '5 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Adaster', 'Rp', '5 mg', '90 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Adatam Duo', 'Rp', '0,5 mg + 0,4 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Adatam', 'Rp', '0,4 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Adatam', 'Rp', '0,4 mg', '90 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Adcetris', 'Rpz', '50 mg', '1 fiolka ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Adeksa', 'Rp', '50 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Adeksa', 'Rp', '100 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Adempas', 'Rpz', '0,5 mg', '42 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Adempas', 'Rpz', '1 mg', '42 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Adempas', 'Rpz', '1,5 mg', '42 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Adempas', 'Rpz', '2 mg', '42 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Adempas', 'Rpz', '2,5 mg', '42 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Adenocor', 'Lz', '3 mg/ml', '6 fiolek 2 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Adenuric', 'Rp', '80 mg', '28 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Adenuric', 'Rp', '120 mg', '28 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Adepend', 'Rp', '50 mg', '28 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Adipine', 'Rp', '5 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Adipine', 'Rp', '10 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Adproctin', 'OTC', '500 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Adrenalina Aguettant', 'Rp', '0,1 mg/ml', '10 amp.-strzyk. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Adrenalina WZF 0,1%', 'Rp', '1 mg/ml', '10 amp. 1 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Adrenalina WZF', 'Rp', '0,3 mg/0,3 ml', '1 amp.-strzyk. 1 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Advagraf', 'Rpz', '0,5 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Advagraf', 'Rpz', '1 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Advagraf', 'Rpz', '3 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Advagraf', 'Rpz', '5 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Advantan', 'Rp', '1 mg/g', '1 tuba 15 g ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Advantan', 'Rp', '1 mg/g', '1 tuba 15 g ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Advantan', 'Rp', '1 mg/g', '1 tuba 25 g ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Advantan', 'Rp', '1 mg/g', '1 tuba 30 g ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Advantan', 'Rp', '1 mg/g', '1 tuba 15 g ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Advantan', 'Rp', '1 mg/g', '1 tuba 25 g ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Advantan', 'Rp', '1 mg/g', '1 tuba 30 g ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Aerius', 'Rp', '0,5 mg/ml', '1 but. 60 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Aerius', 'Rp', '0,5 mg/ml', '1 but. 150 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Aerius', 'Rp', '5 mg', '10 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Aerius', 'Rp', '5 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Aescin', 'OTC', '20 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Aescin', 'OTC', '20 mg', '90 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Aescin', 'OTC', '20 mg + 50 mg + 50 j.m./g', '1 tuba 40 g ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Aesculan', 'OTC', '62,5 mg + 5 mg/g', '1 tuba 30 g ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Aethoxysklerol 0,5%', 'Rp', '5 mg/ml', '5 amp. 2 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Aethoxysklerol 1%', 'Rp', '10 mg/ml', '5 amp. 2 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Aethoxysklerol 2%', 'Rp', '20 mg/ml', '5 amp. 2 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Aethoxysklerol 3%', 'Rp', '30 mg/ml', '5 amp. 2 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Afastural', 'Rp', '3 g', '1 saszetka 8 g ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Afinitor', 'Rpz', '5 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Afinitor', 'Rpz', '10 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Aflavic Comfort', 'OTC', '600 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Aflavic Max', 'OTC', '1000 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Aflavic Max', 'OTC', '1000 mg', '60 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Aflegan', 'Rp', '7,5 mg/ml', '10 amp. 2 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Afloderm', 'Rp', '0,5 mg/g', '1 tuba 20 g ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Afloderm', 'Rp', '0,5 mg/g', '1 tuba 40 g ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Afloderm', 'Rp', '0,5 mg/g', '1 tuba 20 g ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Afloderm', 'Rp', '0,5 mg/g', '1 tuba 40 g ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Afobam', 'Rp', '0,25 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Afobam', 'Rp', '0,5 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Afobam', 'Rp', '1 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Afrin', 'OTC', '0,5 mg/ml', '1 but. 20 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Afrin ND', 'OTC', '0,5 mg/ml', '1 but. 15 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Agapurin', 'Rp', '100 mg', '60 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Agapurin SR 400', 'Rp', '400 mg', '20 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Agapurin SR 600', 'Rp', '600 mg', '20 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Agastin 20 mg', 'Rp', '20 mg', '28 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Agen 5', 'Rp', '5 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Agen 5', 'Rp', '5 mg', '60 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Agen 10', 'Rp', '10 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Agen 10', 'Rp', '10 mg', '60 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Aglan', 'Rp', '15 mg/1,5 ml', '5 amp. 1,5 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Aglan 15', 'Rp', '15 mg', '10 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Aglan 15', 'Rp', '15 mg', '20 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Aglan 15', 'Rp', '15 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Agolek', 'Rp', '25 mg', '28 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Agomelatine Adamed', 'Rp', '25 mg', '28 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Agomelatine G.L. Pharma', 'Rp', '25 mg', '28 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Agomelatine NeuroPharma', 'Rp', '25 mg', '28 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Agomelatine +pharma', 'Rp', '25 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Agomelatine +pharma', 'Rp', '25 mg', '90 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Agomelatyna Egis', 'Rp', '25 mg', '28 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Agregex', 'Rp', '75 mg', '28 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Agrypin', 'OTC', '325 mg + 30 mg + 10 mg', '10 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Aidee', 'Rp', '0,03 mg + 2 mg', '21 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Aimovig', 'Rpz', '70 mg/ml', '1 wstrzykiwacz 1 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Aimovig', 'Rpz', '140 mg/ml', '1 wstrzykiwacz 1 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Airbufo Forspiro', 'Rp', '160 µg + 4,5 µg/dawkę inh.', '60 dawek ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Airbufo Forspiro', 'Rp', '160 µg + 4,5 µg/dawkę inh.', '120 dawek ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('AirFluSal Forspiro', 'Rp', '250 µg + 50 µg/dawkę inh.', '60 dawek ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('AirFluSal Forspiro', 'Rp', '500 µg + 50 µg/dawkę inh.', '60 dawek ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Ajovy', 'Rpz', '225 mg', '1 amp.-strzyk. 1,5 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Akineton', 'Rp', '5 mg/ml', '5 amp. 1 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Akineton', 'Rp', '2 mg', '50 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Akineton SR 4 mg', 'Rp', '4 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Akistan Duo', 'Rp', '0,05 mg + 5 mg/ml', '1 but. 2,5 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Akistan Duo', 'Rp', '0,05 mg + 5 mg/ml', '3 but. 2,5 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Akistan', 'Rp', '0,05 mg/ml', '1 but. 2,5 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Akistan', 'Rp', '0,05 mg/ml', '3 but. 2,5 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Aklief', 'Rp', '50 µg/g', '1 poj. 30 g ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Aknemycin', 'Rp', '20 mg/g', '1 tuba 25 g ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Aknemycin', 'Rp', '20 mg/g', '1 but. 25 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Aknemycin Plus', 'Rp', '40 mg + 0,25 mg/g', '1 but. 25 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Aknenormin 10 mg', 'Rp', '10 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Aknenormin 10 mg', 'Rp', '10 mg', '60 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Aknenormin 10 mg', 'Rp', '10 mg', '90 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Aknenormin 20 mg', 'Rp', '20 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Aknenormin 20 mg', 'Rp', '20 mg', '60 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Aknenormin 20 mg', 'Rp', '20 mg', '90 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Aknenormin 20 mg', 'Rp', '20 mg', '100 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Akneroxid 5', 'OTC', '50 mg/g', '1 tuba 50 g ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Akneroxid 10', 'OTC', '100 mg/g', '1 tuba 50 g ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Aksobrex Unipharm', 'Supl', '250 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Aksobrex Unipharm Plus', 'Supl', '250 mg + 5 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Aksoderm forte', 'OTC', '1000 j.m./g', '1 tuba 10 g ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Aksoderm', 'OTC', '400 j.m./g', '1 tuba 30 g ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Akynzeo', 'Rp', '300 mg + 0,5 mg', '1 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Alacare', 'Rp', '8 mg', '4 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('ALAnerv', 'Supl', '300 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('ALAnerv ON', 'Supl', '300 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Alantan', 'OTC', '20 mg/g', '1 tuba 30 g ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Alantan Plus', 'OTC', '20 mg + 50 mg/g', '1 tuba 35 g ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Alantan Plus', 'OTC', '20 mg + 50 mg/g', '1 tuba 30 g ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Alantavit', 'OTC', '10 mg + 500 j.m. + 1000 j.m./g', '1 tuba 30 g ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('ALAproLipon', 'Supl', '300 mg', '36 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Alax', 'OTC', '35 mg + 42 mg', '20 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Albothyl', 'OTC', '90 mg', '6 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Alcaine', 'Rp', '5 mg/ml', '1 but. 15 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Alcep', 'OTC', '949 mg/5 ml', '1 but. 125 g ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Aldactone', 'Rp', '20 mg/ml', '10 amp. 10 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Aldan', 'Rp', '5 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Aldan', 'Rp', '10 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Aldara 5% Krem', 'Rp', '50 mg/g', '12 saszetek ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Aldurazyme', 'Rpz', '100 j./ml', '1 fiolka 5 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Alecensa', 'Rpz', '150 mg', '224 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Alendran 70', 'Rp', '70 mg', '4 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Alendrogen', 'Rp', '70 mg', '4 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Alendronat Bluefish', 'Rp', '70 mg', '4 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Alendronic Acid Genoptim', 'Rp', '70 mg', '4 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Alergimed', 'Rp', '5 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('AlergoTeva', 'OTC', '5 mg', '10 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Aleric Deslo Active', 'OTC', '0,5 mg/ml', '1 but. 60 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Aleric Deslo Active', 'OTC', '2,5 mg', '10 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Aleric Deslo Active', 'OTC', '5 mg', '10 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Aleric Spray', 'OTC', '50 µg/dawkę', '60 dawek ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Alermed', 'Rp', '10 mg', '20 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Alermed', 'Rp', '10 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Alerprof', 'Rp', '10 mg', '10 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Alerprof', 'Rp', '10 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Alerprof', 'Rp', '10 mg', '100 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Alerzina', 'OTC', '10 mg', '10 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Aleve', 'OTC', '220 mg', '12 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Aleve', 'OTC', '220 mg', '24 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Alexan', 'Lz', '20 mg/ml', '1 fiolka 5 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Alexan', 'Lz', '50 mg/ml', '1 fiolka 10 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Alexan', 'Lz', '50 mg/ml', '1 fiolka 20 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Alexan', 'Lz', '50 mg/ml', '1 fiolka 40 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Alfabax', 'Rp', '10 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Alfadiol', 'Rp', '0,25 µg', '100 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Alfadiol', 'Rp', '1 µg', '100 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Alfalipon prodiab', 'Supl', '350 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Alfurion', 'Rp', '10 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Alfuzostad 10 mg', 'Rp', '10 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Alitol', 'Supl', '270 mg', '48 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Alka-Seltzer', 'OTC', '324 mg', '10 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Alkeran', 'Rp', '2 mg', '25 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Allegra', 'OTC', '120 mg', '10 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Allegra Telfast 180', 'Rp', '180 mg', '20 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('AlleMax', 'OTC', '10 mg', '10 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Alleoptical', 'OTC', '20 mg/ml', '10 poj. 0,3 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Allergo-Comod', 'OTC', '20 mg/ml', '1 but. 10 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Allergocrom', 'OTC', '20 mg/ml', '1 but. 10 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Allergodil', 'OTC', '1 mg/ml', '1 but. 10 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Allergodil', 'OTC', '0,5 mg/ml', '1 but. 6 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Allertec Fexo', 'OTC', '120 mg', '10 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Allertec', 'Rp', '10 mg/ml', '1 but. 10 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Allertec', 'Rp', '10 mg/ml', '1 but. 20 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Allertec', 'Rp', '1 mg/ml', '1 but. 100 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Allertec', 'Rp', '10 mg', '20 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Allertec', 'Rp', '10 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Allertec WZF', 'OTC', '10 mg', '7 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Allertec WZF', 'OTC', '10 mg', '10 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Alliofil forte', 'Supl', '350 mg + 50 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Alliofil', 'OTC', '200 mg + 53,5 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Alliomint', 'OTC', '300 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Allupol', 'Rp', '100 mg', '50 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Allupol', 'Rp', '300 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Almiden', 'Rp', '5 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Almiden', 'Rp', '10 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Almozen', 'Rp', '12,5 mg', '3 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Almozen', 'Rp', '12,5 mg', '6 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Alneta', 'Rp', '5 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Alneta', 'Rp', '5 mg', '60 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Alneta', 'Rp', '10 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Alneta', 'Rp', '10 mg', '60 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Alocutan Forte', 'OTC', '50 mg/ml', '1 but. 60 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Alocutan', 'OTC', '20 mg/ml', '1 but. 60 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Alofisel', 'Rpz', '5 mln komórek/ml', '4 fiolki ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Alopexy', 'OTC', '50 mg/ml', '1 but. 60 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Alopexy', 'OTC', '50 mg/ml', '3 but. 60 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Alortia', 'Rp', '50 mg + 5 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Alortia', 'Rp', '50 mg + 5 mg', '60 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Alortia', 'Rp', '50 mg + 5 mg', '90 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Alortia', 'Rp', '50 mg + 10 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Alortia', 'Rp', '50 mg + 10 mg', '60 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Alortia', 'Rp', '50 mg + 10 mg', '90 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Alortia', 'Rp', '100 mg + 5 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Alortia', 'Rp', '100 mg + 10 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Aloxi', 'Rp', '0,5 mg', '1 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Aloxi', 'Rp', '0,25 mg/5 ml', '1 fiolka 5 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Alphagan', 'Rp', '2 mg/ml', '1 but. 5 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Alpicort E', 'Rp', '2 mg + 0,05 mg + 4 mg/ml', '1 but. 100 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Alpicort', 'Rp', '2 mg + 4 mg/ml', '1 but. 100 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Alpragen', 'Rp', '0,25 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Alpragen', 'Rp', '0,5 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Alpragen', 'Rp', '1 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Alprazolam Aurovitas', 'Rp', '0,25 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Alprazolam Aurovitas', 'Rp', '0,5 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Alprazolam Aurovitas', 'Rp', '1 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Alprox', 'Rp', '0,25 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Alprox', 'Rp', '0,5 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Alprox', 'Rp', '1 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Altabactin', 'OTC', '250 j.m. + 5 mg/g', '1 tuba 5 g ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Altabactin', 'OTC', '250 j.m. + 5 mg/g', '1 tuba 20 g ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Altacet', 'OTC', '1000 mg', '6 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Altacet', 'OTC', '10 mg/g', '1 tuba 75 g ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Altażel Oceanic', 'OTC', '10 mg/g', '1 tuba 75 g ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Altaziaja', 'OTC', '10 mg/g', '1 tuba 75 g ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Alti-sir', 'OTC', '2,17 g/5 ml', '1 but. 125 g ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Alugastrin', 'OTC', '340 mg', '20 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Alugastrin', 'OTC', '340 mg', '40 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Alugastrin', 'OTC', '340 mg/5 ml', '1 but. 250 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Alugen 10 mg', 'Rp', '10 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Alunbrig', 'Rpz', '30 mg', '28 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Alunbrig', 'Rpz', '90 mg', '7 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Alunbrig', 'Rpz', '90 mg', '28 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Alunbrig', 'Rpz', '180 mg', '28 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Alventa', 'Rp', '37,5 mg', '28 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Alventa', 'Rp', '75 mg', '28 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Alventa', 'Rp', '75 mg', '60 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Alventa', 'Rp', '150 mg', '28 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Alventa', 'Rp', '150 mg', '60 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Alvesco 80', 'Rp', '80 µg/dawkę inh.', '60 dawek ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Alvesco 80', 'Rp', '80 µg/dawkę inh.', '120 dawek ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Alvesco 160', 'Rp', '160 µg/dawkę inh.', '60 dawek ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Alvesco 160', 'Rp', '160 µg/dawkę inh.', '120 dawek ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Amantix', 'Rp', '200 mg/500 ml', '10 but. 500 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Amantix', 'Rp', '100 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Amantix', 'Rp', '100 mg', '100 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Amarin', 'Supl', '300 mg + 0,5 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Amaryl 1', 'Rp', '1 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Amaryl 2', 'Rp', '2 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Amaryl 3', 'Rp', '3 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Amaryl 4', 'Rp', '4 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('AmBisome liposomal', 'Rp', '50 mg', '1 fiolka + filtr membranowy ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('AmbroHexal', 'Rp', '7,5 mg/ml', '5 amp. 2 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Ambroksol Hasco', 'OTC', '30 mg/5 ml', '1 but. 150 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Ambroksol Hasco Junior', 'OTC', '15 mg/5 ml', '1 but. 150 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Ambroksol Hasco Max', 'OTC', '60 mg', '15 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Ambroksol Takeda', 'OTC', '30 mg/5 ml', '1 but. 150 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Ambrolytin', 'OTC', '15 mg/5 ml', '1 but. 100 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Ambrosol Teva', 'OTC', '15 mg/5 ml', '1 but. 120 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Ambrosol Teva', 'OTC', '15 mg/5 ml', '1 but. 200 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Ambrosol Teva', 'OTC', '30 mg/5 ml', '1 but. 120 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Ambrosol Teva', 'OTC', '30 mg/5 ml', '1 but. 200 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Ambroxol Dr. Max', 'OTC', '15 mg/5 ml', '1 but. 100 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Ambroxol Dr. Max', 'OTC', '30 mg/5 ml', '1 but. 100 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Amertil Bio', 'OTC', '10 mg', '7 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Amertil Bio', 'OTC', '10 mg', '10 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Amertil', 'Rp', '10 mg', '20 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Amertil', 'Rp', '10 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Amertil', 'Rp', '10 mg', '60 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Amgevita', 'Rpz', '20 mg/0,4 ml', '1 amp.-strzyk. 0,4 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Amgevita', 'Rpz', '40 mg/0,8 ml', '2 amp.-strzyk. 0,8 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Amgevita', 'Rpz', '40 mg/0,8 ml', '6 amp.-strzyk. 0,8 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Amgevita', 'Rpz', '40 mg/0,8 ml', '2 wstrzykiwacze 0,8 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Amgevita', 'Rpz', '40 mg/0,8 ml', '6 wstrzykiwaczy 0,8 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Amikacin Adamed', 'Lz', '500 mg/2 ml', '1 fiolka 2 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Amikacin B. Braun', 'Rp', '250 mg/100 ml', '10 but. 100 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Amikacin B. Braun', 'Rp', '500 mg/100 ml', '10 but. 100 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Amikacin B. Braun', 'Rp', '1000 mg/100 ml', '10 but. 100 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Amiodaron Hameln', 'Lz', '50 mg/ml', '10 amp. 3 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Amiokordin', 'Lz', '50 mg/ml', '5 amp. 3 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Amipryd', 'Rp', '100 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Amipryd', 'Rp', '200 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Amipryd', 'Rp', '400 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Amisan', 'Rp', '50 mg', '60 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Amisan', 'Rp', '200 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Amisan', 'Rp', '200 mg', '60 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Amisan', 'Rp', '400 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Amisan', 'Rp', '400 mg', '60 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Amitriptylinum VP', 'Rp', '10 mg', '60 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Amitriptylinum VP', 'Rp', '25 mg', '60 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Amizepin', 'Rp', '200 mg', '50 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Amlator', 'Rp', '10 mg + 5 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Amlator', 'Rp', '10 mg + 10 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Amlator', 'Rp', '20 mg + 5 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Amlator', 'Rp', '20 mg + 10 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Amlessa', 'Rp', '4 mg + 5 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Amlessa', 'Rp', '4 mg + 5 mg', '90 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Amlessa', 'Rp', '4 mg + 10 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Amlessa', 'Rp', '4 mg + 10 mg', '90 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Amlessa', 'Rp', '8 mg + 5 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Amlessa', 'Rp', '8 mg + 5 mg', '90 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Amlessa', 'Rp', '8 mg + 10 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Amlessa', 'Rp', '8 mg + 10 mg', '90 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Amlessini', 'Rp', '5,7 mg + 5 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Amlodipine Apotex', 'Rp', '5 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Amlodipine Apotex', 'Rp', '10 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Amlodipine Aurobindo', 'Rp', '5 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Amlodipine Aurobindo', 'Rp', '10 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Amlodipine Aurovitas', 'Rp', '5 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Amlodipine Aurovitas', 'Rp', '10 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Amlodipine Bluefish', 'Rp', '5 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Amlodipine Bluefish', 'Rp', '10 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Amlodipine Orion', 'Rp', '5 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Amlodipine Orion', 'Rp', '10 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Amlodipine Vitabalans', 'Rp', '5 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Amlodipine Vitabalans', 'Rp', '10 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Amlomyl', 'Rp', '5 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Amlomyl', 'Rp', '10 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Amlonor', 'Rp', '5 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Amlonor', 'Rp', '10 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Amlopin 5 mg', 'Rp', '5 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Amlopin 10 mg', 'Rp', '10 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Amlozek', 'Rp', '5 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Amlozek', 'Rp', '10 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Ammonaps', 'Rpz', '940 mg/g', '266 g ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Ammonaps', 'Rpz', '500 mg', '250 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Amoksiklav', 'Rp', '500 mg + 125 mg', '14 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Amoksiklav', 'Rp', '500 mg + 125 mg', '21 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Amoksiklav', 'Rp', '875 mg + 125 mg', '14 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Amoksiklav', 'Rp', '875 mg + 125 mg', '20 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Amoksiklav', 'Rp', '400 mg + 57 mg/5 ml', '1 but. 35 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Amoksiklav', 'Rp', '400 mg + 57 mg/5 ml', '1 but. 70 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Amoksiklav', 'Rp', '400 mg + 57 mg/5 ml', '1 but. 140 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Amoksiklav', 'Rp', '875 mg + 125 mg', '14 saszetek ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Amoksiklav', 'Rp', '500 mg + 100 mg', '5 fiolek ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Amoksiklav', 'Rp', '1000 mg + 200 mg', '5 fiolek ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Amoksiklav Quicktab 625 mg', 'Rp', '500 mg + 125 mg', '14 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Amoksiklav Quicktab 1000 mg', 'Rp', '875 mg + 125 mg', '14 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Amorolak', 'OTC', '50 mg/ml', '1 but. 3 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Amotaks Dis', 'Rp', '500 mg', ' Amotaks Dis (Rp)', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('', '500 mg', ' Amotaks Dis', 'Rp', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Amotaks Dis', 'Rp', '750 mg', ' Amotaks Dis (Rp)', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('', '1000 mg', ' Amotaks Dis', 'Rp', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Amotaks', 'Rp', '500 mg', ' Amotaks (Rp)', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('', '500 mg', ' Amotaks', 'Rp', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Amotaks', 'Rp', '1000 mg', ' Amotaks (Rp)', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('', '500 mg/5 ml', ' Amotaks', 'Rp', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Amoxicillin Aurovitas', 'Rp', '750 mg', ' Amoxicillin Aurovitas (Rp)', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Amoxicillin + Clavulanic Acid Aurovitas', 'Rp', '875 mg + 125 mg', '14 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Ampicillin TZF', 'Rp', '500 mg', '1 fiolka ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Ampicillin TZF', 'Rp', '1000 mg', '1 fiolka ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Ampicillin TZF', 'Rp', '2000 mg', '1 fiolka ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Ampres', 'Rp', '10 mg/ml', '10 amp. 5 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Ampril HD', 'Rp', '5 mg + 25 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Ampril HL', 'Rp', '2,5 mg + 12,5 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Ampril 2,5 mg', 'Rp', '2,5 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Ampril 5 mg', 'Rp', '5 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Ampril 5 mg', 'Rp', '5 mg', '60 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Ampril 10 mg', 'Rp', '10 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Ampril 10 mg', 'Rp', '10 mg', '60 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Amylan', 'Rp', '500 mg + 125 mg', '14 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Amylan', 'Rp', '875 mg + 125 mg', '14 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Anacard medica protect', 'OTC', '75 mg', '60 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Anafranil', 'Rp', '10 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Anafranil', 'Rp', '25 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Anafranil SR 75', 'Rp', '75 mg', '20 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Anagrelid Aurovitas', 'Rpz', '0,5 mg', '100 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Anagrelide Accord', 'Rpz', '0,5 mg', '100 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Anagrelide Accord', 'Rpz', '1 mg', '100 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Anagrelide Bioton', 'Rpz', '0,5 mg', '100 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Anagrelide Glenmark', 'Rpz', '0,5 mg', '100 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Anagrelide Mylan', 'Rpz', '0,5 mg', '100 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Anagrelide Ranbaxy', 'Rpz', '0,5 mg', '100 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Anagrelide Sandoz', 'Rpz', '0,5 mg', '100 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Anagrelide Stada', 'Rpz', '0,5 mg', '100 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Anagrelide Vipharm', 'Rpz', '0,5 mg', '100 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Anagrelide Vipharm', 'Rpz', '1 mg', '100 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Anagrelide Zentiva', 'Rpz', '0,5 mg', '100 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Anapran', 'Rp', '275 mg', '20 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Anapran', 'Rp', '275 mg', '60 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Anapran', 'Rp', '550 mg', '20 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Anapran', 'Rp', '550 mg', '60 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Anapran EC', 'Rp', '250 mg', '20 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Anapran EC', 'Rp', '250 mg', '60 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Anapran EC', 'Rp', '500 mg', '20 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Anapran EC', 'Rp', '500 mg', '60 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Anastrozol Bluefish', 'Rp', '1 mg', '28 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Anastrozol Teva', 'Rp', '1 mg', '28 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Ancotil', 'Lz', '10 mg/ml', '5 but. 250 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Andepin', 'Rp', '20 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Androcur', 'Rp', '50 mg', '20 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Androcur', 'Rp', '50 mg', '50 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Androstatin', 'Rp', '1 mg', '28 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Androster', 'Rp', '5 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Androster', 'Rp', '5 mg', '90 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Androtop', 'Rp', '50 mg/5 g', '30 saszetek 5 g ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Androtop', 'Rp', '16,2 mg/g', '1 poj. 88 g ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Anesderm', 'Rp', '25 mg + 25 mg/g', ' Anesderm (Rp)', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Anesteloc', 'Rp', '20 mg', '28 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Anesteloc', 'Rp', '20 mg', '56 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Anesteloc', 'Rp', '40 mg', '28 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Anesteloc', 'Rp', '40 mg', '56 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Anesteloc Max', 'OTC', '20 mg', '7 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Anesteloc Max', 'OTC', '20 mg', '14 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Angeliq', 'Rp', '1 mg + 2 mg', '28 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Angiletta', 'Rp', '0,03 mg + 2 mg', '21 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Angiletta', 'Rp', '0,03 mg + 2 mg', '3 x 21 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Anidulafungina Accord', 'Rpz', '100 mg', '1 fiolka ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Anidulafungin Sandoz', 'Rpz', '100 mg', '1 fiolka ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Anoro Ellipta', 'Rp', '55 µg + 22 µg', '30 dawek ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Anticol', 'Rp', '500 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Antidol 15', 'OTC', '500 mg + 15 mg', '10 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Antidral', 'OTC', '100 mg/g', '1 but. 50 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Antinervinum', 'OTC', '1032 mg + 903 mg + 645 mg/5 ml', '1 but. 200 g ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Antiprost', 'Rp', '5 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('AntyGrypin dzień', 'OTC', '500 mg + 150 mg + 50 mg', '10 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('AntyGrypin noc', 'OTC', '500 mg + 200 mg + 4 mg', '10 saszetek ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('AntyGrypin noc', 'OTC', '500 mg + 200 mg + 4 mg', '10 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Antypot', 'OTC', '10 mg + 100 mg/g', '1 op. 30 g ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Anzorin', 'Rp', '5 mg', '28 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Anzorin', 'Rp', '10 mg', '28 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Anzorin', 'Rp', '15 mg', '28 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Anzorin', 'Rp', '20 mg', '28 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Apap ból i gorączka C Plus', 'OTC', '500 mg + 300 mg', '10 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Apap Caps', 'OTC', '500 mg', '10 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Apap dla dzieci Forte', 'OTC', '200 mg/5 ml', '1 but. 85 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Apap Extra', 'OTC', '500 mg + 65 mg', '6 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Apap Extra', 'OTC', '500 mg + 65 mg', '10 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Apap Extra', 'OTC', '500 mg + 65 mg', '24 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Apap Extra', 'OTC', '500 mg + 65 mg', '50 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Apap', 'OTC', '500 mg', '2 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Apap', 'OTC', '500 mg', '6 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Apap', 'OTC', '500 mg', '12 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Apap', 'OTC', '500 mg', '24 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Apap', 'OTC', '500 mg', '50 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Apap', 'OTC', '500 mg', '100 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Apap intense', 'OTC', '200 mg + 500 mg', '10 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Apap Junior', 'OTC', '250 mg', '10 saszetek ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Apap Noc', 'OTC', '500 mg + 25 mg', '6 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Apap Noc', 'OTC', '500 mg + 25 mg', '12 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Apap Noc', 'OTC', '500 mg + 25 mg', '24 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Apap Noc', 'OTC', '500 mg + 25 mg', '50 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Apap Przeziębienie', 'OTC', '650 mg + 50 mg + 10 mg', '8 saszetek ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Apap Przeziębienie Junior', 'OTC', '300 mg + 20 mg + 5 mg', '6 saszetek ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Aparxon PR', 'Rp', '2 mg', '28 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Aparxon PR', 'Rp', '4 mg', '28 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Aparxon PR', 'Rp', '8 mg', '28 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Aperisan', 'OTC', '200 mg/g', '1 tuba 10 g ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Aphtin Aflofarm', 'OTC', '200 mg/g', '1 but. 10 g ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Aphtin', 'OTC', '200 mg/g', '1 but. 10 g ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Aphtin', 'OTC', '200 mg/g', '1 but. 10 g ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Aphtin', 'OTC', '200 mg/g', '1 op. 10 g ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Aphtin', 'OTC', '200 mg/g', '1 poj. 10 g ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Apiclar', 'Rp', '250 mg', '14 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Apiclar', 'Rp', '500 mg', '14 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Apidra', 'Rp', '100 j./ml', '1 fiolka 10 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Apidra', 'Rp', '100 j./ml', '5 wkładów 3 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Apidra SoloStar', 'Rp', '100 j./ml', '5 wstrzykiwaczy 3 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Apiprax', 'Rp', '15 mg', '28 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Apipulmol', 'OTC', '2 g + 0,09 g/100 g', '1 but. 120 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Apitussic', 'OTC', '52 mg/5 ml', '1 but. 120 ml ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Apo-Atorva', 'Rp', '10 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Apo-Atorva', 'Rp', '20 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Apo-Atorva', 'Rp', '30 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Apo-Atorva', 'Rp', '30 mg', '60 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Apo-Atorva', 'Rp', '40 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('ApoBetina', 'Rp', '8 mg', '100 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('ApoBetina', 'Rp', '16 mg', '60 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('ApoBetina', 'Rp', '24 mg', '60 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Apo-Clodin', 'Rp', '250 mg', '30 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('Apo-Clodin', 'Rp', '250 mg', '60 szt. ', '', '')
insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values('ApoD3', 'Supl', '1000 j.m.', '60 szt. ', '', '')
