begin;

create type intensity as enum('minor', 'moderate', 'major');
create type order_status as enum('delivered', 'not_yet_placed', 'being_fulfilled');
create type prescription_type as enum('OTC', 'Rpw', 'Rpz', 'Rp');

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


insert into client(firstname, surname) values
    ('Krystian', 'Lechowicz'),  -- id 1
    ('Lucjan', 'Kuk'), -- id 2
    ('Jakub', 'Mazur'), -- id 3
    ('Jan', 'Kozak'), -- id 4
    ('Leszek', 'Nowicki'), -- id 5
    ('Piotr', 'Kopeć'), -- id 6
    ('Tadeusz', 'Papierok'), -- id 7
    ('Łukasz', 'Dróżdż'), -- id 8
    ('Stefan', 'Szymczyk'), -- id 9
    ('Kajetan', 'Rapacki'), -- id 10
    ('Antoni', 'Saja'), -- id 11
    ('Eugeniusz', 'Sawicki'), -- id 12
    ('Waldemar', 'Mielcarek'), -- id 13
    ('Wiesław', 'Mężyński'), -- id 14
    ('Serhii', 'Kureń'), -- id 15
    ('Przemysław', 'Janas'), -- id 16
    ('Tadeusz', 'Kozdra'), -- id 17
    ('Krzysztof', 'Szewców'), -- id 18
    ('Paweł', 'Sieradzki'), -- id 19
    ('Andrzej', 'Nowak'), -- id 20
    ('Robert', 'Fiedoruk'), -- id 21
    ('Józef', 'Naus'), -- id 22
    ('Henryk', 'Brzeźniak'), -- id 23
    ('Jakub', 'Żurek'), -- id 24
    ('Marek', 'Kaczor'), -- id 25
    ('Stanisław', 'Kotarba'), -- id 26
    ('Józef', 'Sipak'), -- id 27
    ('Krzysztof', 'Michalski'), -- id 28
    ('Piotr', 'Macioszczyk'), -- id 29
    ('Stefan', 'Mencweld'), -- id 30
    ('Piotr', 'Gwizdała'), -- id 31
    ('Sylwester', 'Taisner'), -- id 32
    ('Mikołaj', 'Owsiany'), -- id 33
    ('Krzysztof', 'Kozikowski'), -- id 34
    ('Henryk', 'Dzikoń'), -- id 35
    ('Patryk', 'Kozicki'), -- id 36
    ('Patryk', 'Deja'), -- id 37
    ('Franciszek', 'Kobojek'), -- id 38
    ('Adam', 'Kusa'), -- id 39
    ('Stefan', 'Mrugowski'), -- id 40
    ('Ihor', 'Chmura'), -- id 41
    ('Andrzej', 'Ławrynowicz'), -- id 42
    ('Krzysztof', 'Bejger'), -- id 43
    ('Jakub', 'Palewski'), -- id 44
    ('Piotr', 'Bechert'), -- id 45
    ('Zbigniew', 'Dworakowski'), -- id 46
    ('Sebastian', 'Baranowski'), -- id 47
    ('Jerzy', 'Madej'), -- id 48
    ('Wilhelm', 'Żyła'), -- id 49
    ('Mariusz', 'Jakubiszak'), -- id 50
    ('Artur', 'Bronowski'), -- id 51
    ('Jan', 'Kossakowski'), -- id 52
    ('Adam', 'Jagodziński'), -- id 53
    ('Gustaw', 'Kurowski'), -- id 54
    ('Grzegorz', 'Mateusiak'), -- id 55
    ('Cezary', 'Maziarz'), -- id 56
    ('Marek', 'Polit'), -- id 57
    ('Henryk', 'Maciuk'), -- id 58
    ('Alan', 'Wawrzynek'), -- id 59
    ('Grzegorz', 'Skonieczny'), -- id 60
    ('Jacek', 'Kurasz'), -- id 61
    ('Władysław', 'Lendzion'), -- id 62
    ('Mateusz', 'Stańczuk'), -- id 63
    ('Sylwester', 'Błasiak'), -- id 64
    ('Akaki', 'Baran'), -- id 65
    ('Tadeusz', 'Grzegorzewski'), -- id 66
    ('Kajetan', 'Ciesielski'), -- id 67
    ('Mirosław', 'Wawoczny'), -- id 68
    ('Radosław', 'Chrzanowski'), -- id 69
    ('Jerzy', 'Szyngira'), -- id 70
    ('Witold', 'Halo'), -- id 71
    ('Jacek', 'Kowalski'), -- id 72
    ('Szymon', 'Cymek'), -- id 73
    ('Dawid', 'Głogowski'), -- id 74
    ('Dominik', 'Mazurek'), -- id 75
    ('Jakub', 'Gliwa'), -- id 76
    ('Sławomir', 'Stankiewicz'), -- id 77
    ('Adam', 'Piechowiak'), -- id 78
    ('Aleksander', 'Cichowicz'), -- id 79
    ('Radosław', 'Kulczyński'), -- id 80
    ('Krzysztof', 'Mączka'), -- id 81
    ('Jan', 'Leśniewski'), -- id 82
    ('Kamil', 'Marszalik'), -- id 83
    ('Dariusz', 'Pawliszak'), -- id 84
    ('Krzysztof', 'Zhabotynskyi'), -- id 85
    ('Eugeniusz', 'Domański'), -- id 86
    ('Konrad', 'Jędrzejewski'), -- id 87
    ('Kazimierz', 'Jachimczak'), -- id 88
    ('Teodor', 'Titov'), -- id 89
    ('Łukasz', 'Tomczak'), -- id 90
    ('Janusz', 'Siuśta'), -- id 91
    ('Jan', 'Łącz'), -- id 92
    ('Roman', 'Masood'), -- id 93
    ('Zygmunt', 'Taradejna'), -- id 94
    ('Marcin', 'Bator'), -- id 95
    ('Roman', 'Koryga'); -- id 96

insert into medicine(trade_name, prescription_type, dosage, pack_size, contraindications, recommendations) values
    ('Abaktal', 'Rp', '400 mg', '10 szt. ', '', ''),
    ('Abasaglar', 'Rp', '100 j./ml', '10 wkładów 3 ml ', '', ''),
    ('ABE', 'OTC', '89 mg + 89 mg/g', '1 but. 8 g ', '', ''),
    ('Abilify', 'Rp', '7,5 mg/ml', '1 fiolka 1,3 ml ', '', ''),
    ('Abilify', 'Rp', '15 mg', '28 szt. ', '', ''),
    ('Abilify', 'Rp', '15 mg', '56 szt. ', '', ''),
    ('Abilify', 'Rp', '30 mg', '56 szt. ', '', ''),
    ('Abilify Maintena', 'Rp', '400 mg', '1 fiolka + 1 fiolka rozp. ', '', ''),
    ('Abrea', 'OTC', '75 mg', '90 szt. ', '', ''),
    ('Absenor', 'Rp', '300 mg', '100 szt. ', '', ''),
    ('Absenor', 'Rp', '500 mg', '100 szt. ', '', ''),
    ('Acard 300 mg', 'OTC', '300 mg', '1 szt. ', '', ''),
    ('Acard 300 mg', 'OTC', '300 mg', '10 szt. ', '', ''),
    ('Acard', 'OTC', '75 mg', '30 szt. ', '', ''),
    ('Acard', 'OTC', '75 mg', '60 szt. ', '', ''),
    ('Acard', 'OTC', '75 mg', '120 szt. ', '', ''),
    ('Acard 150 mg', 'OTC', '150 mg', '30 szt. ', '', ''),
    ('Acard 150 mg', 'OTC', '150 mg', '60 szt. ', '', ''),
    ('Acatar Acti-Tabs', 'OTC', '60 mg + 2,5 mg', '4 szt. ', '', ''),
    ('Acatar Acti-Tabs', 'OTC', '60 mg + 2,5 mg', '12 szt. ', '', ''),
    ('Acatar Allergy', 'OTC', '1 mg/ml', '1 but. 10 ml ', '', ''),
    ('Acatar Control', 'OTC', '0,5 mg/ml', '1 poj. 15 ml ', '', ''),
    ('Acatar Zatoki', 'OTC', '200 mg + 30 mg', '12 szt. ', '', ''),
    ('ACC classic', 'OTC', '20 mg/ml', '1 but. 100 ml ', '', ''),
    ('ACC classic', 'OTC', '20 mg/ml', '1 but. 200 ml ', '', ''),
    ('ACC Hot', 'OTC', '200 mg', '20 saszetek 3 g ', '', ''),
    ('ACC', 'OTC', '200 mg', '20 szt. ', '', ''),
    ('ACC', 'OTC', '200 mg', '20 szt. ', '', ''),
    ('ACC mini', 'OTC', '100 mg', '20 saszetek 3 g ', '', ''),
    ('ACC mini', 'OTC', '100 mg', '20 szt. ', '', ''),
    ('Accofil', 'Rpz', '30 mln j.m. - 0,3 mg/0,5 ml', '1 amp.-strzyk. 0,5 ml ', '', ''),
    ('Accofil', 'Rpz', '30 mln j.m. - 0,3 mg/0,5 ml', '5 amp.-strzyk. 0,5 ml ', '', ''),
    ('Accofil', 'Rpz', '30 mln j.m. - 0,3 mg/0,5 ml', '7 amp.-strzyk. 0,5 ml ', '', ''),
    ('Accofil', 'Rpz', '48 mln j.m. - 0,48 mg/0,5 ml', '1 amp.-strzyk. 0,5 ml ', '', ''),
    ('Accofil', 'Rpz', '48 mln j.m. - 0,48 mg/0,5 ml', '5 amp.-strzyk. 0,5 ml ', '', ''),
    ('Accofil', 'Rpz', '48 mln j.m. - 0,48 mg/0,5 ml', '7 amp.-strzyk. 0,5 ml ', '', ''),
    ('ACC optima Active', 'OTC', '600 mg', '10 saszetek ', '', ''),
    ('ACC optima Hot', 'OTC', '600 mg', '10 saszetek 3 g ', '', ''),
    ('ACC optima', 'OTC', '600 mg', '10 szt. ', '', ''),
    ('Accordeon', 'Rpw', '5 mg', '100 szt. ', '', ''),
    ('Accordeon', 'Rpw', '10 mg', '60 szt. ', '', ''),
    ('Accordeon', 'Rpw', '10 mg', '100 szt. ', '', ''),
    ('Accordeon', 'Rpw', '20 mg', '60 szt. ', '', ''),
    ('Accordeon', 'Rpw', '20 mg', '100 szt. ', '', ''),
    ('Accordeon', 'Rpw', '40 mg', '100 szt. ', '', ''),
    ('Accordeon', 'Rpw', '80 mg', '100 szt. ', '', ''),
    ('Accupro 5', 'Rp', '5 mg', '30 szt. ', '', ''),
    ('Accupro 10', 'Rp', '10 mg', '30 szt. ', '', ''),
    ('Accupro 20', 'Rp', '20 mg', '30 szt. ', '', ''),
    ('Accupro 40', 'Rp', '40 mg', '28 szt. ', '', ''),
    ('Acebutolol Aurovitas', 'Rp', '200 mg', '30 szt. ', '', ''),
    ('Acebutolol Aurovitas', 'Rp', '400 mg', '30 szt. ', '', ''),
    ('Acenocumarol WZF', 'Rp', '1 mg', '60 szt. ', '', ''),
    ('Acenocumarol WZF', 'Rp', '4 mg', '60 szt. ', '', ''),
    ('Acenol', 'OTC', '300 mg', '20 szt. ', '', ''),
    ('Acenol Forte', 'OTC', '500 mg', '20 szt. ', '', ''),
    ('Acerin', 'OTC', '195 mg + 98 mg/g', '1 op. 8 g ', '', ''),
    ('Acesan', 'OTC', '30 mg', '63 szt. ', '', ''),
    ('Acetylcysteine Sandoz', 'Rp', '100 mg/ml', '5 amp. 3 ml ', '', ''),
    ('Acetylcysteinum Flegamina', 'OTC', '600 mg', '10 szt. ', '', ''),
    ('Aciclovir Ziaja', 'OTC', '50 mg/g', '1 tuba 5 g ', '', ''),
    ('Acidum folicum Hasco', 'Rp', '5 mg', ' Acidum folicum Hasco (Rp)', '', ''),
    ('Acidum folicum Richter', 'Rp', '5 mg', ' Acidum folicum Richter (Rp)', '', ''),
    ('Aciprex', 'Rp', '10 mg', '28 szt. ', '', ''),
    ('Aciprex', 'Rp', '10 mg', '56 szt. ', '', ''),
    ('Acitren', 'Rp', '10 mg', '30 szt. ', '', ''),
    ('Acitren', 'Rp', '10 mg', '100 szt. ', '', ''),
    ('Acitren', 'Rp', '25 mg', '30 szt. ', '', ''),
    ('Acitren', 'Rp', '25 mg', '100 szt. ', '', ''),
    ('Aclasta', 'Rpz', '5 mg/100 ml', '1 but. 100 ml ', '', ''),
    ('Aclexa', 'Rp', '100 mg', '10 szt. ', '', ''),
    ('Aclexa', 'Rp', '100 mg', '30 szt. ', '', ''),
    ('Aclexa', 'Rp', '100 mg', '60 szt. ', '', ''),
    ('Aclexa', 'Rp', '200 mg', '10 szt. ', '', ''),
    ('Aclexa', 'Rp', '200 mg', '30 szt. ', '', ''),
    ('Aclexa', 'Rp', '200 mg', '60 szt. ', '', ''),
    ('Aclotin', 'Rp', '250 mg', '20 szt. ', '', ''),
    ('Aclotin', 'Rp', '250 mg', '60 szt. ', '', ''),
    ('Acnatac', 'Rp', '10 mg + 0,25 mg/g', '1 tuba 30 g ', '', ''),
    ('Acnelec', 'Rp', '1 mg/g', '1 tuba 30 g ', '', ''),
    ('Acnelec', 'Rp', '1 mg/g', '1 tuba 30 g ', '', ''),
    ('Acodin Duo', 'OTC', '50 mg + 15 mg/5 ml', '1 but. 100 ml ', '', ''),
    ('Acodin', 'OTC', '15 mg', '10 szt. ', '', ''),
    ('Acodin', 'OTC', '15 mg', '20 szt. ', '', ''),
    ('Acodin 150 Junior', 'Rp', '50 mg + 7,5 mg/5 ml', '1 but. 100 ml ', '', ''),
    ('Actelsar HCT', 'Rp', '80 mg + 12,5 mg', '28 szt. ', '', ''),
    ('Actelsar HCT', 'Rp', '80 mg + 25 mg', '28 szt. ', '', ''),
    ('Actelsar', 'Rp', '40 mg', '28 szt. ', '', ''),
    ('Actelsar', 'Rp', '80 mg', '28 szt. ', '', ''),
    ('Actifed', 'OTC', '1,25 mg + 30 mg + 10 mg/5 ml', '1 but. 100 ml ', '', ''),
    ('Acti-trin', 'OTC', '1,25 mg + 30 mg + 10 mg/5 ml', '1 but. 100 ml ', '', ''),
    ('Activelle', 'Rp', '1 mg + 0,5 mg', '28 szt. ', '', ''),
    ('Actrapid Penfill', 'Rp', '100 j.m./ml', '5 wkładów 3 ml ', '', ''),
    ('Actusept', 'OTC', '1,5 mg/ml', '1 but. 30 ml ', '', ''),
    ('Acular', 'Rp', '5 mg/ml', '1 but. 10 ml ', '', ''),
    ('Acurenal', 'Rp', '5 mg', '30 szt. ', '', ''),
    ('Acurenal', 'Rp', '10 mg', '30 szt. ', '', ''),
    ('Acurenal', 'Rp', '20 mg', '30 szt. ', '', ''),
    ('Acurenal', 'Rp', '40 mg', '30 szt. ', '', ''),
    ('Adablok', 'Rp', '5 mg', '30 szt. ', '', ''),
    ('Adablok', 'Rp', '10 mg', '30 szt. ', '', ''),
    ('Adadox', 'Rp', '2 mg', '30 szt. ', '', ''),
    ('Adadox', 'Rp', '4 mg', '30 szt. ', '', ''),
    ('Adadox', 'Rp', '4 mg', '90 szt. ', '', ''),
    ('Adadut', 'Rp', '0,5 mg', '30 szt. ', '', ''),
    ('Adalift', 'Rp', '5 mg', '28 szt. ', '', ''),
    ('Adalift', 'Rp', '10 mg', '4 szt. ', '', ''),
    ('Adalift', 'Rp', '20 mg', '2 szt. ', '', ''),
    ('Adalift', 'Rp', '20 mg', '4 szt. ', '', ''),
    ('Adamon SR 50', 'Rp', '50 mg', ' Adamon SR 100 (Rp)', '', ''),
    ('Adaring', 'Rp', '0,12 mg + 0,015 mg/24 h', '1 szt. ', '', ''),
    ('Adaring', 'Rp', '0,12 mg + 0,015 mg/24 h', '3 szt. ', '', ''),
    ('Adartrel', 'Rp', '0,25 mg', '12 szt. ', '', ''),
    ('Adartrel', 'Rp', '0,5 mg', '28 szt. ', '', ''),
    ('Adartrel', 'Rp', '2 mg', '28 szt. ', '', ''),
    ('Adaster', 'Rp', '5 mg', '30 szt. ', '', ''),
    ('Adaster', 'Rp', '5 mg', '90 szt. ', '', ''),
    ('Adatam Duo', 'Rp', '0,5 mg + 0,4 mg', '30 szt. ', '', ''),
    ('Adatam', 'Rp', '0,4 mg', '30 szt. ', '', ''),
    ('Adatam', 'Rp', '0,4 mg', '90 szt. ', '', ''),
    ('Adcetris', 'Rpz', '50 mg', '1 fiolka ', '', ''),
    ('Adeksa', 'Rp', '50 mg', '30 szt. ', '', ''),
    ('Adeksa', 'Rp', '100 mg', '30 szt. ', '', ''),
    ('Adempas', 'Rpz', '0,5 mg', '42 szt. ', '', ''),
    ('Adempas', 'Rpz', '1 mg', '42 szt. ', '', ''),
    ('Adempas', 'Rpz', '1,5 mg', '42 szt. ', '', ''),
    ('Adempas', 'Rpz', '2 mg', '42 szt. ', '', ''),
    ('Adempas', 'Rpz', '2,5 mg', '42 szt. ', '', ''),
    ('Adenuric', 'Rp', '80 mg', '28 szt. ', '', ''),
    ('Adenuric', 'Rp', '120 mg', '28 szt. ', '', ''),
    ('Adepend', 'Rp', '50 mg', '28 szt. ', '', ''),
    ('Adipine', 'Rp', '5 mg', '30 szt. ', '', ''),
    ('Adipine', 'Rp', '10 mg', '30 szt. ', '', ''),
    ('Adproctin', 'OTC', '500 mg', '30 szt. ', '', ''),
    ('Adrenalina Aguettant', 'Rp', '0,1 mg/ml', '10 amp.-strzyk. ', '', ''),
    ('Adrenalina WZF 0,1%', 'Rp', '1 mg/ml', '10 amp. 1 ml ', '', ''),
    ('Adrenalina WZF', 'Rp', '0,3 mg/0,3 ml', '1 amp.-strzyk. 1 ml ', '', ''),
    ('Advagraf', 'Rpz', '0,5 mg', '30 szt. ', '', ''),
    ('Advagraf', 'Rpz', '1 mg', '30 szt. ', '', ''),
    ('Advagraf', 'Rpz', '3 mg', '30 szt. ', '', ''),
    ('Advagraf', 'Rpz', '5 mg', '30 szt. ', '', ''),
    ('Advantan', 'Rp', '1 mg/g', '1 tuba 15 g ', '', ''),
    ('Advantan', 'Rp', '1 mg/g', '1 tuba 15 g ', '', ''),
    ('Advantan', 'Rp', '1 mg/g', '1 tuba 25 g ', '', ''),
    ('Advantan', 'Rp', '1 mg/g', '1 tuba 30 g ', '', ''),
    ('Advantan', 'Rp', '1 mg/g', '1 tuba 15 g ', '', ''),
    ('Advantan', 'Rp', '1 mg/g', '1 tuba 25 g ', '', ''),
    ('Advantan', 'Rp', '1 mg/g', '1 tuba 30 g ', '', ''),
    ('Aerius', 'Rp', '0,5 mg/ml', '1 but. 60 ml ', '', ''),
    ('Aerius', 'Rp', '0,5 mg/ml', '1 but. 150 ml ', '', ''),
    ('Aerius', 'Rp', '5 mg', '10 szt. ', '', ''),
    ('Aerius', 'Rp', '5 mg', '30 szt. ', '', ''),
    ('Aescin', 'OTC', '20 mg', '30 szt. ', '', ''),
    ('Aescin', 'OTC', '20 mg', '90 szt. ', '', ''),
    ('Aescin', 'OTC', '20 mg + 50 mg + 50 j.m./g', '1 tuba 40 g ', '', ''),
    ('Aesculan', 'OTC', '62,5 mg + 5 mg/g', '1 tuba 30 g ', '', ''),
    ('Aethoxysklerol 0,5%', 'Rp', '5 mg/ml', '5 amp. 2 ml ', '', ''),
    ('Aethoxysklerol 1%', 'Rp', '10 mg/ml', '5 amp. 2 ml ', '', ''),
    ('Aethoxysklerol 2%', 'Rp', '20 mg/ml', '5 amp. 2 ml ', '', ''),
    ('Aethoxysklerol 3%', 'Rp', '30 mg/ml', '5 amp. 2 ml ', '', ''),
    ('Afastural', 'Rp', '3 g', '1 saszetka 8 g ', '', ''),
    ('Afinitor', 'Rpz', '5 mg', '30 szt. ', '', ''),
    ('Afinitor', 'Rpz', '10 mg', '30 szt. ', '', ''),
    ('Aflavic Comfort', 'OTC', '600 mg', '30 szt. ', '', ''),
    ('Aflavic Max', 'OTC', '1000 mg', '30 szt. ', '', ''),
    ('Aflavic Max', 'OTC', '1000 mg', '60 szt. ', '', ''),
    ('Aflegan', 'Rp', '7,5 mg/ml', '10 amp. 2 ml ', '', ''),
    ('Afloderm', 'Rp', '0,5 mg/g', '1 tuba 20 g ', '', ''),
    ('Afloderm', 'Rp', '0,5 mg/g', '1 tuba 40 g ', '', ''),
    ('Afloderm', 'Rp', '0,5 mg/g', '1 tuba 20 g ', '', ''),
    ('Afloderm', 'Rp', '0,5 mg/g', '1 tuba 40 g ', '', ''),
    ('Afobam', 'Rp', '0,25 mg', '30 szt. ', '', ''),
    ('Afobam', 'Rp', '0,5 mg', '30 szt. ', '', ''),
    ('Afobam', 'Rp', '1 mg', '30 szt. ', '', ''),
    ('Afrin', 'OTC', '0,5 mg/ml', '1 but. 20 ml ', '', ''),
    ('Afrin ND', 'OTC', '0,5 mg/ml', '1 but. 15 ml ', '', ''),
    ('Agapurin', 'Rp', '100 mg', '60 szt. ', '', ''),
    ('Agapurin SR 400', 'Rp', '400 mg', '20 szt. ', '', ''),
    ('Agapurin SR 600', 'Rp', '600 mg', '20 szt. ', '', ''),
    ('Agastin 20 mg', 'Rp', '20 mg', '28 szt. ', '', ''),
    ('Agen 5', 'Rp', '5 mg', '30 szt. ', '', ''),
    ('Agen 5', 'Rp', '5 mg', '60 szt. ', '', ''),
    ('Agen 10', 'Rp', '10 mg', '30 szt. ', '', ''),
    ('Agen 10', 'Rp', '10 mg', '60 szt. ', '', ''),
    ('Aglan', 'Rp', '15 mg/1,5 ml', '5 amp. 1,5 ml ', '', ''),
    ('Aglan 15', 'Rp', '15 mg', '10 szt. ', '', ''),
    ('Aglan 15', 'Rp', '15 mg', '20 szt. ', '', ''),
    ('Aglan 15', 'Rp', '15 mg', '30 szt. ', '', ''),
    ('Agolek', 'Rp', '25 mg', '28 szt. ', '', ''),
    ('Agomelatine Adamed', 'Rp', '25 mg', '28 szt. ', '', ''),
    ('Agomelatine G.L. Pharma', 'Rp', '25 mg', '28 szt. ', '', ''),
    ('Agomelatine NeuroPharma', 'Rp', '25 mg', '28 szt. ', '', ''),
    ('Agomelatine +pharma', 'Rp', '25 mg', '30 szt. ', '', ''),
    ('Agomelatine +pharma', 'Rp', '25 mg', '90 szt. ', '', ''),
    ('Agomelatyna Egis', 'Rp', '25 mg', '28 szt. ', '', ''),
    ('Agregex', 'Rp', '75 mg', '28 szt. ', '', ''),
    ('Agrypin', 'OTC', '325 mg + 30 mg + 10 mg', '10 szt. ', '', ''),
    ('Aidee', 'Rp', '0,03 mg + 2 mg', '21 szt. ', '', ''),
    ('Aimovig', 'Rpz', '70 mg/ml', '1 wstrzykiwacz 1 ml ', '', ''),
    ('Aimovig', 'Rpz', '140 mg/ml', '1 wstrzykiwacz 1 ml ', '', ''),
    ('Airbufo Forspiro', 'Rp', '160 µg + 4,5 µg/dawkę inh.', '60 dawek ', '', ''),
    ('Airbufo Forspiro', 'Rp', '160 µg + 4,5 µg/dawkę inh.', '120 dawek ', '', ''),
    ('AirFluSal Forspiro', 'Rp', '250 µg + 50 µg/dawkę inh.', '60 dawek ', '', ''),
    ('AirFluSal Forspiro', 'Rp', '500 µg + 50 µg/dawkę inh.', '60 dawek ', '', ''),
    ('Ajovy', 'Rpz', '225 mg', '1 amp.-strzyk. 1,5 ml ', '', ''),
    ('Akineton', 'Rp', '5 mg/ml', '5 amp. 1 ml ', '', ''),
    ('Akineton', 'Rp', '2 mg', '50 szt. ', '', ''),
    ('Akineton SR 4 mg', 'Rp', '4 mg', '30 szt. ', '', ''),
    ('Akistan Duo', 'Rp', '0,05 mg + 5 mg/ml', '1 but. 2,5 ml ', '', ''),
    ('Akistan Duo', 'Rp', '0,05 mg + 5 mg/ml', '3 but. 2,5 ml ', '', ''),
    ('Akistan', 'Rp', '0,05 mg/ml', '1 but. 2,5 ml ', '', ''),
    ('Akistan', 'Rp', '0,05 mg/ml', '3 but. 2,5 ml ', '', ''),
    ('Aklief', 'Rp', '50 µg/g', '1 poj. 30 g ', '', ''),
    ('Aknemycin', 'Rp', '20 mg/g', '1 tuba 25 g ', '', ''),
    ('Aknemycin', 'Rp', '20 mg/g', '1 but. 25 ml ', '', ''),
    ('Aknemycin Plus', 'Rp', '40 mg + 0,25 mg/g', '1 but. 25 ml ', '', ''),
    ('Aknenormin 10 mg', 'Rp', '10 mg', '30 szt. ', '', ''),
    ('Aknenormin 10 mg', 'Rp', '10 mg', '60 szt. ', '', ''),
    ('Aknenormin 10 mg', 'Rp', '10 mg', '90 szt. ', '', ''),
    ('Aknenormin 20 mg', 'Rp', '20 mg', '30 szt. ', '', ''),
    ('Aknenormin 20 mg', 'Rp', '20 mg', '60 szt. ', '', ''),
    ('Aknenormin 20 mg', 'Rp', '20 mg', '90 szt. ', '', ''),
    ('Aknenormin 20 mg', 'Rp', '20 mg', '100 szt. ', '', ''),
    ('Akneroxid 5', 'OTC', '50 mg/g', '1 tuba 50 g ', '', ''),
    ('Akneroxid 10', 'OTC', '100 mg/g', '1 tuba 50 g ', '', ''),
    ('Aksoderm forte', 'OTC', '1000 j.m./g', '1 tuba 10 g ', '', ''),
    ('Aksoderm', 'OTC', '400 j.m./g', '1 tuba 30 g ', '', ''),
    ('Akynzeo', 'Rp', '300 mg + 0,5 mg', '1 szt. ', '', ''),
    ('Alacare', 'Rp', '8 mg', '4 szt. ', '', ''),
    ('Alantan', 'OTC', '20 mg/g', '1 tuba 30 g ', '', ''),
    ('Alantan Plus', 'OTC', '20 mg + 50 mg/g', '1 tuba 35 g ', '', ''),
    ('Alantan Plus', 'OTC', '20 mg + 50 mg/g', '1 tuba 30 g ', '', ''),
    ('Alantavit', 'OTC', '10 mg + 500 j.m. + 1000 j.m./g', '1 tuba 30 g ', '', ''),
    ('Alax', 'OTC', '35 mg + 42 mg', '20 szt. ', '', ''),
    ('Albothyl', 'OTC', '90 mg', '6 szt. ', '', ''),
    ('Alcaine', 'Rp', '5 mg/ml', '1 but. 15 ml ', '', ''),
    ('Alcep', 'OTC', '949 mg/5 ml', '1 but. 125 g ', '', ''),
    ('Aldactone', 'Rp', '20 mg/ml', '10 amp. 10 ml ', '', ''),
    ('Aldan', 'Rp', '5 mg', '30 szt. ', '', ''),
    ('Aldan', 'Rp', '10 mg', '30 szt. ', '', ''),
    ('Aldara 5% Krem', 'Rp', '50 mg/g', '12 saszetek ', '', ''),
    ('Aldurazyme', 'Rpz', '100 j./ml', '1 fiolka 5 ml ', '', ''),
    ('Alecensa', 'Rpz', '150 mg', '224 szt. ', '', ''),
    ('Alendran 70', 'Rp', '70 mg', '4 szt. ', '', ''),
    ('Alendrogen', 'Rp', '70 mg', '4 szt. ', '', ''),
    ('Alendronat Bluefish', 'Rp', '70 mg', '4 szt. ', '', ''),
    ('Alendronic Acid Genoptim', 'Rp', '70 mg', '4 szt. ', '', ''),
    ('Alergimed', 'Rp', '5 mg', '30 szt. ', '', ''),
    ('AlergoTeva', 'OTC', '5 mg', '10 szt. ', '', ''),
    ('Aleric Deslo Active', 'OTC', '0,5 mg/ml', '1 but. 60 ml ', '', ''),
    ('Aleric Deslo Active', 'OTC', '2,5 mg', '10 szt. ', '', ''),
    ('Aleric Deslo Active', 'OTC', '5 mg', '10 szt. ', '', ''),
    ('Aleric Spray', 'OTC', '50 µg/dawkę', '60 dawek ', '', ''),
    ('Alermed', 'Rp', '10 mg', '20 szt. ', '', ''),
    ('Alermed', 'Rp', '10 mg', '30 szt. ', '', ''),
    ('Alerprof', 'Rp', '10 mg', '10 szt. ', '', ''),
    ('Alerprof', 'Rp', '10 mg', '30 szt. ', '', ''),
    ('Alerprof', 'Rp', '10 mg', '100 szt. ', '', ''),
    ('Alerzina', 'OTC', '10 mg', '10 szt. ', '', ''),
    ('Aleve', 'OTC', '220 mg', '12 szt. ', '', ''),
    ('Aleve', 'OTC', '220 mg', '24 szt. ', '', ''),
    ('Alfabax', 'Rp', '10 mg', '30 szt. ', '', ''),
    ('Alfadiol', 'Rp', '0,25 µg', '100 szt. ', '', ''),
    ('Alfadiol', 'Rp', '1 µg', '100 szt. ', '', ''),
    ('Alfurion', 'Rp', '10 mg', '30 szt. ', '', ''),
    ('Alfuzostad 10 mg', 'Rp', '10 mg', '30 szt. ', '', ''),
    ('Alka-Seltzer', 'OTC', '324 mg', '10 szt. ', '', ''),
    ('Alkeran', 'Rp', '2 mg', '25 szt. ', '', ''),
    ('Allegra', 'OTC', '120 mg', '10 szt. ', '', ''),
    ('Allegra Telfast 180', 'Rp', '180 mg', '20 szt. ', '', ''),
    ('AlleMax', 'OTC', '10 mg', '10 szt. ', '', ''),
    ('Alleoptical', 'OTC', '20 mg/ml', '10 poj. 0,3 ml ', '', ''),
    ('Allergo-Comod', 'OTC', '20 mg/ml', '1 but. 10 ml ', '', ''),
    ('Allergocrom', 'OTC', '20 mg/ml', '1 but. 10 ml ', '', ''),
    ('Allergodil', 'OTC', '1 mg/ml', '1 but. 10 ml ', '', ''),
    ('Allergodil', 'OTC', '0,5 mg/ml', '1 but. 6 ml ', '', ''),
    ('Allertec Fexo', 'OTC', '120 mg', '10 szt. ', '', ''),
    ('Allertec', 'Rp', '10 mg/ml', '1 but. 10 ml ', '', ''),
    ('Allertec', 'Rp', '10 mg/ml', '1 but. 20 ml ', '', ''),
    ('Allertec', 'Rp', '1 mg/ml', '1 but. 100 ml ', '', ''),
    ('Allertec', 'Rp', '10 mg', '20 szt. ', '', ''),
    ('Allertec', 'Rp', '10 mg', '30 szt. ', '', ''),
    ('Allertec WZF', 'OTC', '10 mg', '7 szt. ', '', ''),
    ('Allertec WZF', 'OTC', '10 mg', '10 szt. ', '', ''),
    ('Alliofil', 'OTC', '200 mg + 53,5 mg', '30 szt. ', '', ''),
    ('Alliomint', 'OTC', '300 mg', '30 szt. ', '', ''),
    ('Allupol', 'Rp', '100 mg', '50 szt. ', '', ''),
    ('Allupol', 'Rp', '300 mg', '30 szt. ', '', ''),
    ('Almiden', 'Rp', '5 mg', '30 szt. ', '', ''),
    ('Almiden', 'Rp', '10 mg', '30 szt. ', '', ''),
    ('Almozen', 'Rp', '12,5 mg', '3 szt. ', '', ''),
    ('Almozen', 'Rp', '12,5 mg', '6 szt. ', '', ''),
    ('Alneta', 'Rp', '5 mg', '30 szt. ', '', ''),
    ('Alneta', 'Rp', '5 mg', '60 szt. ', '', ''),
    ('Alneta', 'Rp', '10 mg', '30 szt. ', '', ''),
    ('Alneta', 'Rp', '10 mg', '60 szt. ', '', ''),
    ('Alocutan Forte', 'OTC', '50 mg/ml', '1 but. 60 ml ', '', ''),
    ('Alocutan', 'OTC', '20 mg/ml', '1 but. 60 ml ', '', ''),
    ('Alofisel', 'Rpz', '5 mln komórek/ml', '4 fiolki ', '', ''),
    ('Alopexy', 'OTC', '50 mg/ml', '1 but. 60 ml ', '', ''),
    ('Alopexy', 'OTC', '50 mg/ml', '3 but. 60 ml ', '', ''),
    ('Alortia', 'Rp', '50 mg + 5 mg', '30 szt. ', '', ''),
    ('Alortia', 'Rp', '50 mg + 5 mg', '60 szt. ', '', ''),
    ('Alortia', 'Rp', '50 mg + 5 mg', '90 szt. ', '', ''),
    ('Alortia', 'Rp', '50 mg + 10 mg', '30 szt. ', '', ''),
    ('Alortia', 'Rp', '50 mg + 10 mg', '60 szt. ', '', ''),
    ('Alortia', 'Rp', '50 mg + 10 mg', '90 szt. ', '', ''),
    ('Alortia', 'Rp', '100 mg + 5 mg', '30 szt. ', '', ''),
    ('Alortia', 'Rp', '100 mg + 10 mg', '30 szt. ', '', ''),
    ('Aloxi', 'Rp', '0,5 mg', '1 szt. ', '', ''),
    ('Aloxi', 'Rp', '0,25 mg/5 ml', '1 fiolka 5 ml ', '', ''),
    ('Alphagan', 'Rp', '2 mg/ml', '1 but. 5 ml ', '', ''),
    ('Alpicort E', 'Rp', '2 mg + 0,05 mg + 4 mg/ml', '1 but. 100 ml ', '', ''),
    ('Alpicort', 'Rp', '2 mg + 4 mg/ml', '1 but. 100 ml ', '', ''),
    ('Alpragen', 'Rp', '0,25 mg', '30 szt. ', '', ''),
    ('Alpragen', 'Rp', '0,5 mg', '30 szt. ', '', ''),
    ('Alpragen', 'Rp', '1 mg', '30 szt. ', '', ''),
    ('Alprazolam Aurovitas', 'Rp', '0,25 mg', '30 szt. ', '', ''),
    ('Alprazolam Aurovitas', 'Rp', '0,5 mg', '30 szt. ', '', ''),
    ('Alprazolam Aurovitas', 'Rp', '1 mg', '30 szt. ', '', ''),
    ('Alprox', 'Rp', '0,25 mg', '30 szt. ', '', ''),
    ('Alprox', 'Rp', '0,5 mg', '30 szt. ', '', ''),
    ('Alprox', 'Rp', '1 mg', '30 szt. ', '', ''),
    ('Altabactin', 'OTC', '250 j.m. + 5 mg/g', '1 tuba 5 g ', '', ''),
    ('Altabactin', 'OTC', '250 j.m. + 5 mg/g', '1 tuba 20 g ', '', ''),
    ('Altacet', 'OTC', '1000 mg', '6 szt. ', '', ''),
    ('Altacet', 'OTC', '10 mg/g', '1 tuba 75 g ', '', ''),
    ('Altażel Oceanic', 'OTC', '10 mg/g', '1 tuba 75 g ', '', ''),
    ('Altaziaja', 'OTC', '10 mg/g', '1 tuba 75 g ', '', ''),
    ('Alti-sir', 'OTC', '2,17 g/5 ml', '1 but. 125 g ', '', ''),
    ('Alugastrin', 'OTC', '340 mg', '20 szt. ', '', ''),
    ('Alugastrin', 'OTC', '340 mg', '40 szt. ', '', ''),
    ('Alugastrin', 'OTC', '340 mg/5 ml', '1 but. 250 ml ', '', ''),
    ('Alugen 10 mg', 'Rp', '10 mg', '30 szt. ', '', ''),
    ('Alunbrig', 'Rpz', '30 mg', '28 szt. ', '', ''),
    ('Alunbrig', 'Rpz', '90 mg', '7 szt. ', '', ''),
    ('Alunbrig', 'Rpz', '90 mg', '28 szt. ', '', ''),
    ('Alunbrig', 'Rpz', '180 mg', '28 szt. ', '', ''),
    ('Alventa', 'Rp', '37,5 mg', '28 szt. ', '', ''),
    ('Alventa', 'Rp', '75 mg', '28 szt. ', '', ''),
    ('Alventa', 'Rp', '75 mg', '60 szt. ', '', ''),
    ('Alventa', 'Rp', '150 mg', '28 szt. ', '', ''),
    ('Alventa', 'Rp', '150 mg', '60 szt. ', '', ''),
    ('Alvesco 80', 'Rp', '80 µg/dawkę inh.', '60 dawek ', '', ''),
    ('Alvesco 80', 'Rp', '80 µg/dawkę inh.', '120 dawek ', '', ''),
    ('Alvesco 160', 'Rp', '160 µg/dawkę inh.', '60 dawek ', '', ''),
    ('Alvesco 160', 'Rp', '160 µg/dawkę inh.', '120 dawek ', '', ''),
    ('Amantix', 'Rp', '200 mg/500 ml', '10 but. 500 ml ', '', ''),
    ('Amantix', 'Rp', '100 mg', '30 szt. ', '', ''),
    ('Amantix', 'Rp', '100 mg', '100 szt. ', '', ''),
    ('Amaryl 1', 'Rp', '1 mg', '30 szt. ', '', ''),
    ('Amaryl 2', 'Rp', '2 mg', '30 szt. ', '', ''),
    ('Amaryl 3', 'Rp', '3 mg', '30 szt. ', '', ''),
    ('Amaryl 4', 'Rp', '4 mg', '30 szt. ', '', ''),
    ('AmBisome liposomal', 'Rp', '50 mg', '1 fiolka + filtr membranowy ', '', ''),
    ('AmbroHexal', 'Rp', '7,5 mg/ml', '5 amp. 2 ml ', '', ''),
    ('Ambroksol Hasco', 'OTC', '30 mg/5 ml', '1 but. 150 ml ', '', ''),
    ('Ambroksol Hasco Junior', 'OTC', '15 mg/5 ml', '1 but. 150 ml ', '', ''),
    ('Ambroksol Hasco Max', 'OTC', '60 mg', '15 szt. ', '', ''),
    ('Ambroksol Takeda', 'OTC', '30 mg/5 ml', '1 but. 150 ml ', '', ''),
    ('Ambrolytin', 'OTC', '15 mg/5 ml', '1 but. 100 ml ', '', ''),
    ('Ambrosol Teva', 'OTC', '15 mg/5 ml', '1 but. 120 ml ', '', ''),
    ('Ambrosol Teva', 'OTC', '15 mg/5 ml', '1 but. 200 ml ', '', ''),
    ('Ambrosol Teva', 'OTC', '30 mg/5 ml', '1 but. 120 ml ', '', ''),
    ('Ambrosol Teva', 'OTC', '30 mg/5 ml', '1 but. 200 ml ', '', ''),
    ('Ambroxol Dr. Max', 'OTC', '15 mg/5 ml', '1 but. 100 ml ', '', ''),
    ('Ambroxol Dr. Max', 'OTC', '30 mg/5 ml', '1 but. 100 ml ', '', ''),
    ('Amertil Bio', 'OTC', '10 mg', '7 szt. ', '', ''),
    ('Amertil Bio', 'OTC', '10 mg', '10 szt. ', '', ''),
    ('Amertil', 'Rp', '10 mg', '20 szt. ', '', ''),
    ('Amertil', 'Rp', '10 mg', '30 szt. ', '', ''),
    ('Amertil', 'Rp', '10 mg', '60 szt. ', '', ''),
    ('Amgevita', 'Rpz', '20 mg/0,4 ml', '1 amp.-strzyk. 0,4 ml ', '', ''),
    ('Amgevita', 'Rpz', '40 mg/0,8 ml', '2 amp.-strzyk. 0,8 ml ', '', ''),
    ('Amgevita', 'Rpz', '40 mg/0,8 ml', '6 amp.-strzyk. 0,8 ml ', '', ''),
    ('Amgevita', 'Rpz', '40 mg/0,8 ml', '2 wstrzykiwacze 0,8 ml ', '', ''),
    ('Amgevita', 'Rpz', '40 mg/0,8 ml', '6 wstrzykiwaczy 0,8 ml ', '', ''),
    ('Amikacin B. Braun', 'Rp', '250 mg/100 ml', '10 but. 100 ml ', '', ''),
    ('Amikacin B. Braun', 'Rp', '500 mg/100 ml', '10 but. 100 ml ', '', ''),
    ('Amikacin B. Braun', 'Rp', '1000 mg/100 ml', '10 but. 100 ml ', '', ''),
    ('Amipryd', 'Rp', '100 mg', '30 szt. ', '', ''),
    ('Amipryd', 'Rp', '200 mg', '30 szt. ', '', ''),
    ('Amipryd', 'Rp', '400 mg', '30 szt. ', '', ''),
    ('Amisan', 'Rp', '50 mg', '60 szt. ', '', ''),
    ('Amisan', 'Rp', '200 mg', '30 szt. ', '', ''),
    ('Amisan', 'Rp', '200 mg', '60 szt. ', '', ''),
    ('Amisan', 'Rp', '400 mg', '30 szt. ', '', ''),
    ('Amisan', 'Rp', '400 mg', '60 szt. ', '', ''),
    ('Amitriptylinum VP', 'Rp', '10 mg', '60 szt. ', '', ''),
    ('Amitriptylinum VP', 'Rp', '25 mg', '60 szt. ', '', ''),
    ('Amizepin', 'Rp', '200 mg', '50 szt. ', '', ''),
    ('Amlator', 'Rp', '10 mg + 5 mg', '30 szt. ', '', ''),
    ('Amlator', 'Rp', '10 mg + 10 mg', '30 szt. ', '', ''),
    ('Amlator', 'Rp', '20 mg + 5 mg', '30 szt. ', '', ''),
    ('Amlator', 'Rp', '20 mg + 10 mg', '30 szt. ', '', ''),
    ('Amlessa', 'Rp', '4 mg + 5 mg', '30 szt. ', '', ''),
    ('Amlessa', 'Rp', '4 mg + 5 mg', '90 szt. ', '', ''),
    ('Amlessa', 'Rp', '4 mg + 10 mg', '30 szt. ', '', ''),
    ('Amlessa', 'Rp', '4 mg + 10 mg', '90 szt. ', '', ''),
    ('Amlessa', 'Rp', '8 mg + 5 mg', '30 szt. ', '', ''),
    ('Amlessa', 'Rp', '8 mg + 5 mg', '90 szt. ', '', ''),
    ('Amlessa', 'Rp', '8 mg + 10 mg', '30 szt. ', '', ''),
    ('Amlessa', 'Rp', '8 mg + 10 mg', '90 szt. ', '', ''),
    ('Amlessini', 'Rp', '5,7 mg + 5 mg', '30 szt. ', '', ''),
    ('Amlodipine Apotex', 'Rp', '5 mg', '30 szt. ', '', ''),
    ('Amlodipine Apotex', 'Rp', '10 mg', '30 szt. ', '', ''),
    ('Amlodipine Aurobindo', 'Rp', '5 mg', '30 szt. ', '', ''),
    ('Amlodipine Aurobindo', 'Rp', '10 mg', '30 szt. ', '', ''),
    ('Amlodipine Aurovitas', 'Rp', '5 mg', '30 szt. ', '', ''),
    ('Amlodipine Aurovitas', 'Rp', '10 mg', '30 szt. ', '', ''),
    ('Amlodipine Bluefish', 'Rp', '5 mg', '30 szt. ', '', ''),
    ('Amlodipine Bluefish', 'Rp', '10 mg', '30 szt. ', '', ''),
    ('Amlodipine Orion', 'Rp', '5 mg', '30 szt. ', '', ''),
    ('Amlodipine Orion', 'Rp', '10 mg', '30 szt. ', '', ''),
    ('Amlodipine Vitabalans', 'Rp', '5 mg', '30 szt. ', '', ''),
    ('Amlodipine Vitabalans', 'Rp', '10 mg', '30 szt. ', '', ''),
    ('Amlomyl', 'Rp', '5 mg', '30 szt. ', '', ''),
    ('Amlomyl', 'Rp', '10 mg', '30 szt. ', '', ''),
    ('Amlonor', 'Rp', '5 mg', '30 szt. ', '', ''),
    ('Amlonor', 'Rp', '10 mg', '30 szt. ', '', ''),
    ('Amlopin 5 mg', 'Rp', '5 mg', '30 szt. ', '', ''),
    ('Amlopin 10 mg', 'Rp', '10 mg', '30 szt. ', '', ''),
    ('Amlozek', 'Rp', '5 mg', '30 szt. ', '', ''),
    ('Amlozek', 'Rp', '10 mg', '30 szt. ', '', ''),
    ('Ammonaps', 'Rpz', '940 mg/g', '266 g ', '', ''),
    ('Ammonaps', 'Rpz', '500 mg', '250 szt. ', '', ''),
    ('Amoksiklav', 'Rp', '500 mg + 125 mg', '14 szt. ', '', ''),
    ('Amoksiklav', 'Rp', '500 mg + 125 mg', '21 szt. ', '', ''),
    ('Amoksiklav', 'Rp', '875 mg + 125 mg', '14 szt. ', '', ''),
    ('Amoksiklav', 'Rp', '875 mg + 125 mg', '20 szt. ', '', ''),
    ('Amoksiklav', 'Rp', '400 mg + 57 mg/5 ml', '1 but. 35 ml ', '', ''),
    ('Amoksiklav', 'Rp', '400 mg + 57 mg/5 ml', '1 but. 70 ml ', '', ''),
    ('Amoksiklav', 'Rp', '400 mg + 57 mg/5 ml', '1 but. 140 ml ', '', ''),
    ('Amoksiklav', 'Rp', '875 mg + 125 mg', '14 saszetek ', '', ''),
    ('Amoksiklav', 'Rp', '500 mg + 100 mg', '5 fiolek ', '', ''),
    ('Amoksiklav', 'Rp', '1000 mg + 200 mg', '5 fiolek ', '', ''),
    ('Amoksiklav Quicktab 625 mg', 'Rp', '500 mg + 125 mg', '14 szt. ', '', ''),
    ('Amoksiklav Quicktab 1000 mg', 'Rp', '875 mg + 125 mg', '14 szt. ', '', ''),
    ('Amorolak', 'OTC', '50 mg/ml', '1 but. 3 ml ', '', ''),
    ('Amotaks Dis', 'Rp', '500 mg', ' Amotaks Dis (Rp)', '', ''),
    ('Amotaks Dis', 'Rp', '750 mg', ' Amotaks Dis (Rp)', '', ''),
    ('Amotaks', 'Rp', '500 mg', ' Amotaks (Rp)', '', ''),
    ('Amotaks', 'Rp', '1000 mg', ' Amotaks (Rp)', '', ''),
    ('Amoxicillin Aurovitas', 'Rp', '750 mg', ' Amoxicillin Aurovitas (Rp)', '', ''),
    ('Amoxicillin + Clavulanic Acid Aurovitas', 'Rp', '875 mg + 125 mg', '14 szt. ', '', ''),
    ('Ampicillin TZF', 'Rp', '500 mg', '1 fiolka ', '', ''),
    ('Ampicillin TZF', 'Rp', '1000 mg', '1 fiolka ', '', ''),
    ('Ampicillin TZF', 'Rp', '2000 mg', '1 fiolka ', '', ''),
    ('Ampres', 'Rp', '10 mg/ml', '10 amp. 5 ml ', '', ''),
    ('Ampril HD', 'Rp', '5 mg + 25 mg', '30 szt. ', '', ''),
    ('Ampril HL', 'Rp', '2,5 mg + 12,5 mg', '30 szt. ', '', ''),
    ('Ampril 2,5 mg', 'Rp', '2,5 mg', '30 szt. ', '', ''),
    ('Ampril 5 mg', 'Rp', '5 mg', '30 szt. ', '', ''),
    ('Ampril 5 mg', 'Rp', '5 mg', '60 szt. ', '', ''),
    ('Ampril 10 mg', 'Rp', '10 mg', '30 szt. ', '', ''),
    ('Ampril 10 mg', 'Rp', '10 mg', '60 szt. ', '', ''),
    ('Amylan', 'Rp', '500 mg + 125 mg', '14 szt. ', '', ''),
    ('Amylan', 'Rp', '875 mg + 125 mg', '14 szt. ', '', ''),
    ('Anacard medica protect', 'OTC', '75 mg', '60 szt. ', '', ''),
    ('Anafranil', 'Rp', '10 mg', '30 szt. ', '', ''),
    ('Anafranil', 'Rp', '25 mg', '30 szt. ', '', ''),
    ('Anafranil SR 75', 'Rp', '75 mg', '20 szt. ', '', ''),
    ('Anagrelid Aurovitas', 'Rpz', '0,5 mg', '100 szt. ', '', ''),
    ('Anagrelide Accord', 'Rpz', '0,5 mg', '100 szt. ', '', ''),
    ('Anagrelide Accord', 'Rpz', '1 mg', '100 szt. ', '', ''),
    ('Anagrelide Bioton', 'Rpz', '0,5 mg', '100 szt. ', '', ''),
    ('Anagrelide Glenmark', 'Rpz', '0,5 mg', '100 szt. ', '', ''),
    ('Anagrelide Mylan', 'Rpz', '0,5 mg', '100 szt. ', '', ''),
    ('Anagrelide Ranbaxy', 'Rpz', '0,5 mg', '100 szt. ', '', ''),
    ('Anagrelide Sandoz', 'Rpz', '0,5 mg', '100 szt. ', '', ''),
    ('Anagrelide Stada', 'Rpz', '0,5 mg', '100 szt. ', '', ''),
    ('Anagrelide Vipharm', 'Rpz', '0,5 mg', '100 szt. ', '', ''),
    ('Anagrelide Vipharm', 'Rpz', '1 mg', '100 szt. ', '', ''),
    ('Anagrelide Zentiva', 'Rpz', '0,5 mg', '100 szt. ', '', ''),
    ('Anapran', 'Rp', '275 mg', '20 szt. ', '', ''),
    ('Anapran', 'Rp', '275 mg', '60 szt. ', '', ''),
    ('Anapran', 'Rp', '550 mg', '20 szt. ', '', ''),
    ('Anapran', 'Rp', '550 mg', '60 szt. ', '', ''),
    ('Anapran EC', 'Rp', '250 mg', '20 szt. ', '', ''),
    ('Anapran EC', 'Rp', '250 mg', '60 szt. ', '', ''),
    ('Anapran EC', 'Rp', '500 mg', '20 szt. ', '', ''),
    ('Anapran EC', 'Rp', '500 mg', '60 szt. ', '', ''),
    ('Anastrozol Bluefish', 'Rp', '1 mg', '28 szt. ', '', ''),
    ('Anastrozol Teva', 'Rp', '1 mg', '28 szt. ', '', ''),
    ('Andepin', 'Rp', '20 mg', '30 szt. ', '', ''),
    ('Androcur', 'Rp', '50 mg', '20 szt. ', '', ''),
    ('Androcur', 'Rp', '50 mg', '50 szt. ', '', ''),
    ('Androstatin', 'Rp', '1 mg', '28 szt. ', '', ''),
    ('Androster', 'Rp', '5 mg', '30 szt. ', '', ''),
    ('Androster', 'Rp', '5 mg', '90 szt. ', '', ''),
    ('Androtop', 'Rp', '50 mg/5 g', '30 saszetek 5 g ', '', ''),
    ('Androtop', 'Rp', '16,2 mg/g', '1 poj. 88 g ', '', ''),
    ('Anesderm', 'Rp', '25 mg + 25 mg/g', ' Anesderm (Rp)', '', ''),
    ('Anesteloc', 'Rp', '20 mg', '28 szt. ', '', ''),
    ('Anesteloc', 'Rp', '20 mg', '56 szt. ', '', ''),
    ('Anesteloc', 'Rp', '40 mg', '28 szt. ', '', ''),
    ('Anesteloc', 'Rp', '40 mg', '56 szt. ', '', ''),
    ('Anesteloc Max', 'OTC', '20 mg', '7 szt. ', '', ''),
    ('Anesteloc Max', 'OTC', '20 mg', '14 szt. ', '', ''),
    ('Angeliq', 'Rp', '1 mg + 2 mg', '28 szt. ', '', ''),
    ('Angiletta', 'Rp', '0,03 mg + 2 mg', '21 szt. ', '', ''),
    ('Angiletta', 'Rp', '0,03 mg + 2 mg', '3 x 21 szt. ', '', ''),
    ('Anidulafungina Accord', 'Rpz', '100 mg', '1 fiolka ', '', ''),
    ('Anidulafungin Sandoz', 'Rpz', '100 mg', '1 fiolka ', '', ''),
    ('Anoro Ellipta', 'Rp', '55 µg + 22 µg', '30 dawek ', '', ''),
    ('Anticol', 'Rp', '500 mg', '30 szt. ', '', ''),
    ('Antidol 15', 'OTC', '500 mg + 15 mg', '10 szt. ', '', ''),
    ('Antidral', 'OTC', '100 mg/g', '1 but. 50 ml ', '', ''),
    ('Antinervinum', 'OTC', '1032 mg + 903 mg + 645 mg/5 ml', '1 but. 200 g ', '', ''),
    ('Antiprost', 'Rp', '5 mg', '30 szt. ', '', ''),
    ('AntyGrypin dzień', 'OTC', '500 mg + 150 mg + 50 mg', '10 szt. ', '', ''),
    ('AntyGrypin noc', 'OTC', '500 mg + 200 mg + 4 mg', '10 saszetek ', '', ''),
    ('AntyGrypin noc', 'OTC', '500 mg + 200 mg + 4 mg', '10 szt. ', '', ''),
    ('Antypot', 'OTC', '10 mg + 100 mg/g', '1 op. 30 g ', '', ''),
    ('Anzorin', 'Rp', '5 mg', '28 szt. ', '', ''),
    ('Anzorin', 'Rp', '10 mg', '28 szt. ', '', ''),
    ('Anzorin', 'Rp', '15 mg', '28 szt. ', '', ''),
    ('Anzorin', 'Rp', '20 mg', '28 szt. ', '', ''),
    ('Apap ból i gorączka C Plus', 'OTC', '500 mg + 300 mg', '10 szt. ', '', ''),
    ('Apap Caps', 'OTC', '500 mg', '10 szt. ', '', ''),
    ('Apap dla dzieci Forte', 'OTC', '200 mg/5 ml', '1 but. 85 ml ', '', ''),
    ('Apap Extra', 'OTC', '500 mg + 65 mg', '6 szt. ', '', ''),
    ('Apap Extra', 'OTC', '500 mg + 65 mg', '10 szt. ', '', ''),
    ('Apap Extra', 'OTC', '500 mg + 65 mg', '24 szt. ', '', ''),
    ('Apap Extra', 'OTC', '500 mg + 65 mg', '50 szt. ', '', ''),
    ('Apap', 'OTC', '500 mg', '2 szt. ', '', ''),
    ('Apap', 'OTC', '500 mg', '6 szt. ', '', ''),
    ('Apap', 'OTC', '500 mg', '12 szt. ', '', ''),
    ('Apap', 'OTC', '500 mg', '24 szt. ', '', ''),
    ('Apap', 'OTC', '500 mg', '50 szt. ', '', ''),
    ('Apap', 'OTC', '500 mg', '100 szt. ', '', ''),
    ('Apap intense', 'OTC', '200 mg + 500 mg', '10 szt. ', '', ''),
    ('Apap Junior', 'OTC', '250 mg', '10 saszetek ', '', ''),
    ('Apap Noc', 'OTC', '500 mg + 25 mg', '6 szt. ', '', ''),
    ('Apap Noc', 'OTC', '500 mg + 25 mg', '12 szt. ', '', ''),
    ('Apap Noc', 'OTC', '500 mg + 25 mg', '24 szt. ', '', ''),
    ('Apap Noc', 'OTC', '500 mg + 25 mg', '50 szt. ', '', ''),
    ('Apap Przeziębienie', 'OTC', '650 mg + 50 mg + 10 mg', '8 saszetek ', '', ''),
    ('Apap Przeziębienie Junior', 'OTC', '300 mg + 20 mg + 5 mg', '6 saszetek ', '', ''),
    ('Aparxon PR', 'Rp', '2 mg', '28 szt. ', '', ''),
    ('Aparxon PR', 'Rp', '4 mg', '28 szt. ', '', ''),
    ('Aparxon PR', 'Rp', '8 mg', '28 szt. ', '', ''),
    ('Aperisan', 'OTC', '200 mg/g', '1 tuba 10 g ', '', ''),
    ('Aphtin Aflofarm', 'OTC', '200 mg/g', '1 but. 10 g ', '', ''),
    ('Aphtin', 'OTC', '200 mg/g', '1 but. 10 g ', '', ''),
    ('Aphtin', 'OTC', '200 mg/g', '1 but. 10 g ', '', ''),
    ('Aphtin', 'OTC', '200 mg/g', '1 op. 10 g ', '', ''),
    ('Aphtin', 'OTC', '200 mg/g', '1 poj. 10 g ', '', ''),
    ('Apiclar', 'Rp', '250 mg', '14 szt. ', '', ''),
    ('Apiclar', 'Rp', '500 mg', '14 szt. ', '', ''),
    ('Apidra', 'Rp', '100 j./ml', '1 fiolka 10 ml ', '', ''),
    ('Apidra', 'Rp', '100 j./ml', '5 wkładów 3 ml ', '', ''),
    ('Apidra SoloStar', 'Rp', '100 j./ml', '5 wstrzykiwaczy 3 ml ', '', ''),
    ('Apiprax', 'Rp', '15 mg', '28 szt. ', '', ''),
    ('Apipulmol', 'OTC', '2 g + 0,09 g/100 g', '1 but. 120 ml ', '', ''),
    ('Apitussic', 'OTC', '52 mg/5 ml', '1 but. 120 ml ', '', ''),
    ('Apo-Atorva', 'Rp', '10 mg', '30 szt. ', '', ''),
    ('Apo-Atorva', 'Rp', '20 mg', '30 szt. ', '', ''),
    ('Apo-Atorva', 'Rp', '30 mg', '30 szt. ', '', ''),
    ('Apo-Atorva', 'Rp', '30 mg', '60 szt. ', '', ''),
    ('Apo-Atorva', 'Rp', '40 mg', '30 szt. ', '', ''),
    ('ApoBetina', 'Rp', '8 mg', '100 szt. ', '', ''),
    ('ApoBetina', 'Rp', '16 mg', '60 szt. ', '', ''),
    ('ApoBetina', 'Rp', '24 mg', '60 szt. ', '', ''),
    ('Apo-Clodin', 'Rp', '250 mg', '30 szt. ', '', ''),
    ('Apo-Clodin', 'Rp', '250 mg', '60 szt. ', '', '');


insert into availability_in_warehouse values
    (1, 179),
	(2, 187),
	(4, 136),
	(5, 291),
	(6, 6),
	(8, 60),
	(10, 168),
	(11, 68),
	(12, 136),
	(14, 68),
	(15, 164),
	(16, 100),
	(19, 39),
	(20, 170),
	(21, 103),
	(22, 62),
	(23, 104),
	(25, 224),
	(26, 291),
	(28, 159),
	(29, 251),
	(31, 195),
	(32, 94),
	(33, 258),
	(34, 143),
	(35, 109),
	(37, 204),
	(38, 24),
	(39, 247),
	(40, 232),
	(41, 19),
	(42, 207),
	(43, 154),
	(45, 13),
	(46, 161),
	(47, 72),
	(49, 167),
	(50, 174),
	(52, 233),
	(53, 138),
	(54, 238),
	(56, 178),
	(57, 238),
	(58, 134),
	(59, 274),
	(60, 217),
	(62, 127),
	(63, 243),
	(65, 16),
	(67, 115),
	(68, 217),
	(69, 113),
	(70, 73),
	(71, 45),
	(73, 32),
	(74, 6),
	(75, 96),
	(77, 70),
	(78, 78),
	(79, 175),
	(80, 137),
	(81, 125),
	(83, 33),
	(84, 114),
	(85, 20),
	(86, 86),
	(87, 159),
	(88, 147),
	(89, 125);

insert into pharmacy(pharmacy_name) values
    ('APTEKA POD RATUSZEM'),
    ('APTEKA SUPER-PHARM'),
    ('APTEKA OGÓLNODOSTĘPNA "POD PODWÓJNYM ZŁOTYM ORŁEM" SPÓŁKA JAWNA'),
    ('APTEKA VITA'),
    ('APTEKA NA SZEWSKIEJ'),
    ('APTEKA DR.MAX'),
    ('APTEKA SUPER PHARM'),
    ('APTEKA DR. MAX'),
    ('APTEKA "TUMSKA"'),
    ('APTEKA PIASKOWA'),
    ('APTEKA CEF@RM 36,6'),
    ('APTEKA WROCŁAWSKA'),
    ('APTEKA CEF@RM 36,6'),
    ('APTEKA "ZA FOSĄ"'),
    ('APTEKA DOM LEKÓW'),
    ('APTEKA ZIKO'),
    ('APTEKA ZIKO'),
    ('APTEKA SŁONECZNA'),
    ('APTEKA DOM LEKÓW'),
    ('APTEKA POMORSKA S.C.'),
    ('APTEKA LEKOSFERA DGA 12'),
    ('APTEKA ZIEMOWITA'),
    ('APTEKA SILESIA 3'),
    ('APTEKA AMICUS III'),
    ('APTEKA "DR ZDROWIE"'),
    ('APTEKA CEDRUS'),
    ('APTEKA GRABISZYŃSKA'),
    ('APTEKA MEDICOVER APTEKA'),
    ('APTEKA MEDICOVER'),
    ('APTEKA O.O. BONIFRATRÓW'),
    ('APTEKA ZDROWIE'),
    ('APTEKA "POD SKRZYDŁEM ANIOŁA"'),
    ('APTEKA "MIESZCZAŃSKA"'),
    ('APTEKA "BRANIBORSKA"'),
    ('APTEKA DR.MAX'),
    ('APTEKA DR.MAX'),
    ('APTEKA ZIKO'),
    ('APTEKA API'),
    ('APTEKA PRZY PRZYCHODNI'),
    ('APTEKA MAK'),
    ('APTEKA MEDFARM'),
    ('APTEKA MAK'),
    ('APTEKA PINIA'),
    ('APTEKA LEGE ARTIS S.J.'),
    ('APTEKA  ŚW.WINCENTEGO'),
    ('APTEKA VERONICA'),
    ('APTEKA MAK'),
    ('APTEKA CZTERY PORY ROKU'),
    ('APTEKA LEGE ARTIS S.J.'),
    ('APTEKA "SŁONECZNA"'),
    ('APTEKA ŚW.TOMASZA'),
    ('APTEKA SPOŁECZNA NA SĘPA SZARZYŃSKIEGO GRUPA NOWA FARMACJA'),
    ('APTEKA KATEDRALNA'),
    ('APTEKA SILESIA'),
    ('APTEKA SŁONECZNA BIEDRONKA'),
    ('APTEKA HERBA S.C.DANUTA KONOPACKA,KATARZYNA FIUTOWSKA'),
    ('APTEKA DR.MAX'),
    ('APTEKA GINSANA'),
    ('APTEKA EXPRESSPHARM V'),
    ('APTEKA "LIBRA"'),
    ('APTEKA LEGE ARTIS'),
    ('APTEKA POD SŁOŃCEM'),
    ('APTEKA "ARKA"'),
    ('APTEKA WRATISLAVIA II S.C.'),
    ('APTEKA WRATISLAVIA II'),
    ('APTEKA ARONIA'),
    ('APTEKA LEKOSFERA DGA 10'),
    ('APTEKA HETMAŃSKA'),
    ('APTEKA NIEZAPOMINAJKA DLA CAŁEJ RODZINY'),
    ('APTEKA SUPER-PHARM'),
    ('APTEKA HIPOKRATES'),
    ('APTEKA LEKOSFERA DGA17'),
    ('APTEKA TĘCZOWA 3'),
    ('APTEKA'),
    ('APTEKA GRUNWALDZKA'),
    ('APTEKA CEF@RM 36,6'),
    ('APTEKA MNISZEK SP. J.'),
    ('"APTEKA PRZY PL. HISZFELDA"'),
    ('APTEKA CEF@RM 36,6'),
    ('APTEKA VISCI'),
    ('APTEKA PIASTOWSKA'),
    ('APTEKA "GRAFIT"'),
    ('APTEKA "LEGE ARTIS"'),
    ('APTEKA RUMIANEK'),
    ('APTEKA RUBUS'),
    ('APTEKA ''ALGA'' JOANNA ARAŹNY, ILONA OTLEWSKA S.C.'),
    ('APTEKA "PRZY PROXIMUM"'),
    ('APTEKA ALOES'),
    ('APTEKA SILESIA 4'),
    ('APTEKA JANTAROWA'),
    ('APTEKA POD AKACJAMI'),
    ('APTEKA POD KALINĄ'),
    ('APTEKA DOM LEKÓW'),
    ('APTEKA "VITRUM"'),
    ('APTEKA "HIBISCUS"'),
    ('APTEKA MEDICOVER APTEKA'),
    ('APTEKA "ARKADIA"'),
    ('APTEKA WRATISLAVIA III'),
    ('APTEKA "CZEKOLADOWA2"'),
    ('APTEKA "FRANCUSKA"'),
    ('APTEKA "OSTROBRAMSKA" S.C.'),
    ('APTEKA NA DAMROTA'),
    ('APTEKA POPOWICKA'),
    ('APTEKA FRANCUSKA'),
    ('APTEKA ACER'),
    ('APTEKA WRATISLAVIA'),
    ('APTEKA POD FILAREM'),
    ('APTEKA AKSAMITNA'),
    ('APTEKA NA OBORNICKIEJ'),
    ('APTEKA DR.MAX'),
    ('APTEKA ŚLICZNA'),
    ('APTEKA WIŚNIOWA DRIVE'),
    ('APTEKA LEKOSFERA DGA23'),
    ('APTEKA "MIODOWA"'),
    ('APTEKA MAK'),
    ('APTEKA "MULTI-LEK" SPÓŁKA JAWNA'),
    ('APTEKA "SŁONECZNA BIEDRONKA"'),
    ('APTEKA "POŁUDNIOWA"'),
    ('APTEKA ŻMIGRODZKA'),
    ('APTEKA SILESIA 2'),
    ('APTEKA DR.MAX'),
    ('APTEKA PRZY LEGNICKIEJ'),
    ('APTEKA NA ZDROWIE'),
    ('APTEKA SUPER-PHARM APTEKA MAGNOLIA PARK'),
    ('APTEKA'),
    ('APTEKA POMARAŃCZOWA'),
    ('APTEKA WAWRZYNEK S.C.'),
    ('APTEKA LEKOSFERA DGA 1'),
    ('APTEKA DR. OPTIMA'),
    ('APTEKA "POD JAWORAMI"'),
    ('APTEKA PRZY KRYNICKIEJ'),
    ('APTEKA BIOGENES.'),
    ('APTEKA AMICUS II'),
    ('APTEKA ZDROWIE'),
    ('APTEKA BIAŁOWIESKA'),
    ('APTEKA "KARŁOWICKA"'),
    ('APTEKA MILLENIUM'),
    ('APTEKA SŁONECZNA BIEDRONKA'),
    ('APTEKA AMICUS IV'),
    ('APTEKA AMICUS'),
    ('APTEKA "WANILIA"'),
    ('APTEKA Z MISIEM'),
    ('APTEKA "REMEDIUM"'),
    ('APTEKA "POD JEMIOŁĄ"'),
    ('APTEKA WALERIANA'),
    ('APTEKA DR.MAX'),
    ('APTEKA BEZPIECZNA'),
    ('APTEKA NA ZDROWIE'),
    ('APTEKA PRZY WEIGLA'),
    ('APTEKA LEKOSFERA DGA 11'),
    ('APTEKA "AB"  SP. Z O.O.'),
    ('APTEKA AGAT'),
    ('APTEKA OLIMPIJSKA'),
    ('APTEKA TARNOGAJSKA'),
    ('APTEKA AKADEMICKA'),
    ('APTEKA EURO-APTEKA'),
    ('APTEKA "WYSOKOGÓRSKA"'),
    ('APTEKA PULSANTIS S.C.'),
    ('APTEKA NA OSTATNIM GROSZU'),
    ('APTEKA KRÓLEWSKA'),
    ('APTEKA "TWOJA"'),
    ('APTEKA LAWENDA'),
    ('APTEKA "PRZY NETTO"'),
    ('APTEKA LOBELIA'),
    ('APTEKA "MALVA"'),
    ('APTEKA ŚW.WOJCIECHA'),
    ('APTEKA DR.MAX'),
    ('APTEKA PRO HOMINE'),
    ('APTEKA W PRZYCHODNI NA BISKUPINIE'),
    ('"APTEKA U DAWIDA"'),
    ('APTEKA NA BULWARZE IKARA'),
    ('APTEKA HELVETIA'),
    ('APTEKA DR.MAX'),
    ('APTEKA "RADIX" SPÓŁKA CYWILNA MARIAN, ŁUKASZ SZLÓSARCZYK'),
    ('APTEKA LEGE ARTIS'),
    ('APTEKA "PRZY MARINO"'),
    ('APTEKA LOTNICZA'),
    ('APTEKA RÓŻA WIATRÓW S.C.'),
    ('APTEKA MOJA'),
    ('APTEKA GRECKA'),
    ('APTEKA "WERBENA"'),
    ('APTEKA NIEZAPOMINAJKA DLA CAŁEJ RODZINY'),
    ('APTEKA SZMARAGDOWA BIS'),
    ('APTEKA BERBERYS'),
    ('APTEKA "KRZYCKA"'),
    ('APTEKA "DA VINCI"'),
    ('APTEKA KSIĘŻĘCA'),
    ('APTEKA GEMINI'),
    ('APTEKA LEGE ARTIS'),
    ('APTEKA LEGE ARTIS'),
    ('APTEKA MEDIC'),
    ('APTEKA TĘCZOWA'),
    ('APTEKA'),
    ('APTEKA PRZYJAŹNI'),
    ('APTEKA "POD DĘBAMI"'),
    ('APTEKA'),
    ('APTEKA PRIMA'),
    ('APTEKA MEDICEO DRIVE'),
    ('APTEKA BISKUPIN S.C.'),
    ('APTEKA NOVA'),
    ('APTEKA POD WĘŻEM'),
    ('APTEKA NA RONDZIE'),
    ('APTEKA NA KOZANOWIE'),
    ('APTEKA CEF@RM 36,6'),
    ('APTEKA APTEKI ARNIKA'),
    ('APTEKA AMAVITA'),
    ('APTEKA LEKOSFERA DGA22'),
    ('APTEKA OŁTASZYŃSKA'),
    ('APTEKA ORCHIDEA'),
    ('APTEKA RODZINNA'),
    ('APTEKA ABSYNT'),
    ('APTEKA "PARAFIALNA"'),
    ('APTEKA DOMOWA "ORCHOWSKA"'),
    ('APTEKA KRZEMIENIECKA'),
    ('APTEKA "DOKERSKA"'),
    ('APTEKA ALPEJSKA'),
    ('APTEKA KUŻNIKI'),
    ('APTEKA SIELSKA'),
    ('APTEKA OLIMPIA'),
    ('APTEKA "MUCHOBORSKA"'),
    ('APTEKA CALENDULA'),
    ('APTEKA AVICENNA'),
    ('APTEKA SARBINOWSKA'),
    ('APTEKA BROCHOWSKA'),
    ('APTEKA VIVALDIEGO'),
    ('APTEKA DROHOBYCKA'),
    ('APTEKA "CZEKOLADOWA"'),
    ('APTEKA "NASZA APTEKA"'),
    ('APTEKA "NA DOBRE I NA ZŁE" WALDEMAR CIACH'),
    ('APTEKA NIEZAPOMINAJKA DLA CAŁEJ RODZINY'),
    ('APTEKA EXPRESSPHARM VII'),
    ('APTEKA STRACHOCIŃSKA'),
    ('APTEKA MILLENIUM'),
    ('APTEKA "OSIEDLOWA"'),
    ('APTEKA NA WOJNOWIE'),
    ('APTEKA "POLESKA"'),
    ('APTEKA "RUMIANKOWA"  "FEMI" S.C.'),
    ('APTEKA RUMIANEK'),
    ('APTEKA "LEGE ARTIS"'),
    ('APTEKA SUPER-PHARM'),
    ('APTEKA "EXPRESSPHARM"'),
    ('APTEKA EXPRESSPHARM II'),
    ('APTEKA SAMBUCUS'),
    ('APTEKA ZIELONA'),
    ('APTEKA AKTYWNA'),
    ('APTEKA DLA ZDROWIA'),
    ('APTEKA "BEŻOWA"'),
    ('APTEKA "ZŁOTNICKA"'),
    ('APTEKA DĘBOWA'),
    ('APTEKA BELLADONNA'),
    ('APTEKA "POD ŚW. ANTONIM"'),
    ('APTEKA EXPRESSPHARM IV'),
    ('APTEKA LEŚNICKA'),
    ('APTEKA "OGRODOWA" SPÓŁKA JAWNA');

do $$ begin
    perform setseed(1);

    for pharmacy_id in 1..(select count(pharmacy_id) from pharmacy) loop
        for medicine_id in 1..(select count(medicine_id) from medicine) loop
            if (select random()) > 0.7 then
                insert
                    into medicine_in_pharmacy (pharmacy_id, medicine_id, quantity)
                    values(pharmacy_id, medicine_id, ceil(random() * 30));
            end if;
        end loop;
    end loop;
end; $$;

insert into prescription(expiration_date, client_id, prescription_type) values
    ('03/08/2021', 1, 'Rpw'),
    ('17/03/2022', 2, 'OTC'),
    ('10/08/2020', 3, 'Rpw'),
    ('04/02/2021', 4, 'Rp'),
    ('10/10/2020', 5, 'Rpw'),
    ('05/11/2021', 6, 'Rpw'),
    ('15/03/2021', 7, 'OTC'),
    ('26/07/2021', 8, 'Rpz'),
    ('08/03/2022', 9, 'Rpz'),
    ('05/01/2021', 10, 'Rpw'),
    ('23/11/2020', 11, 'Rpz'),
    ('03/03/2021', 12, 'OTC'),
    ('09/10/2020', 13, 'OTC'),
    ('15/09/2020', 14, 'Rp'),
    ('05/11/2020', 15, 'Rpw'),
    ('02/09/2020', 16, 'OTC'),
    ('29/08/2020', 17, 'Rpw'),
    ('19/02/2021', 18, 'OTC'),
    ('06/02/2021', 19, 'Rpz'),
    ('23/10/2020', 20, 'Rpw'),
    ('25/10/2020', 21, 'Rp'),
    ('13/11/2021', 22, 'OTC'),
    ('02/01/2021', 23, 'Rpw'),
    ('15/01/2022', 24, 'Rp'),
    ('11/06/2021', 25, 'Rp'),
    ('16/01/2022', 26, 'Rp'),
    ('01/10/2021', 27, 'Rpz'),
    ('16/04/2022', 28, 'Rpw'),
    ('31/05/2021', 29, 'Rpw'),
    ('23/08/2021', 30, 'Rpw'),
    ('04/05/2021', 31, 'OTC'),
    ('22/05/2022', 32, 'Rpw'),
    ('06/02/2022', 33, 'Rp'),
    ('04/04/2022', 34, 'OTC'),
    ('19/04/2021', 35, 'Rpw'),
    ('03/11/2020', 36, 'OTC'),
    ('24/03/2022', 37, 'Rpw'),
    ('29/12/2021', 38, 'OTC'),
    ('14/07/2021', 39, 'Rpz'),
    ('14/07/2020', 40, 'Rpw'),
    ('18/05/2022', 41, 'Rpw'),
    ('06/10/2021', 42, 'Rpz'),
    ('31/08/2021', 43, 'Rpw'),
    ('20/04/2022', 44, 'Rpz'),
    ('16/09/2020', 45, 'OTC'),
    ('09/09/2021', 46, 'Rpz'),
    ('28/06/2020', 47, 'Rpz'),
    ('08/05/2021', 48, 'Rpz'),
    ('24/05/2021', 49, 'Rpw'),
    ('12/10/2020', 50, 'OTC'),
    ('17/06/2021', 51, 'Rpw'),
    ('04/11/2020', 52, 'Rpz'),
    ('07/08/2020', 53, 'Rpz'),
    ('15/01/2022', 54, 'Rpz'),
    ('24/06/2020', 55, 'Rpw'),
    ('18/08/2021', 56, 'Rpz'),
    ('09/04/2021', 57, 'OTC'),
    ('12/05/2022', 58, 'Rpw'),
    ('01/10/2021', 59, 'Rpz'),
    ('16/07/2021', 60, 'Rpw'),
    ('30/09/2020', 61, 'Rp'),
    ('20/12/2020', 62, 'Rpw'),
    ('12/12/2020', 63, 'Rpz'),
    ('07/09/2021', 64, 'OTC'),
    ('24/03/2022', 65, 'OTC'),
    ('10/04/2022', 66, 'Rpw'),
    ('26/09/2021', 67, 'Rp'),
    ('29/11/2020', 68, 'Rpz'),
    ('12/01/2022', 69, 'Rp'),
    ('29/07/2020', 70, 'OTC'),
    ('14/12/2020', 71, 'Rpz'),
    ('23/02/2022', 72, 'Rpw'),
    ('13/11/2021', 73, 'Rpz'),
    ('03/06/2021', 74, 'Rp'),
    ('02/06/2020', 75, 'Rp'),
    ('04/08/2021', 76, 'Rpw'),
    ('27/12/2020', 77, 'Rp'),
    ('03/05/2022', 78, 'Rpw'),
    ('10/07/2021', 79, 'OTC'),
    ('30/12/2021', 80, 'Rpw'),
    ('07/12/2020', 81, 'Rpw'),
    ('01/07/2021', 82, 'Rpw'),
    ('17/01/2021', 83, 'Rpz'),
    ('04/11/2021', 84, 'Rp'),
    ('25/06/2021', 85, 'Rp'),
    ('12/12/2020', 86, 'Rp'),
    ('02/10/2021', 87, 'Rpz'),
    ('15/10/2020', 88, 'Rpw'),
    ('20/01/2022', 89, 'Rpw'),
    ('18/01/2021', 90, 'Rpw'),
    ('19/09/2020', 91, 'Rpz'),
    ('30/04/2022', 92, 'OTC'),
    ('17/05/2021', 93, 'OTC'),
    ('20/09/2020', 94, 'Rp'),
    ('20/01/2022', 95, 'Rp'),
    ('08/01/2022', 96, 'OTC');

insert into active_substance(international_name, "name", description) values
    ('Acarbose', 'Akarboza', 'Doustny lek przeciwcukrzycowy - inhibitor alfa-glukozydaz.  '),
    ('Acebutolol', 'Acebutolol', 'Selektywny lek beta-adrenolityczny.'),
    ('Acenocoumarol', 'Acenokumarol', 'Lek przeciwzakrzepowy - antagonista witaminy K.'),
    ('Acetylcysteine', 'Acetylocysteina', 'Lek mukolityczny. Lek stosowany w przypadku przedawkowania paracetamolu.'),
    ('Acetylsalicylic acid', 'Kwas acetylosalicylowy', 'Lek przeciwbólowy i przeciwgorączkowy z grupy pochodnych kwasu salicylowego. Lek przeciwzakrzepowy.'),
    ('Aciclovir', 'Acyklowir', 'Lek przeciwwirusowy aktywny wobec wirusa opyszczki typu 1 i 2, wirusa ospy wietrznej i półpaśca - analog nukleozydowy.'),
    ('Acitretin', 'Acytretyna', 'Lek przeciwłuszczycowy - pochodna retinoidowa.'),
    ('Adalimumab', 'Adalimumab', 'Lek immunosupresyjny - inhibitor TNF-alfa.'),
    ('Adapalene', 'Adapalen', 'Lek przeciwtrądzikowy - pochodna retinoidowa.'),
    ('Adenosine', 'Adenozyna', 'Lek przeciwarytmiczny klasy IV.'),
    ('Aesculus hippocastanum', 'Kasztanowiec zwyczajny', 'Lek zmniejszający przepuszczalność i uszczelniający naczynia włosowate.'),
    ('Agomelatine', 'Agomelatyna', ''),
    ('Alclometasone', 'Alklometazon', 'Glikokortykosteroid.'),
    ('Alectinib', 'Alektynib', 'Lek przeciwnowotworowy - inhibitor kinazy chłoniaka anaplastycznego (ALK).'),
    ('Alfacalcidol', 'Alfakalcydol', 'Analog witaminy D.'),
    ('Alfuzosin', 'Alfuzosyna', 'Lek stosowany w łagodnym rozroście gruczołu krokowego - selektywny antagonista postsynaptycznych receptorów alfa-adrenergicznych.'),
    ('Allantoine', 'Alantoina', 'Lek o działaniu przeciwzapalnym i przyspieszającym gojenie ran.'),
    ('Allium sativum', 'Czosnek pospolity', 'Surowiec roślinny o właściwościach przeciwbakteryjnych, przeciwgrzybiczych, żółciopędnych i obniżających stężenie cholesterolu we krwi.'),
    ('Allopurinol', 'Allopurynol', 'Lek zmniejszający stężenie kwasu moczowego.'),
    ('Almotriptan', 'Almotryptan', 'Lek przeciwmigrenowy - swoisty i wybiórczy agonista receptorów serotoninowych 5-HT1D.  '),
    ('Aloe arborescens', 'Aloes drzewiasty', 'Surowiec roślinny o właściwościach immunostymulujących.'),
    ('Aloe vera', 'Aloes zwyczajny', 'Surowiec roślinny o właściwościach immunostymulujących.'),
    ('Aloe', 'Alona', 'Lek przeczyszczający kontaktowy.'),
    ('Alprazolam', 'Alprazolam', 'Anksjolityk z grupy pochodnych benzodiazepiny.'),
    ('Amantadine', 'Amantadyna', 'Lek przeciwparkinsonowski - pochodna adamantanu.'),
    ('Ambroxol', 'Ambroksol', 'Lek mukolityczny.'),
    ('Amikacin', 'Amikacyna', 'Antybiotyk aminoglikozydowy.'),
    ('Amiodarone', 'Amiodaron', 'Lek przeciwarytmiczny klasy III.'),
    ('Amisulpride', 'Amisulpryd', 'Lek przeciwpsychotyczny z grupy pochodnych benzamidu.'),
    ('Amitriptyline', 'Amitryptylina', 'Lek przeciwdepresyjny - nieselektywny inibitor wychwytu zwrotnego monoamin.'),
    ('Amlodipine', 'Amlodypina', 'Lek blokujący kanały wapniowe o selektywnym działaniu naczyniowym - pochodna dihydropirydiny.'),
    ('Amorolfine', 'Amorolfina', 'Lek przeciwgrzybiczy - pochodna morfoliny.'),
    ('Amoxicillin and clavulanic acid', 'Amoksycylina i kwas klawulanowy', 'Antybiotyk z grupy penicylin w połączeniu z inhibitorem beta-laktamazy.'),
    ('Amoxicillin', 'Amoksycylina', 'Antybiotyk z grupy penicylin o szerokim spektrum działania.'),
    ('Ampicillin and sulbactam', 'Ampicylina i sulbaktam', 'Antybiotyk z grupy penicylin w połączeniu z inhibitorem beta-laktamazy.'),
    ('Ampicillin', 'Ampicylina', 'Antybiotyk z grupy penicylin o szerokim spektrum działania.'),
    ('Anagrelide', 'Anagrelid', 'Lek zmniejszający liczbę trombocytów we krwi.'),
    ('Anastrozole', 'Anastrozol', 'Lek przeciwnowotworowy - niesteroidowy inhibitor aromatazy.'),
    ('Anidulafungin', 'Anidulafungina', 'Lek przeciwgrzybiczy - półsyntetyczna echizokandyna.'),
    ('Aripiprazole', 'Arypiprazol', 'Lek przeciwpsychotyczny.'),
    ('Ascorbic acid - vitamin C', 'Kwas askorbowy - witamina C', 'Witamina C.'),
    ('Atorvastatin', 'Atorwastatyna', 'Lek modyfikujący stężenie lipidów - inhibitor reduktazy HMG-CoA.'),
    ('Azelastine', 'Azelastyna', 'Lek przeciwhistaminowy.'),
    ('Bacitracin', 'Bacytracyna', 'Antybiotyk polipeptydowy.'),
    ('Benzydamine', 'Benzydamina', 'Niesteroidowy lek przeciwzapalny.'),
    ('Betahistine', 'Betahistyna', 'Lek stosowany przeciw zawrotom głowy.'),
    ('Bifidobacterium lactis', 'Bifidobacterium lactis', ''),
    ('Biperiden', 'Biperyden', 'Lek przeciwparkinsonowski o działaniu cholinolitycznym.'),
    ('Boric acid', 'Kwas borowy', 'Środek antyseptyczny.'),
    ('Brigatinib', 'Brygatynib', 'Lek przeciwnowotworowy - inhibitor kinazy chłoniaka anaplastycznego (ALK).'),
    ('Brimonidine', 'Brymonidyna', 'Lek obniżający ciśnienie śródgałkowe - selektywny agonista receptora alfa-2-adrenergicznego.'),
    ('Budesonide', 'Budezonid', 'Glikokortykosteroid.'),
    ('Caffeine', 'Kofeina', 'Lek działający pobudzająco na OUN.'),
    ('Calcium and magnesium compounds', 'Związki wapnia i magnezu', 'Lek zobojętniający nadmiar kwasu solnego w soku żołądkowym.'),
    ('Calcium chloride', 'Chlorek wapnia', ''),
    ('Calcium compounds', 'Związki wapnia', 'Lek zobojętniający nadmiar kwasu solnego w soku żołądkowym.'),
    ('Calcium dobesilate', 'Dobezylan wapnia', 'Lek regulujący czynność naczyń włosowatych.'),
    ('Calcium pantothenate', 'Pantotenian wapnia', 'Witamina B5.'),
    ('Calcium', 'Wapń', ''),
    ('Carbamazepine', 'Karbamazepina', 'Lek przeciwpadaczkowy z grupy pochodnych karboksamidu.'),
    ('Caryophyllus oil', 'Olejek goździkowy', 'Surowiec roślinny o właściwościach antyseptycznych, przeciwzapalnych, znieczulających i znoszących wzdęcia.'),
    ('Celecoxib', 'Celekoksyb', 'Selektywny inhibitor COX-2.'),
    ('Cetirizine', 'Cetyryzyna', 'Lek przeciwhistaminowy z grupy pochodnych piperazyny.'),
    ('Chlorhexidine', 'Chlorheksydyna', 'Środek antyseptyczny.'),
    ('Chloroprocaine', 'Chloroprokaina', 'Środek miejscowo znieczulający z grupy estrów kwasu aminobenzoesowego.'),
    ('Chlorpheniramine', 'Chlorfenyramina', 'Lek przeciwhistaminowy z grupy pochodnych alkiloaminy.'),
    ('Ciclesonide', 'Cyklezonid', 'Glikokortykosteroid.'),
    ('Cinnamon oil', 'Olejek cynamonowy', 'Surowiec roślinny o właściwościach przeciwbakteryjnych, pobudzających wydzielanie soków trawiennych. Stosowany na skórę działa rozgrzewająco.'),
    ('Citicoline', 'Cytykolina', 'Lek psychostymulujący.'),
    ('Citronella oil', 'Olejek cytronelowy', 'Surowiec roślinny o właściwościach pobudzających, łagodnie rozgrzewających.'),
    ('Clarithromycin', 'Klarytromycyna', 'Antybiotyk makrolidowy.'),
    ('Clindamycin', 'Klindamycyna', ''),
    ('Clomipramine', 'Klomipramina', 'Lek przeciwdepresyjny - nieselektywny inibitor wychwytu zwrotnego monoamin.'),
    ('Clopidogrel', 'Klopidogrel', 'Lek przeciwzakrzepowy - inhibitor krzepnięcia.'),
    ('Codeine', 'Kodeina', 'Lek przeciwkaszlowy.'),
    ('Colecalciferol - vitamin D3', 'Cholekalcyferol - witamina D3', 'Witamina D3.'),
    ('Crataegus sp.', 'Głóg', 'Surowiec roślinny o działaniu tonizującym na mięsień sercowy oraz przeciwskurczowym na mięśnie gładkie jelit i naczyń krwionośnych (w tym naczyń wieńcowych i naczyń mózgowych).'),
    ('Crocus sativus', 'Szafran uprawny', ''),
    ('Cyproterone', 'Cyproteron', 'Antyandrogen.'),
    ('Cytarabine', 'Cytarabina', 'Lek przeciwnowotworowy z grupy antymetabolitów - analog pirymidyn.'),
    ('DHA - docosahexaenoic acid', 'DHA - kwas dokozaheksaenowy', 'Związek chemiczny z grupy wielonienasyconych kwasów tłuszczowych typu omega-3.'),
    ('Darvadstrocel', 'Darwadstrocel', 'Darwadstrocel zawiera namnożone komórki macierzyste pobrane z tkanki tłuszczowej, wykazujące działanie immunomodulacyjne i przeciwzapalne w miejscach ze stanem zapalnym.'),
    ('Desloratadine', 'Desloratadyna', 'Lek przeciwhistaminowy.'),
    ('Dexpanthenol', 'Dekspantenol', ''),
    ('Dextromethorphan', 'Dekstrometorfan', 'Lek przeciwkaszlowy.'),
    ('Diethylamine salicylate', 'Salicylan dietyloaminy', 'Niesteroidowy lek przeciwzapalny - pochodna kwasu salicylowego.'),
    ('Diosmin', 'Diosmina', 'Lek wpływający na elastyczność naczyń.'),
    ('Diphenhydramine', 'Difenhydramina', ''),
    ('Diphtheria toxoid', 'Szczepionka przeciw błonicy', 'Szczepionka przeciwbłonicza.'),
    ('Disulfiram', 'Disulfiram', 'Lek stosowany w leczeniu uzależnienia od alkoholu.'),
    ('Doxazosin', 'Doksazosyna', 'Lek przeciwnadciśnieniowy - selektywny i kompetycyjny antagonista postsynaptycznych receptorów alfa-1-adrenergicznych.'),
    ('Dutasteride', 'Dutasteryd', 'Lek stosowany w łagodnym rozroście gruczołu krokowego - wybiórczy inhibitor 5-alfa reduktazy testosteronu.'),
    ('Ectoin', 'Ektoina', 'Substancja pochodzenia naturalnego, wykazująca właściwości stabilizujące błony komórkowe oraz zmniejszające stan zapalny.'),
    ('Electrolytes and glucose', 'Elektrolity i glukoza', ''),
    ('Electrolytes', 'Elektrolity', ''),
    ('Epinephrine', 'Epinefryna', 'Lek pobudzający układ sercowo-naczyniowy.'),
    ('Erenumab', 'Erenumab', 'Lek przeciwmigrenowy - przeciwciało monoklonalne.'),
    ('Erythromycin', 'Erytromycyna', 'Antybiotyk makrolidowy.'),
    ('Escin', 'Escyna', 'Lek wpływający na elastyczność naczyń.'),
    ('Escitalopram', 'Escytalopram', 'Lek przeciwdepresyjny - selektywny inhibitor wychwytu zwrotnego serotoniny.'),
    ('Estradiol and dienogest', 'Estradiol i dienogest', ''),
    ('Estradiol and drospirenone', 'Estradiol i drospirenon', ''),
    ('Estradiol and dydrogesterone', 'Estradiol i dydrogesteron', ''),
    ('Estradiol and medroxyprogesterone', 'Estradiol i medroksyprogesteron', ''),
    ('Estradiol and nomegestrol', 'Estradiol i nomegestrol', ''),
    ('Estradiol and norethisterone', 'Estradiol i noretysteron', ''),
    ('Estradiol and norgestrel', 'Estradiol i norgestrel', ''),
    ('Estradiol and prasterone', 'Estradiol i prasteron', ''),
    ('Estradiol', 'Estradiol', 'Estrogen.'),
    ('Everolimus', 'Ewerolimus', 'Lek przeciwnowotworowy - inhibitor kinazy mTOR. Lek immunosupresyjny selektywny.'),
    ('Febuxostat', 'Febuksostat', ''),
    ('Ferrous', 'Żelazo', ''),
    ('Fexofenadine', 'Feksofenadyna', 'Lek przeciwhistaminowy.'),
    ('Filgrastim', 'Filgrastym', 'Lek immunostymulujący - ludzki czynnik wzrostu granulocytów.'),
    ('Finasteride', 'Finasteryd', 'Lek stosowany w łagodnym rozroście gruczołu krokowego - wybiórczy inhibitor 5-alfa reduktazy testosteronu. Lek pobudzający wzrost włosów.'),
    ('Flucytosine', 'Flucytozyna', 'Lek przeciwgrzybiczy.'),
    ('Fluoxetine', 'Fluoksetyna', 'Lek przeciwdepresyjny - selektywny inhibitor wychwytu zwrotnego serotoniny.'),
    ('Fluticasone furoate', 'Furoinian flutykazonu', 'Glikokortykosteroid.'),
    ('Fluticasone', 'Flutykazon', 'Glikokortykosteroid.'),
    ('Foeniculum vulgare', 'Koper włoski', ''),
    ('Folic acid', 'Kwas foliowy', 'Kwas foliowy.'),
    ('Formoterol', 'Formoterol', ''),
    ('Fosfomycin', 'Fosfomycyna', 'Antybiotyk - pochodna kwasu fosfonowego.'),
    ('Fremanezumab', 'Fremanezumab', 'Lek przeciwmigrenowy - przeciwciało monoklonalne.'),
    ('Glimepiride', 'Glimepiryd', 'Doustny lek przeciwcukrzycowy - pochodna sulfonylomocznika.'),
    ('Heparin', 'Heparyna', 'Lek przeciwzakrzepowy.'),
    ('Heparinoid', 'Heparynoid', ''),
    ('Hydrochlorothiazide', 'Hydrochlorotiazyd', 'Lek moczopędny tiazydowy.'),
    ('Ibuprofen', 'Ibuprofen', 'Niesteroidowy lek przeciwzapalny - pochodna kwasu propionowego.'),
    ('Imiquimod', 'Imikwimod', 'Lek przeciwwirusowy.'),
    ('Isotretinoin', 'Izotretynoina', 'Lek przeciwtrądzikowy - pochodna retinoidowa.'),
    ('Ketorolac', 'Ketorolak', 'Niesteroidowy lek przeciwzapalny.'),
    ('Lactobacillus acidophilus', 'Lactobacillus acidophilus', ''),
    ('Lactobacillus salivarius', 'Lactobacillus salivarius', ''),
    ('Lactoferrin', 'Laktoferyna', 'Wielofunkcyjne białko z grupy transferyn, wykazujące duże powinowactwo do jonów żelaza.'),
    ('Laronidase', 'Laronidaza', 'Lek stosowany w zaburzeniach metabolicznych.'),
    ('Latanoprost', 'Latanoprost', 'Lek obniżający ciśnienie śródgałkowe - analog prostaglandyny F2alfa.'),
    ('Lemon oil', 'Olejek cytrynowy', 'Surowiec roślinny o właściwościach odkażających i przeciwzapalnych. Stosowany na skórę działa rozgrzewająco.'),
    ('Levocetirizine', 'Lewocetyryzyna', 'Lek przeciwhistaminowy z grupy pochodnych piperazyny.'),
    ('Levomenthol', 'Lewomentol', 'Surowiec roślinny o właściwościach rozszerzających oskrzela i ułatwiających oddychanie, upłynniających wydzieliny śluzowe. Stosowany na skórę działa przeciwświądowo, znieczulająco, słabo antyseptycznie.'),
    ('Lidocaine', 'Lidokaina', 'Środek miejscowo znieczulający o budowie amidowej. Lek przeciwarytmiczny klasy IB.'),
    ('Losartan', 'Losartan', 'Bloker receptora angiotensyny II.'),
    ('Marrubium vulgare', 'Szanta zwyczajna', ''),
    ('Matricaria recutita', 'Rumianek pospolity', 'Surowiec roślinny o właściwościach przeciwzapalnych na błonę śluzową przewodu pokarmowego (zwłaszcza żołądka) i spazmolitycznych (głównie na mięśnie jelit).'),
    ('Melissa officinalis', 'Melisa lekarska', 'Surowiec roślinny o właściwościach uspokajających oraz przeciwskurczowych i zwiększających wydzielanie soków trawiennych.'),
    ('Meloxicam', 'Meloksykam', 'Niesteroidowy lek przeciwzapalny z grupy oksykamów.'),
    ('Melphalan', 'Melfalan', 'Cytostatyk z grupy związków alkilujących.'),
    ('Mentha piperita oil', 'Olejek mięty pieprzowej', 'Surowiec roślinny o właściwościach pobudzających wydzielanie soków trawiennych, głównie żołądka, rozkurczowych, żółciopędnych i wiatropędnych. Stosowany na skórę wywiera działanie przeciwzapalne, antyseptyczne i chłodzące.'),
    ('Menthol', 'Mentol', 'Surowiec roślinny o właściwościach rozszerzających oskrzela i ułatwiających oddychanie, upłynniających wydzieliny śluzowe. Stosowany na skórę działa przeciwświądowo, znieczulająco, słabo antyseptycznie.'),
    ('Minoxidil', 'Minoksydyl', 'Lek przeciwnadciśnieniowy działający bezpośrednio na mięśnie gładkie naczyń krwionośnych. Lek pobudzający wzrost włosów.'),
    ('Mometasone', 'Mometazon', 'Glikokortykosteroid.'),
    ('Naltrexone', 'Naltrekson', 'Lek stosowany w leczeniu uzależnienia od alkoholu.'),
    ('Nanocolloidal silver', 'Nanokoloid srebra', ''),
    ('Naproxen', 'Naproksen', 'Niesteroidowy lek przeciwzapalny - pochodna kwasu propionowego.'),
    ('Neomycin', 'Neomycyna', 'Antybiotyk aminoglikozydowy.'),
    ('Netupitant', 'Netupitant', 'Lek przeciwwymiotny - wybiórczy antagonista działający na ludzkie receptory neurokininowe 1 (NK1) substancji P.'),
    ('Olanzapine', 'Olanzapina', 'Lek przeciwpsychotyczny z grupy pochodnych benzodiazepiny.'),
    ('Omeprazole', 'Omeprazol', 'Lek hamujący wydzielanie kwasu solnego w żołądku - inibitor pompy protonowej.'),
    ('Opatrunek regulujący poziom wilgotności rany z dodatkami', 'Opatrunek regulujący poziom wilgotności rany z dodatkami', ''),
    ('Oxycodone', 'Oksykodon', 'Opioidowy lek przeciwbólowy.'),
    ('Oxymetazoline', 'Oksymetazolina', 'Sympatykomimetyk.'),
    ('Palonosetron', 'Palonosetron', 'Lek przeciwwymiotny - silny i wybiórczy antagonista receptorów serotoninowych typu 3 (5-HT3). '),
    ('Pantoprazole', 'Pantoprazol', 'Lek hamujący wydzielanie kwasu solnego w żołądku - inibitor pompy protonowej.'),
    ('Paracetamol', 'Paracetamol', 'Lek przeciwbólowy i przeciwgorączkowy z grupy anilidów.'),
    ('Pediococcus pentosaceus', 'Pediococcus pentosaceus', ''),
    ('Pefloxacin', 'Pefloksacyna', 'Chemioterapeutyk z grupy fluorochinolonów.'),
    ('Pentoxifylline', 'Pentoksyfilina', 'Lek rozszerzający naczynia obwodowe - pochodna puryny.'),
    ('Perilla frutescens', 'Pachnotka zwyczajna', ''),
    ('Perindopril', 'Peryndopryl', 'Inhibitor konwertazy angiotensyny.'),
    ('Pertussis vaccine', 'Szczepionka przeciw krztuścowi', 'Szczepionka przeciw krztuścowi.'),
    ('Phenylephrine', 'Fenylefryna', 'Sympatykomimetyk.'),
    ('Policresulen', 'Polikrezulen', 'Chemioterapeutyk.'),
    ('Polidocanol', 'Polidokanol', 'Lek stosowany w leczeniu żylaków - środek do skleroterapii.'),
    ('Prednisolone', 'Prednizolon', 'Glikokortykosteroid.'),
    ('Prilocaine', 'Prylokaina', 'Środek miejscowo znieczulający o budowie amidowej.'),
    ('Proxymetacaine', 'Proksymetakaina', 'Środek miejscowo znieczulający.'),
    ('Pseudoephedrine', 'Pseudoefedryna', 'Sympatykomimetyk.'),
    ('Pyridoxine - vitamin B6', 'Pirydoksyna - witamina B6', 'Witamina B6.'),
    ('Quercetin', 'Kwercetyna', ''),
    ('Quinapril', 'Chinapryl', 'Inhibitor konwertazy angiotensyny.'),
    ('Ramipril', 'Ramipryl', 'Inhibitor konwertazy angiotensyny.'),
    ('Resorcinol', 'Rezorcyna', 'Lek o działaniu keratolitycznym i antyseptycznym.'),
    ('Riociguat', 'Riocyguat', 'Lek obniżający ciśnienie stosowany w tętniczym nadciśnieniu płucnym.'),
    ('Ropinirole', 'Ropinirol', 'Lek przeciwparkinsonowski - agonista receptorów dopaminergicznych.'),
    ('Rupatadine', 'Rupatadyna', ''),
    ('Salicylic acid', 'Kwas salicylowy', 'Lek o działaniu keratolitycznym.'),
    ('Salmeterol', 'Salmeterol', 'Lek do stosowania w chorobach obturacyjnych dróg oddechowych - selektywny agonista receptora beta2-adrenergicznego.'),
    ('Selenium', 'Selen', 'Selen.'),
    ('Solifenacin', 'Solifenacyna', 'Spazmolityk działający na mięśnie gładkie układu moczowego.'),
    ('Sulfogaiacol', 'Sulfogwajakol', 'Lek wykrztuśny.'),
    ('Tacrolimus', 'Takrolimus', ''),
    ('Tadalafil', 'Tadalafil', 'Inhibitor fosfodiesterazy typu 5 - stosowany w zaburzeniach erekcji oraz w nadciśnieniu płucnym.'),
    ('Tamsulosin', 'Tamsulosyna', 'Lek stosowany w łagodnym rozroście gruczołu krokowego - selektywny antagonista postsynaptycznych receptorów alfa-adrenergicznych.'),
    ('Telmisartan', 'Telmisartan', 'Bloker receptora angiotensyny II.'),
    ('Testosterone', 'Testosteron', 'Androgen.'),
    ('Tetanus toxoid', 'Szczepionka przeciw tężcowi', 'Szczepionka przeciwtężcowa.'),
    ('Thymol', 'Tymol', 'Surowiec roślinny o działaniu wykrztuśnym, odkażającym, pobudzającym wydzielanie soku żołądkowego, trzustkowego i enzymów jelitowych.'),
    ('Ticlopidine', 'Tyklopidyna', 'Lek przeciwzakrzepowy - inhibitor krzepnięcia.'),
    ('Timolol', 'Tymolol', 'Lek obniżający ciśnienie śródgałkowe - nieselektywny bloker receptorów beta-adrenergicznych. '),
    ('Tramadol', 'Tramadol', 'Opioidowy lek przeciwbólowy.'),
    ('Tretinoin', 'Tretynoina', 'Lek przeciwtrądzikowy - pochodna retinoidowa. Lek przeciwnowotworowy z grupy retinoidów.'),
    ('Trifarotene', 'Trifaroten', 'Lek przeciwtrądzikowy - pochodna retinoidowa.'),
    ('Triprolidine', 'Tryprolidyna', 'Lek przeciwhistaminowy.'),
    ('Ubidecarenone', 'Ubidekarenon', 'Lek o działaniu antyoksydacyjnym, immunostymulującym i przeciwmiażdżycowym.'),
    ('Umeclidinium bromide', 'Bromek umeklidyniowy', ''),
    ('Valeriana officinalis', 'Kozłek lekarski', 'Surowiec roślinny o działaniu uspokajającym.'),
    ('Venlafaxine', 'Wenlafaksyna', 'Lek przeciwdepresyjny - inhibitor wychwytu zwrotnego serotoniny i noradrenaliny.'),
    ('Vilanterol', 'Wilanterol', ''),
    ('Zinc acetate', 'Octan cynku', 'Lek stosowany w zaburzeniach metabolicznych - blokujący wchłanianie miedzi.'),
    ('Zinc oxide', 'Tlenek cynku', 'Lek o działaniu przeciwświądowym i wysuszającym.'),
    ('Zinc sulfate', 'Siarczan cynku', ''),
    ('Zinc undecylenate', 'Undecylian cynku', 'Lek przeciwgrzybiczy.'),
    ('Zinc', 'Cynk', ''),
    ('Zingiber officinale', 'Imbir lekarski', 'Surowiec roślinny o działaniu zapobiegającym nudnościom.');


insert into medicine_substance_map(medicine_id, active_substance_id) 
select medicine_id, (select active_substance_id from active_substance where international_name='Salicylic acid') from medicine where trade_name='ABE'
union select medicine_id, (select active_substance_id from active_substance where international_name='Aripiprazole') from medicine where trade_name='Abilify'
union select medicine_id, (select active_substance_id from active_substance where international_name='Aripiprazole') from medicine where trade_name='Abilify Maintena'
union select medicine_id, (select active_substance_id from active_substance where international_name='Acetylsalicylic acid') from medicine where trade_name='Abrea'
union select medicine_id, (select active_substance_id from active_substance where international_name='Acetylsalicylic acid') from medicine where trade_name='Acard 300 mg'
union select medicine_id, (select active_substance_id from active_substance where international_name='Acetylsalicylic acid') from medicine where trade_name='Acard'
union select medicine_id, (select active_substance_id from active_substance where international_name='Pseudoephedrine') from medicine where trade_name='Acatar Acti-Tabs'
union select medicine_id, (select active_substance_id from active_substance where international_name='Triprolidine') from medicine where trade_name='Acatar Acti-Tabs'
union select medicine_id, (select active_substance_id from active_substance where international_name='Azelastine') from medicine where trade_name='Acatar Allergy'
union select medicine_id, (select active_substance_id from active_substance where international_name='Oxymetazoline') from medicine where trade_name='Acatar Control'
union select medicine_id, (select active_substance_id from active_substance where international_name='Ibuprofen') from medicine where trade_name='Acatar Zatoki'
union select medicine_id, (select active_substance_id from active_substance where international_name='Pseudoephedrine') from medicine where trade_name='Acatar Zatoki'
union select medicine_id, (select active_substance_id from active_substance where international_name='Acetylcysteine') from medicine where trade_name='ACC classic'
union select medicine_id, (select active_substance_id from active_substance where international_name='Acetylcysteine') from medicine where trade_name='ACC Hot'
union select medicine_id, (select active_substance_id from active_substance where international_name='Acetylcysteine') from medicine where trade_name='ACC'
union select medicine_id, (select active_substance_id from active_substance where international_name='Acetylcysteine') from medicine where trade_name='ACC mini'
union select medicine_id, (select active_substance_id from active_substance where international_name='Filgrastim') from medicine where trade_name='Accofil'
union select medicine_id, (select active_substance_id from active_substance where international_name='Acetylcysteine') from medicine where trade_name='ACC optima Active'
union select medicine_id, (select active_substance_id from active_substance where international_name='Acetylcysteine') from medicine where trade_name='ACC optima Hot'
union select medicine_id, (select active_substance_id from active_substance where international_name='Acetylcysteine') from medicine where trade_name='ACC optima'
union select medicine_id, (select active_substance_id from active_substance where international_name='Oxycodone') from medicine where trade_name='Accordeon'
union select medicine_id, (select active_substance_id from active_substance where international_name='Quinapril') from medicine where trade_name='Accupro'
union select medicine_id, (select active_substance_id from active_substance where international_name='Acebutolol') from medicine where trade_name='Acebutolol Aurovitas'
union select medicine_id, (select active_substance_id from active_substance where international_name='Acenocoumarol') from medicine where trade_name='Acenocumarol WZF'
union select medicine_id, (select active_substance_id from active_substance where international_name='Paracetamol') from medicine where trade_name='Acenol'
union select medicine_id, (select active_substance_id from active_substance where international_name='Salicylic acid') from medicine where trade_name='Acerin'
union select medicine_id, (select active_substance_id from active_substance where international_name='Acetylsalicylic acid') from medicine where trade_name='Acesan'
union select medicine_id, (select active_substance_id from active_substance where international_name='Acetylcysteine') from medicine where trade_name='Acetylcysteine Sandoz'
union select medicine_id, (select active_substance_id from active_substance where international_name='Acetylcysteine') from medicine where trade_name='Acetylcysteinum Flegamina'
union select medicine_id, (select active_substance_id from active_substance where international_name='Aciclovir') from medicine where trade_name='Aciclovir Ziaja'
union select medicine_id, (select active_substance_id from active_substance where international_name='Folic acid') from medicine where trade_name='Acidum folicum Hasco'
union select medicine_id, (select active_substance_id from active_substance where international_name='Folic acid') from medicine where trade_name='Acidum folicum Richter'
union select medicine_id, (select active_substance_id from active_substance where international_name='Escitalopram') from medicine where trade_name='Aciprex'
union select medicine_id, (select active_substance_id from active_substance where international_name='Acitretin') from medicine where trade_name='Acitren'
union select medicine_id, (select active_substance_id from active_substance where international_name='Celecoxib') from medicine where trade_name='Aclexa'
union select medicine_id, (select active_substance_id from active_substance where international_name='Ticlopidine') from medicine where trade_name='Aclotin'
union select medicine_id, (select active_substance_id from active_substance where international_name='Clindamycin') from medicine where trade_name='Acnatac'
union select medicine_id, (select active_substance_id from active_substance where international_name='Tretinoin') from medicine where trade_name='Acnatac'
union select medicine_id, (select active_substance_id from active_substance where international_name='Adapalene') from medicine where trade_name='Acnelec'
union select medicine_id, (select active_substance_id from active_substance where international_name='Dexpanthenol') from medicine where trade_name='Acodin Duo'
union select medicine_id, (select active_substance_id from active_substance where international_name='Dextromethorphan') from medicine where trade_name='Acodin Duo'
union select medicine_id, (select active_substance_id from active_substance where international_name='Dextromethorphan') from medicine where trade_name='Acodin'
union select medicine_id, (select active_substance_id from active_substance where international_name='Telmisartan') from medicine where trade_name='Actelsar HCT'
union select medicine_id, (select active_substance_id from active_substance where international_name='Hydrochlorothiazide') from medicine where trade_name='Actelsar HCT'
union select medicine_id, (select active_substance_id from active_substance where international_name='Telmisartan') from medicine where trade_name='Actelsar'
union select medicine_id, (select active_substance_id from active_substance where international_name='Triprolidine') from medicine where trade_name='Actifed'
union select medicine_id, (select active_substance_id from active_substance where international_name='Pseudoephedrine') from medicine where trade_name='Actifed'
union select medicine_id, (select active_substance_id from active_substance where international_name='Dextromethorphan') from medicine where trade_name='Actifed'
union select medicine_id, (select active_substance_id from active_substance where international_name='Triprolidine') from medicine where trade_name='Acti-trin'
union select medicine_id, (select active_substance_id from active_substance where international_name='Pseudoephedrine') from medicine where trade_name='Acti-trin'
union select medicine_id, (select active_substance_id from active_substance where international_name='Dextromethorphan') from medicine where trade_name='Acti-trin'
union select medicine_id, (select active_substance_id from active_substance where international_name='Estradiol and norethisterone') from medicine where trade_name='Activelle'
union select medicine_id, (select active_substance_id from active_substance where international_name='Benzydamine') from medicine where trade_name='Actusept'
union select medicine_id, (select active_substance_id from active_substance where international_name='Ketorolac') from medicine where trade_name='Acular'
union select medicine_id, (select active_substance_id from active_substance where international_name='Quinapril') from medicine where trade_name='Acurenal'
union select medicine_id, (select active_substance_id from active_substance where international_name='Solifenacin') from medicine where trade_name='Adablok'
union select medicine_id, (select active_substance_id from active_substance where international_name='Doxazosin') from medicine where trade_name='Adadox'
union select medicine_id, (select active_substance_id from active_substance where international_name='Dutasteride') from medicine where trade_name='Adadut'
union select medicine_id, (select active_substance_id from active_substance where international_name='Tadalafil') from medicine where trade_name='Adalift'
union select medicine_id, (select active_substance_id from active_substance where international_name='Tramadol') from medicine where trade_name='Adamon SR'
union select medicine_id, (select active_substance_id from active_substance where international_name='Ropinirole') from medicine where trade_name='Adartrel'
union select medicine_id, (select active_substance_id from active_substance where international_name='Finasteride') from medicine where trade_name='Adaster'
union select medicine_id, (select active_substance_id from active_substance where international_name='Dutasteride') from medicine where trade_name='Adatam Duo'
union select medicine_id, (select active_substance_id from active_substance where international_name='Tamsulosin') from medicine where trade_name='Adatam Duo'
union select medicine_id, (select active_substance_id from active_substance where international_name='Tamsulosin') from medicine where trade_name='Adatam'
union select medicine_id, (select active_substance_id from active_substance where international_name='Acarbose') from medicine where trade_name='Adeksa'
union select medicine_id, (select active_substance_id from active_substance where international_name='Riociguat') from medicine where trade_name='Adempas'
union select medicine_id, (select active_substance_id from active_substance where international_name='Febuxostat') from medicine where trade_name='Adenuric'
union select medicine_id, (select active_substance_id from active_substance where international_name='Naltrexone') from medicine where trade_name='Adepend'
union select medicine_id, (select active_substance_id from active_substance where international_name='Amlodipine') from medicine where trade_name='Adipine'
union select medicine_id, (select active_substance_id from active_substance where international_name='Calcium dobesilate') from medicine where trade_name='Adproctin'
union select medicine_id, (select active_substance_id from active_substance where international_name='Epinephrine') from medicine where trade_name='Adrenalina Aguettant'
union select medicine_id, (select active_substance_id from active_substance where international_name='Epinephrine') from medicine where trade_name='Adrenalina WZF 0,1%'
union select medicine_id, (select active_substance_id from active_substance where international_name='Epinephrine') from medicine where trade_name='Adrenalina WZF'
union select medicine_id, (select active_substance_id from active_substance where international_name='Tacrolimus') from medicine where trade_name='Advagraf'
union select medicine_id, (select active_substance_id from active_substance where international_name='Desloratadine') from medicine where trade_name='Aerius'
union select medicine_id, (select active_substance_id from active_substance where international_name='Aesculus hippocastanum') from medicine where trade_name='Aesculan'
union select medicine_id, (select active_substance_id from active_substance where international_name='Lidocaine') from medicine where trade_name='Aesculan'
union select medicine_id, (select active_substance_id from active_substance where international_name='Polidocanol') from medicine where trade_name='Aethoxysklerol'
union select medicine_id, (select active_substance_id from active_substance where international_name='Fosfomycin') from medicine where trade_name='Afastural'
union select medicine_id, (select active_substance_id from active_substance where international_name='Everolimus') from medicine where trade_name='Afinitor'
union select medicine_id, (select active_substance_id from active_substance where international_name='Diosmin') from medicine where trade_name='Aflavic Comfort'
union select medicine_id, (select active_substance_id from active_substance where international_name='Diosmin') from medicine where trade_name='Aflavic Max'
union select medicine_id, (select active_substance_id from active_substance where international_name='Ambroxol') from medicine where trade_name='Aflegan'
union select medicine_id, (select active_substance_id from active_substance where international_name='Alclometasone') from medicine where trade_name='Afloderm'
union select medicine_id, (select active_substance_id from active_substance where international_name='Alprazolam') from medicine where trade_name='Afobam'
union select medicine_id, (select active_substance_id from active_substance where international_name='Oxymetazoline') from medicine where trade_name='Afrin'
union select medicine_id, (select active_substance_id from active_substance where international_name='Oxymetazoline') from medicine where trade_name='Afrin ND'
union select medicine_id, (select active_substance_id from active_substance where international_name='Pentoxifylline') from medicine where trade_name='Agapurin'
union select medicine_id, (select active_substance_id from active_substance where international_name='Pentoxifylline') from medicine where trade_name='Agapurin SR'
union select medicine_id, (select active_substance_id from active_substance where international_name='Omeprazole') from medicine where trade_name='Agastin'
union select medicine_id, (select active_substance_id from active_substance where international_name='Amlodipine') from medicine where trade_name='Agen'
union select medicine_id, (select active_substance_id from active_substance where international_name='Agomelatine') from medicine where trade_name='Agolek'
union select medicine_id, (select active_substance_id from active_substance where international_name='Agomelatine') from medicine where trade_name='Agomelatine Adamed'
union select medicine_id, (select active_substance_id from active_substance where international_name='Agomelatine') from medicine where trade_name='Agomelatine G.L. Pharma'
union select medicine_id, (select active_substance_id from active_substance where international_name='Agomelatine') from medicine where trade_name='Agomelatine NeuroPharma'
union select medicine_id, (select active_substance_id from active_substance where international_name='Agomelatine') from medicine where trade_name='Agomelatine +pharma'
union select medicine_id, (select active_substance_id from active_substance where international_name='Agomelatine') from medicine where trade_name='Agomelatyna Egis'
union select medicine_id, (select active_substance_id from active_substance where international_name='Clopidogrel') from medicine where trade_name='Agregex'
union select medicine_id, (select active_substance_id from active_substance where international_name='Paracetamol') from medicine where trade_name='Agrypin'
union select medicine_id, (select active_substance_id from active_substance where international_name='Pseudoephedrine') from medicine where trade_name='Agrypin'
union select medicine_id, (select active_substance_id from active_substance where international_name='Dextromethorphan') from medicine where trade_name='Agrypin'
union select medicine_id, (select active_substance_id from active_substance where international_name='Erenumab') from medicine where trade_name='Aimovig'
union select medicine_id, (select active_substance_id from active_substance where international_name='Budesonide') from medicine where trade_name='Airbufo Forspiro'
union select medicine_id, (select active_substance_id from active_substance where international_name='Formoterol') from medicine where trade_name='Airbufo Forspiro'
union select medicine_id, (select active_substance_id from active_substance where international_name='Fluticasone') from medicine where trade_name='AirFluSal Forspiro'
union select medicine_id, (select active_substance_id from active_substance where international_name='Salmeterol') from medicine where trade_name='AirFluSal Forspiro'
union select medicine_id, (select active_substance_id from active_substance where international_name='Fremanezumab') from medicine where trade_name='Ajovy'
union select medicine_id, (select active_substance_id from active_substance where international_name='Biperiden') from medicine where trade_name='Akineton'
union select medicine_id, (select active_substance_id from active_substance where international_name='Biperiden') from medicine where trade_name='Akineton SR'
union select medicine_id, (select active_substance_id from active_substance where international_name='Latanoprost') from medicine where trade_name='Akistan Duo'
union select medicine_id, (select active_substance_id from active_substance where international_name='Timolol') from medicine where trade_name='Akistan Duo'
union select medicine_id, (select active_substance_id from active_substance where international_name='Latanoprost') from medicine where trade_name='Akistan'
union select medicine_id, (select active_substance_id from active_substance where international_name='Trifarotene') from medicine where trade_name='Aklief'
union select medicine_id, (select active_substance_id from active_substance where international_name='Erythromycin') from medicine where trade_name='Aknemycin'
union select medicine_id, (select active_substance_id from active_substance where international_name='Erythromycin') from medicine where trade_name='Aknemycin Plus'
union select medicine_id, (select active_substance_id from active_substance where international_name='Tretinoin') from medicine where trade_name='Aknemycin Plus'
union select medicine_id, (select active_substance_id from active_substance where international_name='Isotretinoin') from medicine where trade_name='Aknenormin'
union select medicine_id, (select active_substance_id from active_substance where international_name='Netupitant') from medicine where trade_name='Akynzeo'
union select medicine_id, (select active_substance_id from active_substance where international_name='Palonosetron') from medicine where trade_name='Akynzeo'
union select medicine_id, (select active_substance_id from active_substance where international_name='Allantoine') from medicine where trade_name='Alantan'
union select medicine_id, (select active_substance_id from active_substance where international_name='Allantoine') from medicine where trade_name='Alantan Plus'
union select medicine_id, (select active_substance_id from active_substance where international_name='Dexpanthenol') from medicine where trade_name='Alantan Plus'
union select medicine_id, (select active_substance_id from active_substance where international_name='Allantoine') from medicine where trade_name='Alantavit'
union select medicine_id, (select active_substance_id from active_substance where international_name='Colecalciferol - vitamin D3') from medicine where trade_name='Alantavit'
union select medicine_id, (select active_substance_id from active_substance where international_name='Aloe') from medicine where trade_name='Alax'
union select medicine_id, (select active_substance_id from active_substance where international_name='Policresulen') from medicine where trade_name='Albothyl'
union select medicine_id, (select active_substance_id from active_substance where international_name='Proxymetacaine') from medicine where trade_name='Alcaine'
union select medicine_id, (select active_substance_id from active_substance where international_name='Amlodipine') from medicine where trade_name='Aldan'
union select medicine_id, (select active_substance_id from active_substance where international_name='Imiquimod') from medicine where trade_name='Aldara'
union select medicine_id, (select active_substance_id from active_substance where international_name='Laronidase') from medicine where trade_name='Aldurazyme'
union select medicine_id, (select active_substance_id from active_substance where international_name='Alectinib') from medicine where trade_name='Alecensa'
union select medicine_id, (select active_substance_id from active_substance where international_name='Levocetirizine') from medicine where trade_name='Alergimed'
union select medicine_id, (select active_substance_id from active_substance where international_name='Desloratadine') from medicine where trade_name='AlergoTeva'
union select medicine_id, (select active_substance_id from active_substance where international_name='Desloratadine') from medicine where trade_name='Aleric Deslo Active'
union select medicine_id, (select active_substance_id from active_substance where international_name='Mometasone') from medicine where trade_name='Aleric Spray'
union select medicine_id, (select active_substance_id from active_substance where international_name='Cetirizine') from medicine where trade_name='Alermed'
union select medicine_id, (select active_substance_id from active_substance where international_name='Rupatadine') from medicine where trade_name='Alerprof'
union select medicine_id, (select active_substance_id from active_substance where international_name='Cetirizine') from medicine where trade_name='Alerzina'
union select medicine_id, (select active_substance_id from active_substance where international_name='Naproxen') from medicine where trade_name='Aleve'
union select medicine_id, (select active_substance_id from active_substance where international_name='Alfuzosin') from medicine where trade_name='Alfabax'
union select medicine_id, (select active_substance_id from active_substance where international_name='Alfacalcidol') from medicine where trade_name='Alfadiol'
union select medicine_id, (select active_substance_id from active_substance where international_name='Alfuzosin') from medicine where trade_name='Alfurion'
union select medicine_id, (select active_substance_id from active_substance where international_name='Alfuzosin') from medicine where trade_name='Alfuzostad'
union select medicine_id, (select active_substance_id from active_substance where international_name='Acetylsalicylic acid') from medicine where trade_name='Alka-Seltzer'
union select medicine_id, (select active_substance_id from active_substance where international_name='Melphalan') from medicine where trade_name='Alkeran'
union select medicine_id, (select active_substance_id from active_substance where international_name='Fexofenadine') from medicine where trade_name='Allegra'
union select medicine_id, (select active_substance_id from active_substance where international_name='Fexofenadine') from medicine where trade_name='Allegra Telfast 180'
union select medicine_id, (select active_substance_id from active_substance where international_name='Cetirizine') from medicine where trade_name='AlleMax'
union select medicine_id, (select active_substance_id from active_substance where international_name='Fexofenadine') from medicine where trade_name='Allertec Fexo'
union select medicine_id, (select active_substance_id from active_substance where international_name='Cetirizine') from medicine where trade_name='Allertec'
union select medicine_id, (select active_substance_id from active_substance where international_name='Cetirizine') from medicine where trade_name='Allertec WZF'
union select medicine_id, (select active_substance_id from active_substance where international_name='Allium sativum') from medicine where trade_name='Alliofil'
union select medicine_id, (select active_substance_id from active_substance where international_name='Allium sativum') from medicine where trade_name='Alliomint'
union select medicine_id, (select active_substance_id from active_substance where international_name='Allopurinol') from medicine where trade_name='Allupol'
union select medicine_id, (select active_substance_id from active_substance where international_name='Amlodipine') from medicine where trade_name='Almiden'
union select medicine_id, (select active_substance_id from active_substance where international_name='Almotriptan') from medicine where trade_name='Almozen'
union select medicine_id, (select active_substance_id from active_substance where international_name='Amlodipine') from medicine where trade_name='Alneta'
union select medicine_id, (select active_substance_id from active_substance where international_name='Minoxidil') from medicine where trade_name='Alocutan Forte'
union select medicine_id, (select active_substance_id from active_substance where international_name='Minoxidil') from medicine where trade_name='Alocutan'
union select medicine_id, (select active_substance_id from active_substance where international_name='Darvadstrocel') from medicine where trade_name='Alofisel'
union select medicine_id, (select active_substance_id from active_substance where international_name='Minoxidil') from medicine where trade_name='Alopexy'
union select medicine_id, (select active_substance_id from active_substance where international_name='Losartan') from medicine where trade_name='Alortia'
union select medicine_id, (select active_substance_id from active_substance where international_name='Amlodipine') from medicine where trade_name='Alortia'
union select medicine_id, (select active_substance_id from active_substance where international_name='Palonosetron') from medicine where trade_name='Aloxi'
union select medicine_id, (select active_substance_id from active_substance where international_name='Brimonidine') from medicine where trade_name='Alphagan'
union select medicine_id, (select active_substance_id from active_substance where international_name='Prednisolone') from medicine where trade_name='Alpicort E'
union select medicine_id, (select active_substance_id from active_substance where international_name='Estradiol') from medicine where trade_name='Alpicort E'
union select medicine_id, (select active_substance_id from active_substance where international_name='Salicylic acid') from medicine where trade_name='Alpicort E'
union select medicine_id, (select active_substance_id from active_substance where international_name='Prednisolone') from medicine where trade_name='Alpicort'
union select medicine_id, (select active_substance_id from active_substance where international_name='Salicylic acid') from medicine where trade_name='Alpicort'
union select medicine_id, (select active_substance_id from active_substance where international_name='Alprazolam') from medicine where trade_name='Alpragen'
union select medicine_id, (select active_substance_id from active_substance where international_name='Alprazolam') from medicine where trade_name='Alprazolam Aurovitas'
union select medicine_id, (select active_substance_id from active_substance where international_name='Alprazolam') from medicine where trade_name='Alprox'
union select medicine_id, (select active_substance_id from active_substance where international_name='Bacitracin') from medicine where trade_name='Altabactin'
union select medicine_id, (select active_substance_id from active_substance where international_name='Neomycin') from medicine where trade_name='Altabactin'
union select medicine_id, (select active_substance_id from active_substance where international_name='Alfuzosin') from medicine where trade_name='Alugen'
union select medicine_id, (select active_substance_id from active_substance where international_name='Brigatinib') from medicine where trade_name='Alunbrig'
union select medicine_id, (select active_substance_id from active_substance where international_name='Venlafaxine') from medicine where trade_name='Alventa'
union select medicine_id, (select active_substance_id from active_substance where international_name='Ciclesonide') from medicine where trade_name='Alvesco'
union select medicine_id, (select active_substance_id from active_substance where international_name='Amantadine') from medicine where trade_name='Amantix'
union select medicine_id, (select active_substance_id from active_substance where international_name='Glimepiride') from medicine where trade_name='Amaryl'
union select medicine_id, (select active_substance_id from active_substance where international_name='Ambroxol') from medicine where trade_name='AmbroHexal'
union select medicine_id, (select active_substance_id from active_substance where international_name='Ambroxol') from medicine where trade_name='Ambroksol Hasco'
union select medicine_id, (select active_substance_id from active_substance where international_name='Ambroxol') from medicine where trade_name='Ambroksol Hasco Junior'
union select medicine_id, (select active_substance_id from active_substance where international_name='Ambroxol') from medicine where trade_name='Ambroksol Hasco Max'
union select medicine_id, (select active_substance_id from active_substance where international_name='Ambroxol') from medicine where trade_name='Ambroksol Takeda'
union select medicine_id, (select active_substance_id from active_substance where international_name='Ambroxol') from medicine where trade_name='Ambrolytin'
union select medicine_id, (select active_substance_id from active_substance where international_name='Ambroxol') from medicine where trade_name='Ambrosol Teva'
union select medicine_id, (select active_substance_id from active_substance where international_name='Ambroxol') from medicine where trade_name='Ambroxol Dr. Max'
union select medicine_id, (select active_substance_id from active_substance where international_name='Cetirizine') from medicine where trade_name='Amertil Bio'
union select medicine_id, (select active_substance_id from active_substance where international_name='Cetirizine') from medicine where trade_name='Amertil'
union select medicine_id, (select active_substance_id from active_substance where international_name='Adalimumab') from medicine where trade_name='Amgevita'
union select medicine_id, (select active_substance_id from active_substance where international_name='Amikacin') from medicine where trade_name='Amikacin B. Braun'
union select medicine_id, (select active_substance_id from active_substance where international_name='Amisulpride') from medicine where trade_name='Amipryd'
union select medicine_id, (select active_substance_id from active_substance where international_name='Amisulpride') from medicine where trade_name='Amisan'
union select medicine_id, (select active_substance_id from active_substance where international_name='Amitriptyline') from medicine where trade_name='Amitriptylinum VP'
union select medicine_id, (select active_substance_id from active_substance where international_name='Carbamazepine') from medicine where trade_name='Amizepin'
union select medicine_id, (select active_substance_id from active_substance where international_name='Atorvastatin') from medicine where trade_name='Amlator'
union select medicine_id, (select active_substance_id from active_substance where international_name='Amlodipine') from medicine where trade_name='Amlator'
union select medicine_id, (select active_substance_id from active_substance where international_name='Perindopril') from medicine where trade_name='Amlessa'
union select medicine_id, (select active_substance_id from active_substance where international_name='Amlodipine') from medicine where trade_name='Amlessa'
union select medicine_id, (select active_substance_id from active_substance where international_name='Perindopril') from medicine where trade_name='Amlessini'
union select medicine_id, (select active_substance_id from active_substance where international_name='Amlodipine') from medicine where trade_name='Amlessini'
union select medicine_id, (select active_substance_id from active_substance where international_name='Amlodipine') from medicine where trade_name='Amlodipine Apotex'
union select medicine_id, (select active_substance_id from active_substance where international_name='Amlodipine') from medicine where trade_name='Amlodipine Aurobindo'
union select medicine_id, (select active_substance_id from active_substance where international_name='Amlodipine') from medicine where trade_name='Amlodipine Aurovitas'
union select medicine_id, (select active_substance_id from active_substance where international_name='Amlodipine') from medicine where trade_name='Amlodipine Bluefish'
union select medicine_id, (select active_substance_id from active_substance where international_name='Amlodipine') from medicine where trade_name='Amlodipine Orion'
union select medicine_id, (select active_substance_id from active_substance where international_name='Amlodipine') from medicine where trade_name='Amlodipine Vitabalans'
union select medicine_id, (select active_substance_id from active_substance where international_name='Amlodipine') from medicine where trade_name='Amlomyl'
union select medicine_id, (select active_substance_id from active_substance where international_name='Amlodipine') from medicine where trade_name='Amlonor'
union select medicine_id, (select active_substance_id from active_substance where international_name='Amlodipine') from medicine where trade_name='Amlopin'
union select medicine_id, (select active_substance_id from active_substance where international_name='Amlodipine') from medicine where trade_name='Amlozek'
union select medicine_id, (select active_substance_id from active_substance where international_name='Amoxicillin and clavulanic acid') from medicine where trade_name='Amoksiklav'
union select medicine_id, (select active_substance_id from active_substance where international_name='Amoxicillin and clavulanic acid') from medicine where trade_name='Amoksiklav Quicktab'
union select medicine_id, (select active_substance_id from active_substance where international_name='Amorolfine') from medicine where trade_name='Amorolak'
union select medicine_id, (select active_substance_id from active_substance where international_name='Amoxicillin') from medicine where trade_name='Amotaks Dis'
union select medicine_id, (select active_substance_id from active_substance where international_name='Amoxicillin') from medicine where trade_name='Amoxicillin Aurovitas'
union select medicine_id, (select active_substance_id from active_substance where international_name='Amoxicillin and clavulanic acid') from medicine where trade_name='Amoxicillin + Clavulanic Acid Aurovitas'
union select medicine_id, (select active_substance_id from active_substance where international_name='Ampicillin') from medicine where trade_name='Ampicillin TZF'
union select medicine_id, (select active_substance_id from active_substance where international_name='Chloroprocaine') from medicine where trade_name='Ampres'
union select medicine_id, (select active_substance_id from active_substance where international_name='Ramipril') from medicine where trade_name='Ampril HD'
union select medicine_id, (select active_substance_id from active_substance where international_name='Hydrochlorothiazide') from medicine where trade_name='Ampril HD'
union select medicine_id, (select active_substance_id from active_substance where international_name='Ramipril') from medicine where trade_name='Ampril HL'
union select medicine_id, (select active_substance_id from active_substance where international_name='Hydrochlorothiazide') from medicine where trade_name='Ampril HL'
union select medicine_id, (select active_substance_id from active_substance where international_name='Ramipril') from medicine where trade_name='Ampril'
union select medicine_id, (select active_substance_id from active_substance where international_name='Amoxicillin and clavulanic acid') from medicine where trade_name='Amylan'
union select medicine_id, (select active_substance_id from active_substance where international_name='Acetylsalicylic acid') from medicine where trade_name='Anacard medica protect'
union select medicine_id, (select active_substance_id from active_substance where international_name='Clomipramine') from medicine where trade_name='Anafranil'
union select medicine_id, (select active_substance_id from active_substance where international_name='Clomipramine') from medicine where trade_name='Anafranil SR'
union select medicine_id, (select active_substance_id from active_substance where international_name='Anagrelide') from medicine where trade_name='Anagrelid Aurovitas'
union select medicine_id, (select active_substance_id from active_substance where international_name='Anagrelide') from medicine where trade_name='Anagrelide Accord'
union select medicine_id, (select active_substance_id from active_substance where international_name='Anagrelide') from medicine where trade_name='Anagrelide Bioton'
union select medicine_id, (select active_substance_id from active_substance where international_name='Anagrelide') from medicine where trade_name='Anagrelide Glenmark'
union select medicine_id, (select active_substance_id from active_substance where international_name='Anagrelide') from medicine where trade_name='Anagrelide Mylan'
union select medicine_id, (select active_substance_id from active_substance where international_name='Anagrelide') from medicine where trade_name='Anagrelide Ranbaxy'
union select medicine_id, (select active_substance_id from active_substance where international_name='Anagrelide') from medicine where trade_name='Anagrelide Sandoz'
union select medicine_id, (select active_substance_id from active_substance where international_name='Anagrelide') from medicine where trade_name='Anagrelide Stada'
union select medicine_id, (select active_substance_id from active_substance where international_name='Anagrelide') from medicine where trade_name='Anagrelide Vipharm'
union select medicine_id, (select active_substance_id from active_substance where international_name='Anagrelide') from medicine where trade_name='Anagrelide Zentiva'
union select medicine_id, (select active_substance_id from active_substance where international_name='Naproxen') from medicine where trade_name='Anapran'
union select medicine_id, (select active_substance_id from active_substance where international_name='Anastrozole') from medicine where trade_name='Anastrozol Bluefish'
union select medicine_id, (select active_substance_id from active_substance where international_name='Anastrozole') from medicine where trade_name='Anastrozol Teva'
union select medicine_id, (select active_substance_id from active_substance where international_name='Fluoxetine') from medicine where trade_name='Andepin'
union select medicine_id, (select active_substance_id from active_substance where international_name='Cyproterone') from medicine where trade_name='Androcur'
union select medicine_id, (select active_substance_id from active_substance where international_name='Finasteride') from medicine where trade_name='Androstatin'
union select medicine_id, (select active_substance_id from active_substance where international_name='Finasteride') from medicine where trade_name='Androster'
union select medicine_id, (select active_substance_id from active_substance where international_name='Testosterone') from medicine where trade_name='Androtop'
union select medicine_id, (select active_substance_id from active_substance where international_name='Lidocaine') from medicine where trade_name='Anesderm'
union select medicine_id, (select active_substance_id from active_substance where international_name='Prilocaine') from medicine where trade_name='Anesderm'
union select medicine_id, (select active_substance_id from active_substance where international_name='Pantoprazole') from medicine where trade_name='Anesteloc'
union select medicine_id, (select active_substance_id from active_substance where international_name='Pantoprazole') from medicine where trade_name='Anesteloc Max'
union select medicine_id, (select active_substance_id from active_substance where international_name='Estradiol and drospirenone') from medicine where trade_name='Angeliq'
union select medicine_id, (select active_substance_id from active_substance where international_name='Anidulafungin') from medicine where trade_name='Anidulafungina Accord'
union select medicine_id, (select active_substance_id from active_substance where international_name='Anidulafungin') from medicine where trade_name='Anidulafungin Sandoz'
union select medicine_id, (select active_substance_id from active_substance where international_name='Umeclidinium bromide') from medicine where trade_name='Anoro Ellipta'
union select medicine_id, (select active_substance_id from active_substance where international_name='Vilanterol') from medicine where trade_name='Anoro Ellipta'
union select medicine_id, (select active_substance_id from active_substance where international_name='Disulfiram') from medicine where trade_name='Anticol'
union select medicine_id, (select active_substance_id from active_substance where international_name='Paracetamol') from medicine where trade_name='Antidol'
union select medicine_id, (select active_substance_id from active_substance where international_name='Codeine') from medicine where trade_name='Antidol'
union select medicine_id, (select active_substance_id from active_substance where international_name='Valeriana officinalis') from medicine where trade_name='Antinervinum'
union select medicine_id, (select active_substance_id from active_substance where international_name='Crataegus sp.') from medicine where trade_name='Antinervinum'
union select medicine_id, (select active_substance_id from active_substance where international_name='Finasteride') from medicine where trade_name='Antiprost'
union select medicine_id, (select active_substance_id from active_substance where international_name='Acetylsalicylic acid') from medicine where trade_name='AntyGrypin dzień'
union select medicine_id, (select active_substance_id from active_substance where international_name='Ascorbic acid - vitamin C') from medicine where trade_name='AntyGrypin dzień'
union select medicine_id, (select active_substance_id from active_substance where international_name='Caffeine') from medicine where trade_name='AntyGrypin dzień'
union select medicine_id, (select active_substance_id from active_substance where international_name='Paracetamol') from medicine where trade_name='AntyGrypin noc'
union select medicine_id, (select active_substance_id from active_substance where international_name='Ascorbic acid - vitamin C') from medicine where trade_name='AntyGrypin noc'
union select medicine_id, (select active_substance_id from active_substance where international_name='Chlorpheniramine') from medicine where trade_name='AntyGrypin noc'
union select medicine_id, (select active_substance_id from active_substance where international_name='Salicylic acid') from medicine where trade_name='Antypot'
union select medicine_id, (select active_substance_id from active_substance where international_name='Boric acid') from medicine where trade_name='Antypot'
union select medicine_id, (select active_substance_id from active_substance where international_name='Olanzapine') from medicine where trade_name='Anzorin'
union select medicine_id, (select active_substance_id from active_substance where international_name='Paracetamol') from medicine where trade_name='Apap ból i gorączka C Plus'
union select medicine_id, (select active_substance_id from active_substance where international_name='Ascorbic acid - vitamin C') from medicine where trade_name='Apap ból i gorączka C Plus'
union select medicine_id, (select active_substance_id from active_substance where international_name='Paracetamol') from medicine where trade_name='Apap Caps'
union select medicine_id, (select active_substance_id from active_substance where international_name='Paracetamol') from medicine where trade_name='Apap dla dzieci Forte'
union select medicine_id, (select active_substance_id from active_substance where international_name='Paracetamol') from medicine where trade_name='Apap Extra'
union select medicine_id, (select active_substance_id from active_substance where international_name='Caffeine') from medicine where trade_name='Apap Extra'
union select medicine_id, (select active_substance_id from active_substance where international_name='Paracetamol') from medicine where trade_name='Apap'
union select medicine_id, (select active_substance_id from active_substance where international_name='Ibuprofen') from medicine where trade_name='Apap intense'
union select medicine_id, (select active_substance_id from active_substance where international_name='Paracetamol') from medicine where trade_name='Apap intense'
union select medicine_id, (select active_substance_id from active_substance where international_name='Paracetamol') from medicine where trade_name='Apap Junior'
union select medicine_id, (select active_substance_id from active_substance where international_name='Paracetamol') from medicine where trade_name='Apap Noc'
union select medicine_id, (select active_substance_id from active_substance where international_name='Diphenhydramine') from medicine where trade_name='Apap Noc'
union select medicine_id, (select active_substance_id from active_substance where international_name='Paracetamol') from medicine where trade_name='Apap Przeziębienie'
union select medicine_id, (select active_substance_id from active_substance where international_name='Ascorbic acid - vitamin C') from medicine where trade_name='Apap Przeziębienie'
union select medicine_id, (select active_substance_id from active_substance where international_name='Phenylephrine') from medicine where trade_name='Apap Przeziębienie'
union select medicine_id, (select active_substance_id from active_substance where international_name='Paracetamol') from medicine where trade_name='Apap Przeziębienie Junior'
union select medicine_id, (select active_substance_id from active_substance where international_name='Ascorbic acid - vitamin C') from medicine where trade_name='Apap Przeziębienie Junior'
union select medicine_id, (select active_substance_id from active_substance where international_name='Phenylephrine') from medicine where trade_name='Apap Przeziębienie Junior'
union select medicine_id, (select active_substance_id from active_substance where international_name='Ropinirole') from medicine where trade_name='Aparxon PR'
union select medicine_id, (select active_substance_id from active_substance where international_name='Clarithromycin') from medicine where trade_name='Apiclar'
union select medicine_id, (select active_substance_id from active_substance where international_name='Aripiprazole') from medicine where trade_name='Apiprax'
union select medicine_id, (select active_substance_id from active_substance where international_name='Sulfogaiacol') from medicine where trade_name='Apipulmol'
union select medicine_id, (select active_substance_id from active_substance where international_name='Sulfogaiacol') from medicine where trade_name='Apitussic'
union select medicine_id, (select active_substance_id from active_substance where international_name='Atorvastatin') from medicine where trade_name='Apo-Atorva'
union select medicine_id, (select active_substance_id from active_substance where international_name='Betahistine') from medicine where trade_name='ApoBetina'
union select medicine_id, (select active_substance_id from active_substance where international_name='Ticlopidine') from medicine where trade_name='Apo-Clodin';


commit;
