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
 insert into pharmacy(pharmacy_name) values('APTEKA POD RATUSZEM');
 insert into pharmacy(pharmacy_name) values('APTEKA SUPER-PHARM');
 insert into pharmacy(pharmacy_name) values('APTEKA OGÓLNODOSTĘPNA "POD PODWÓJNYM ZŁOTYM ORŁEM" SPÓŁKA JAWNA');
 insert into pharmacy(pharmacy_name) values('APTEKA VITA');
 insert into pharmacy(pharmacy_name) values('APTEKA NA SZEWSKIEJ');
 insert into pharmacy(pharmacy_name) values('APTEKA MCCOY'S SPÓŁKA Z OGRANICZONĄ ODPOWIEDZIALNOŚCIĄ');
 insert into pharmacy(pharmacy_name) values('APTEKA DR.MAX');
 insert into pharmacy(pharmacy_name) values('APTEKA SUPER PHARM');
 insert into pharmacy(pharmacy_name) values('APTEKA DR. MAX');
 insert into pharmacy(pharmacy_name) values('APTEKA "TUMSKA"');
 insert into pharmacy(pharmacy_name) values('APTEKA PIASKOWA');
 insert into pharmacy(pharmacy_name) values('APTEKA CEF@RM 36,6');
 insert into pharmacy(pharmacy_name) values('APTEKA WROCŁAWSKA');
 insert into pharmacy(pharmacy_name) values('APTEKA CEF@RM 36,6');
 insert into pharmacy(pharmacy_name) values('APTEKA "ZA FOSĄ"');
 insert into pharmacy(pharmacy_name) values('APTEKA DOM LEKÓW');
 insert into pharmacy(pharmacy_name) values('APTEKA ZIKO');
 insert into pharmacy(pharmacy_name) values('APTEKA ZIKO');
 insert into pharmacy(pharmacy_name) values('APTEKA SŁONECZNA');
 insert into pharmacy(pharmacy_name) values('APTEKA DOM LEKÓW');
 insert into pharmacy(pharmacy_name) values('APTEKA POMORSKA S.C.');
 insert into pharmacy(pharmacy_name) values('APTEKA LEKOSFERA DGA 12');
 insert into pharmacy(pharmacy_name) values('APTEKA ZIEMOWITA');
 insert into pharmacy(pharmacy_name) values('APTEKA SILESIA 3');
 insert into pharmacy(pharmacy_name) values('APTEKA AMICUS III');
 insert into pharmacy(pharmacy_name) values('APTEKA "DR ZDROWIE"');
 insert into pharmacy(pharmacy_name) values('APTEKA CEDRUS');
 insert into pharmacy(pharmacy_name) values('APTEKA GRABISZYŃSKA');
 insert into pharmacy(pharmacy_name) values('APTEKA MEDICOVER APTEKA');
 insert into pharmacy(pharmacy_name) values('APTEKA MEDICOVER');
 insert into pharmacy(pharmacy_name) values('APTEKA');
 insert into pharmacy(pharmacy_name) values('APTEKA O.O. BONIFRATRÓW');
 insert into pharmacy(pharmacy_name) values('APTEKA ZDROWIE');
 insert into pharmacy(pharmacy_name) values('APTEKA "POD SKRZYDŁEM ANIOŁA"');
 insert into pharmacy(pharmacy_name) values('APTEKA "MIESZCZAŃSKA"');
 insert into pharmacy(pharmacy_name) values('APTEKA "BRANIBORSKA"');
 insert into pharmacy(pharmacy_name) values('APTEKA DR.MAX');
 insert into pharmacy(pharmacy_name) values('APTEKA DR.MAX');
 insert into pharmacy(pharmacy_name) values('APTEKA ZIKO');
 insert into pharmacy(pharmacy_name) values('APTEKA API');
 insert into pharmacy(pharmacy_name) values('APTEKA PRZY PRZYCHODNI');
 insert into pharmacy(pharmacy_name) values('APTEKA MAK');
 insert into pharmacy(pharmacy_name) values('APTEKA MEDFARM');
 insert into pharmacy(pharmacy_name) values('APTEKA MAK');
 insert into pharmacy(pharmacy_name) values('APTEKA PINIA');
 insert into pharmacy(pharmacy_name) values('APTEKA LEGE ARTIS S.J.');
 insert into pharmacy(pharmacy_name) values('APTEKA  ŚW.WINCENTEGO');
 insert into pharmacy(pharmacy_name) values('APTEKA VERONICA');
 insert into pharmacy(pharmacy_name) values('APTEKA MAK');
 insert into pharmacy(pharmacy_name) values('APTEKA CZTERY PORY ROKU');
 insert into pharmacy(pharmacy_name) values('APTEKA LEGE ARTIS S.J.');
 insert into pharmacy(pharmacy_name) values('APTEKA "SŁONECZNA"');
 insert into pharmacy(pharmacy_name) values('APTEKA ŚW.TOMASZA');
 insert into pharmacy(pharmacy_name) values('APTEKA SPOŁECZNA NA SĘPA SZARZYŃSKIEGO GRUPA NOWA FARMACJA');
 insert into pharmacy(pharmacy_name) values('APTEKA KATEDRALNA');
 insert into pharmacy(pharmacy_name) values('APTEKA SILESIA');
 insert into pharmacy(pharmacy_name) values('APTEKA SŁONECZNA BIEDRONKA');
 insert into pharmacy(pharmacy_name) values('APTEKA HERBA S.C.DANUTA KONOPACKA,KATARZYNA FIUTOWSKA');
 insert into pharmacy(pharmacy_name) values('APTEKA DR.MAX');
 insert into pharmacy(pharmacy_name) values('APTEKA GINSANA');
 insert into pharmacy(pharmacy_name) values('APTEKA EXPRESSPHARM V');
 insert into pharmacy(pharmacy_name) values('APTEKA "LIBRA"');
 insert into pharmacy(pharmacy_name) values('APTEKA LEGE ARTIS');
 insert into pharmacy(pharmacy_name) values('APTEKA POD SŁOŃCEM');
 insert into pharmacy(pharmacy_name) values('APTEKA "ARKA"');
 insert into pharmacy(pharmacy_name) values('APTEKA WRATISLAVIA II S.C.');
 insert into pharmacy(pharmacy_name) values('APTEKA WRATISLAVIA II');
 insert into pharmacy(pharmacy_name) values('APTEKA ARONIA');
 insert into pharmacy(pharmacy_name) values('APTEKA LEKOSFERA DGA 10');
 insert into pharmacy(pharmacy_name) values('APTEKA HETMAŃSKA');
 insert into pharmacy(pharmacy_name) values('APTEKA NIEZAPOMINAJKA DLA CAŁEJ RODZINY');
 insert into pharmacy(pharmacy_name) values('APTEKA SUPER-PHARM');
 insert into pharmacy(pharmacy_name) values('APTEKA HIPOKRATES');
 insert into pharmacy(pharmacy_name) values('APTEKA LEKOSFERA DGA17');
 insert into pharmacy(pharmacy_name) values('APTEKA TĘCZOWA 3');
 insert into pharmacy(pharmacy_name) values('APTEKA');
 insert into pharmacy(pharmacy_name) values('APTEKA GRUNWALDZKA');
 insert into pharmacy(pharmacy_name) values('APTEKA CEF@RM 36,6');
 insert into pharmacy(pharmacy_name) values('APTEKA MNISZEK SP. J.');
 insert into pharmacy(pharmacy_name) values('"APTEKA PRZY PL. HISZFELDA"');
 insert into pharmacy(pharmacy_name) values('APTEKA');
 insert into pharmacy(pharmacy_name) values('APTEKA CEF@RM 36,6');
 insert into pharmacy(pharmacy_name) values('APTEKA VISCI');
 insert into pharmacy(pharmacy_name) values('APTEKA PIASTOWSKA');
 insert into pharmacy(pharmacy_name) values('APTEKA "GRAFIT"');
 insert into pharmacy(pharmacy_name) values('APTEKA "LEGE ARTIS"');
 insert into pharmacy(pharmacy_name) values('APTEKA RUMIANEK');
 insert into pharmacy(pharmacy_name) values('APTEKA RUBUS');
 insert into pharmacy(pharmacy_name) values('APTEKA ''ALGA'' JOANNA ARAŹNY, ILONA OTLEWSKA S.C.');
 insert into pharmacy(pharmacy_name) values('APTEKA "PRZY PROXIMUM"');
 insert into pharmacy(pharmacy_name) values('APTEKA ALOES');
 insert into pharmacy(pharmacy_name) values('APTEKA SILESIA 4');
 insert into pharmacy(pharmacy_name) values('APTEKA JANTAROWA');
 insert into pharmacy(pharmacy_name) values('APTEKA POD AKACJAMI');
 insert into pharmacy(pharmacy_name) values('APTEKA POD KALINĄ');
 insert into pharmacy(pharmacy_name) values('APTEKA DOM LEKÓW');
 insert into pharmacy(pharmacy_name) values('APTEKA "VITRUM"');
 insert into pharmacy(pharmacy_name) values('APTEKA "HIBISCUS"');
 insert into pharmacy(pharmacy_name) values('APTEKA MEDICOVER APTEKA');
 insert into pharmacy(pharmacy_name) values('APTEKA "ARKADIA"');
 insert into pharmacy(pharmacy_name) values('APTEKA WRATISLAVIA III');
 insert into pharmacy(pharmacy_name) values('APTEKA "CZEKOLADOWA2"');
 insert into pharmacy(pharmacy_name) values('APTEKA "FRANCUSKA"');
 insert into pharmacy(pharmacy_name) values('APTEKA "OSTROBRAMSKA" S.C.');
 insert into pharmacy(pharmacy_name) values('APTEKA NA DAMROTA');
 insert into pharmacy(pharmacy_name) values('APTEKA POPOWICKA');
 insert into pharmacy(pharmacy_name) values('APTEKA FRANCUSKA');
 insert into pharmacy(pharmacy_name) values('APTEKA ACER');
 insert into pharmacy(pharmacy_name) values('APTEKA WRATISLAVIA');
 insert into pharmacy(pharmacy_name) values('APTEKA POD FILAREM');
 insert into pharmacy(pharmacy_name) values('APTEKA');
 insert into pharmacy(pharmacy_name) values('APTEKA');
 insert into pharmacy(pharmacy_name) values('APTEKA AKSAMITNA');
 insert into pharmacy(pharmacy_name) values('APTEKA NA OBORNICKIEJ');
 insert into pharmacy(pharmacy_name) values('APTEKA DR.MAX');
 insert into pharmacy(pharmacy_name) values('APTEKA ŚLICZNA');
 insert into pharmacy(pharmacy_name) values('APTEKA WIŚNIOWA DRIVE');
 insert into pharmacy(pharmacy_name) values('APTEKA LEKOSFERA DGA23');
 insert into pharmacy(pharmacy_name) values('APTEKA "MIODOWA"');
 insert into pharmacy(pharmacy_name) values('APTEKA MAK');
 insert into pharmacy(pharmacy_name) values('APTEKA "MULTI-LEK" SPÓŁKA JAWNA');
 insert into pharmacy(pharmacy_name) values('APTEKA "SŁONECZNA BIEDRONKA"');
 insert into pharmacy(pharmacy_name) values('APTEKA "POŁUDNIOWA"');
 insert into pharmacy(pharmacy_name) values('APTEKA ŻMIGRODZKA');
 insert into pharmacy(pharmacy_name) values('APTEKA SILESIA 2');
 insert into pharmacy(pharmacy_name) values('APTEKA DR.MAX');
 insert into pharmacy(pharmacy_name) values('APTEKA PRZY LEGNICKIEJ');
 insert into pharmacy(pharmacy_name) values('APTEKA NA ZDROWIE');
 insert into pharmacy(pharmacy_name) values('APTEKA SUPER-PHARM APTEKA MAGNOLIA PARK');
 insert into pharmacy(pharmacy_name) values('APTEKA');
 insert into pharmacy(pharmacy_name) values('APTEKA POMARAŃCZOWA');
 insert into pharmacy(pharmacy_name) values('APTEKA WAWRZYNEK S.C.');
 insert into pharmacy(pharmacy_name) values('APTEKA LEKOSFERA DGA 1');
 insert into pharmacy(pharmacy_name) values('APTEKA DR. OPTIMA');
 insert into pharmacy(pharmacy_name) values('APTEKA "POD JAWORAMI"');
 insert into pharmacy(pharmacy_name) values('APTEKA PRZY KRYNICKIEJ');
 insert into pharmacy(pharmacy_name) values('APTEKA BIOGENES.');
 insert into pharmacy(pharmacy_name) values('APTEKA AMICUS II');
 insert into pharmacy(pharmacy_name) values('APTEKA ZDROWIE');
 insert into pharmacy(pharmacy_name) values('APTEKA BIAŁOWIESKA');
 insert into pharmacy(pharmacy_name) values('APTEKA "KARŁOWICKA"');
 insert into pharmacy(pharmacy_name) values('APTEKA MILLENIUM');
 insert into pharmacy(pharmacy_name) values('APTEKA SŁONECZNA BIEDRONKA');
 insert into pharmacy(pharmacy_name) values('APTEKA AMICUS IV');
 insert into pharmacy(pharmacy_name) values('APTEKA AMICUS');
 insert into pharmacy(pharmacy_name) values('APTEKA "WANILIA"');
 insert into pharmacy(pharmacy_name) values('APTEKA Z MISIEM');
 insert into pharmacy(pharmacy_name) values('APTEKA "REMEDIUM"');
 insert into pharmacy(pharmacy_name) values('APTEKA "POD JEMIOŁĄ"');
 insert into pharmacy(pharmacy_name) values('APTEKA WALERIANA');
 insert into pharmacy(pharmacy_name) values('APTEKA DR.MAX');
 insert into pharmacy(pharmacy_name) values('APTEKA BEZPIECZNA');
 insert into pharmacy(pharmacy_name) values('APTEKA NA ZDROWIE');
 insert into pharmacy(pharmacy_name) values('APTEKA PRZY WEIGLA');
 insert into pharmacy(pharmacy_name) values('APTEKA LEKOSFERA DGA 11');
 insert into pharmacy(pharmacy_name) values('APTEKA "AB"  SP. Z O.O.');
 insert into pharmacy(pharmacy_name) values('APTEKA AGAT');
 insert into pharmacy(pharmacy_name) values('APTEKA OLIMPIJSKA');
 insert into pharmacy(pharmacy_name) values('APTEKA TARNOGAJSKA');
 insert into pharmacy(pharmacy_name) values('APTEKA AKADEMICKA');
 insert into pharmacy(pharmacy_name) values('APTEKA EURO-APTEKA');
 insert into pharmacy(pharmacy_name) values('APTEKA "WYSOKOGÓRSKA"');
 insert into pharmacy(pharmacy_name) values('APTEKA PULSANTIS S.C.');
 insert into pharmacy(pharmacy_name) values('APTEKA NA OSTATNIM GROSZU');
 insert into pharmacy(pharmacy_name) values('APTEKA KRÓLEWSKA');
 insert into pharmacy(pharmacy_name) values('APTEKA "TWOJA"');
 insert into pharmacy(pharmacy_name) values('APTEKA LAWENDA');
 insert into pharmacy(pharmacy_name) values('APTEKA "PRZY NETTO"');
 insert into pharmacy(pharmacy_name) values('APTEKA LOBELIA');
 insert into pharmacy(pharmacy_name) values('APTEKA "MALVA"');
 insert into pharmacy(pharmacy_name) values('APTEKA ŚW.WOJCIECHA');
 insert into pharmacy(pharmacy_name) values('APTEKA DR.MAX');
 insert into pharmacy(pharmacy_name) values('APTEKA PRO HOMINE');
 insert into pharmacy(pharmacy_name) values('APTEKA W PRZYCHODNI NA BISKUPINIE');
 insert into pharmacy(pharmacy_name) values('"APTEKA U DAWIDA"');
 insert into pharmacy(pharmacy_name) values('APTEKA NA BULWARZE IKARA');
 insert into pharmacy(pharmacy_name) values('APTEKA HELVETIA');
 insert into pharmacy(pharmacy_name) values('APTEKA DR.MAX');
 insert into pharmacy(pharmacy_name) values('APTEKA "RADIX" SPÓŁKA CYWILNA MARIAN, ŁUKASZ SZLÓSARCZYK');
 insert into pharmacy(pharmacy_name) values('APTEKA LEGE ARTIS');
 insert into pharmacy(pharmacy_name) values('APTEKA "PRZY MARINO"');
 insert into pharmacy(pharmacy_name) values('APTEKA LOTNICZA');
 insert into pharmacy(pharmacy_name) values('APTEKA RÓŻA WIATRÓW S.C.');
 insert into pharmacy(pharmacy_name) values('APTEKA MOJA');
 insert into pharmacy(pharmacy_name) values('APTEKA GRECKA');
 insert into pharmacy(pharmacy_name) values('APTEKA "WERBENA"');
 insert into pharmacy(pharmacy_name) values('APTEKA NIEZAPOMINAJKA DLA CAŁEJ RODZINY');
 insert into pharmacy(pharmacy_name) values('APTEKA SZMARAGDOWA BIS');
 insert into pharmacy(pharmacy_name) values('APTEKA BERBERYS');
 insert into pharmacy(pharmacy_name) values('APTEKA "KRZYCKA"');
 insert into pharmacy(pharmacy_name) values('APTEKA "DA VINCI"');
 insert into pharmacy(pharmacy_name) values('APTEKA KSIĘŻĘCA');
 insert into pharmacy(pharmacy_name) values('APTEKA GEMINI');
 insert into pharmacy(pharmacy_name) values('APTEKA LEGE ARTIS');
 insert into pharmacy(pharmacy_name) values('APTEKA LEGE ARTIS');
 insert into pharmacy(pharmacy_name) values('APTEKA MEDIC');
 insert into pharmacy(pharmacy_name) values('APTEKA TĘCZOWA');
 insert into pharmacy(pharmacy_name) values('APTEKA');
 insert into pharmacy(pharmacy_name) values('APTEKA PRZYJAŹNI');
 insert into pharmacy(pharmacy_name) values('APTEKA "POD DĘBAMI"');
 insert into pharmacy(pharmacy_name) values('APTEKA');
 insert into pharmacy(pharmacy_name) values('APTEKA PRIMA');
 insert into pharmacy(pharmacy_name) values('APTEKA MEDICEO DRIVE');
 insert into pharmacy(pharmacy_name) values('APTEKA BISKUPIN S.C.');
 insert into pharmacy(pharmacy_name) values('APTEKA NOVA');
 insert into pharmacy(pharmacy_name) values('APTEKA POD WĘŻEM');
 insert into pharmacy(pharmacy_name) values('APTEKA NA RONDZIE');
 insert into pharmacy(pharmacy_name) values('APTEKA NA KOZANOWIE');
 insert into pharmacy(pharmacy_name) values('APTEKA CEF@RM 36,6');
 insert into pharmacy(pharmacy_name) values('APTEKA APTEKI ARNIKA');
 insert into pharmacy(pharmacy_name) values('APTEKA AMAVITA');
 insert into pharmacy(pharmacy_name) values('APTEKA LEKOSFERA DGA22');
 insert into pharmacy(pharmacy_name) values('APTEKA OŁTASZYŃSKA');
 insert into pharmacy(pharmacy_name) values('APTEKA ORCHIDEA');
 insert into pharmacy(pharmacy_name) values('APTEKA RODZINNA');
 insert into pharmacy(pharmacy_name) values('APTEKA ABSYNT');
 insert into pharmacy(pharmacy_name) values('APTEKA "PARAFIALNA"');
 insert into pharmacy(pharmacy_name) values('APTEKA DOMOWA "ORCHOWSKA"');
 insert into pharmacy(pharmacy_name) values('APTEKA KRZEMIENIECKA');
 insert into pharmacy(pharmacy_name) values('APTEKA "DOKERSKA"');
 insert into pharmacy(pharmacy_name) values('APTEKA ALPEJSKA');
 insert into pharmacy(pharmacy_name) values('APTEKA KUŻNIKI');
 insert into pharmacy(pharmacy_name) values('APTEKA SIELSKA');
 insert into pharmacy(pharmacy_name) values('APTEKA OLIMPIA');
 insert into pharmacy(pharmacy_name) values('APTEKA "MUCHOBORSKA"');
 insert into pharmacy(pharmacy_name) values('APTEKA CALENDULA');
 insert into pharmacy(pharmacy_name) values('APTEKA');
 insert into pharmacy(pharmacy_name) values('APTEKA AVICENNA');
 insert into pharmacy(pharmacy_name) values('APTEKA SARBINOWSKA');
 insert into pharmacy(pharmacy_name) values('APTEKA BROCHOWSKA');
 insert into pharmacy(pharmacy_name) values('APTEKA VIVALDIEGO');
 insert into pharmacy(pharmacy_name) values('APTEKA DROHOBYCKA');
 insert into pharmacy(pharmacy_name) values('APTEKA "CZEKOLADOWA"');
 insert into pharmacy(pharmacy_name) values('APTEKA "NASZA APTEKA"');
 insert into pharmacy(pharmacy_name) values('APTEKA "NA DOBRE I NA ZŁE" WALDEMAR CIACH');
 insert into pharmacy(pharmacy_name) values('APTEKA NIEZAPOMINAJKA DLA CAŁEJ RODZINY');
 insert into pharmacy(pharmacy_name) values('APTEKA EXPRESSPHARM VII');
 insert into pharmacy(pharmacy_name) values('APTEKA STRACHOCIŃSKA');
 insert into pharmacy(pharmacy_name) values('APTEKA MILLENIUM');
 insert into pharmacy(pharmacy_name) values('APTEKA "OSIEDLOWA"');
 insert into pharmacy(pharmacy_name) values('APTEKA NA WOJNOWIE');
 insert into pharmacy(pharmacy_name) values('APTEKA "POLESKA"');
 insert into pharmacy(pharmacy_name) values('APTEKA "RUMIANKOWA"  "FEMI" S.C.');
 insert into pharmacy(pharmacy_name) values('APTEKA RUMIANEK');
 insert into pharmacy(pharmacy_name) values('APTEKA "LEGE ARTIS"');
 insert into pharmacy(pharmacy_name) values('APTEKA SUPER-PHARM');
 insert into pharmacy(pharmacy_name) values('APTEKA "EXPRESSPHARM"');
 insert into pharmacy(pharmacy_name) values('APTEKA EXPRESSPHARM II');
 insert into pharmacy(pharmacy_name) values('APTEKA SAMBUCUS');
 insert into pharmacy(pharmacy_name) values('APTEKA ZIELONA');
 insert into pharmacy(pharmacy_name) values('APTEKA AKTYWNA');
 insert into pharmacy(pharmacy_name) values('APTEKA DLA ZDROWIA');
 insert into pharmacy(pharmacy_name) values('APTEKA "BEŻOWA"');
 insert into pharmacy(pharmacy_name) values('APTEKA "ZŁOTNICKA"');
 insert into pharmacy(pharmacy_name) values('APTEKA DĘBOWA');
 insert into pharmacy(pharmacy_name) values('APTEKA BELLADONNA');
 insert into pharmacy(pharmacy_name) values('APTEKA "POD ŚW. ANTONIM"');
 insert into pharmacy(pharmacy_name) values('APTEKA EXPRESSPHARM IV');
 insert into pharmacy(pharmacy_name) values('APTEKA LEŚNICKA');
 insert into pharmacy(pharmacy_name) values('APTEKA "OGRODOWA" SPÓŁKA JAWNA');

commit;
