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

insert into prescription(expiration_date, client_id, prescription_type) values ('03/08/2021', 1, 'Rpw');
insert into prescription(expiration_date, client_id, prescription_type) values ('17/03/2022', 2, 'OTC');
insert into prescription(expiration_date, client_id, prescription_type) values ('10/08/2020', 3, 'Rpw');
insert into prescription(expiration_date, client_id, prescription_type) values ('04/02/2021', 4, 'Rp');
insert into prescription(expiration_date, client_id, prescription_type) values ('10/10/2020', 5, 'Rpw');
insert into prescription(expiration_date, client_id, prescription_type) values ('05/11/2021', 6, 'Rpw');
insert into prescription(expiration_date, client_id, prescription_type) values ('15/03/2021', 7, 'OTC');
insert into prescription(expiration_date, client_id, prescription_type) values ('26/07/2021', 8, 'Rpz');
insert into prescription(expiration_date, client_id, prescription_type) values ('08/03/2022', 9, 'Rpz');
insert into prescription(expiration_date, client_id, prescription_type) values ('05/01/2021', 10, 'Rpw');
insert into prescription(expiration_date, client_id, prescription_type) values ('23/11/2020', 11, 'Rpz');
insert into prescription(expiration_date, client_id, prescription_type) values ('03/03/2021', 12, 'OTC');
insert into prescription(expiration_date, client_id, prescription_type) values ('09/10/2020', 13, 'OTC');
insert into prescription(expiration_date, client_id, prescription_type) values ('15/09/2020', 14, 'Rp');
insert into prescription(expiration_date, client_id, prescription_type) values ('05/11/2020', 15, 'Rpw');
insert into prescription(expiration_date, client_id, prescription_type) values ('02/09/2020', 16, 'OTC');
insert into prescription(expiration_date, client_id, prescription_type) values ('29/08/2020', 17, 'Rpw');
insert into prescription(expiration_date, client_id, prescription_type) values ('19/02/2021', 18, 'OTC');
insert into prescription(expiration_date, client_id, prescription_type) values ('06/02/2021', 19, 'Rpz');
insert into prescription(expiration_date, client_id, prescription_type) values ('23/10/2020', 20, 'Rpw');
insert into prescription(expiration_date, client_id, prescription_type) values ('25/10/2020', 21, 'Rp');
insert into prescription(expiration_date, client_id, prescription_type) values ('13/11/2021', 22, 'OTC');
insert into prescription(expiration_date, client_id, prescription_type) values ('02/01/2021', 23, 'Rpw');
insert into prescription(expiration_date, client_id, prescription_type) values ('15/01/2022', 24, 'Rp');
insert into prescription(expiration_date, client_id, prescription_type) values ('11/06/2021', 25, 'Rp');
insert into prescription(expiration_date, client_id, prescription_type) values ('16/01/2022', 26, 'Rp');
insert into prescription(expiration_date, client_id, prescription_type) values ('01/10/2021', 27, 'Rpz');
insert into prescription(expiration_date, client_id, prescription_type) values ('16/04/2022', 28, 'Rpw');
insert into prescription(expiration_date, client_id, prescription_type) values ('31/05/2021', 29, 'Rpw');
insert into prescription(expiration_date, client_id, prescription_type) values ('23/08/2021', 30, 'Rpw');
insert into prescription(expiration_date, client_id, prescription_type) values ('04/05/2021', 31, 'OTC');
insert into prescription(expiration_date, client_id, prescription_type) values ('22/05/2022', 32, 'Rpw');
insert into prescription(expiration_date, client_id, prescription_type) values ('06/02/2022', 33, 'Rp');
insert into prescription(expiration_date, client_id, prescription_type) values ('04/04/2022', 34, 'OTC');
insert into prescription(expiration_date, client_id, prescription_type) values ('19/04/2021', 35, 'Rpw');
insert into prescription(expiration_date, client_id, prescription_type) values ('03/11/2020', 36, 'OTC');
insert into prescription(expiration_date, client_id, prescription_type) values ('24/03/2022', 37, 'Rpw');
insert into prescription(expiration_date, client_id, prescription_type) values ('29/12/2021', 38, 'OTC');
insert into prescription(expiration_date, client_id, prescription_type) values ('14/07/2021', 39, 'Rpz');
insert into prescription(expiration_date, client_id, prescription_type) values ('14/07/2020', 40, 'Rpw');
insert into prescription(expiration_date, client_id, prescription_type) values ('18/05/2022', 41, 'Rpw');
insert into prescription(expiration_date, client_id, prescription_type) values ('06/10/2021', 42, 'Rpz');
insert into prescription(expiration_date, client_id, prescription_type) values ('31/08/2021', 43, 'Rpw');
insert into prescription(expiration_date, client_id, prescription_type) values ('20/04/2022', 44, 'Rpz');
insert into prescription(expiration_date, client_id, prescription_type) values ('16/09/2020', 45, 'OTC');
insert into prescription(expiration_date, client_id, prescription_type) values ('09/09/2021', 46, 'Rpz');
insert into prescription(expiration_date, client_id, prescription_type) values ('28/06/2020', 47, 'Rpz');
insert into prescription(expiration_date, client_id, prescription_type) values ('08/05/2021', 48, 'Rpz');
insert into prescription(expiration_date, client_id, prescription_type) values ('24/05/2021', 49, 'Rpw');
insert into prescription(expiration_date, client_id, prescription_type) values ('12/10/2020', 50, 'OTC');
insert into prescription(expiration_date, client_id, prescription_type) values ('17/06/2021', 51, 'Rpw');
insert into prescription(expiration_date, client_id, prescription_type) values ('04/11/2020', 52, 'Rpz');
insert into prescription(expiration_date, client_id, prescription_type) values ('07/08/2020', 53, 'Rpz');
insert into prescription(expiration_date, client_id, prescription_type) values ('15/01/2022', 54, 'Rpz');
insert into prescription(expiration_date, client_id, prescription_type) values ('24/06/2020', 55, 'Rpw');
insert into prescription(expiration_date, client_id, prescription_type) values ('18/08/2021', 56, 'Rpz');
insert into prescription(expiration_date, client_id, prescription_type) values ('09/04/2021', 57, 'OTC');
insert into prescription(expiration_date, client_id, prescription_type) values ('12/05/2022', 58, 'Rpw');
insert into prescription(expiration_date, client_id, prescription_type) values ('01/10/2021', 59, 'Rpz');
insert into prescription(expiration_date, client_id, prescription_type) values ('16/07/2021', 60, 'Rpw');
insert into prescription(expiration_date, client_id, prescription_type) values ('30/09/2020', 61, 'Rp');
insert into prescription(expiration_date, client_id, prescription_type) values ('20/12/2020', 62, 'Rpw');
insert into prescription(expiration_date, client_id, prescription_type) values ('12/12/2020', 63, 'Rpz');
insert into prescription(expiration_date, client_id, prescription_type) values ('07/09/2021', 64, 'OTC');
insert into prescription(expiration_date, client_id, prescription_type) values ('24/03/2022', 65, 'OTC');
insert into prescription(expiration_date, client_id, prescription_type) values ('10/04/2022', 66, 'Rpw');
insert into prescription(expiration_date, client_id, prescription_type) values ('26/09/2021', 67, 'Rp');
insert into prescription(expiration_date, client_id, prescription_type) values ('29/11/2020', 68, 'Rpz');
insert into prescription(expiration_date, client_id, prescription_type) values ('12/01/2022', 69, 'Rp');
insert into prescription(expiration_date, client_id, prescription_type) values ('29/07/2020', 70, 'OTC');
insert into prescription(expiration_date, client_id, prescription_type) values ('14/12/2020', 71, 'Rpz');
insert into prescription(expiration_date, client_id, prescription_type) values ('23/02/2022', 72, 'Rpw');
insert into prescription(expiration_date, client_id, prescription_type) values ('13/11/2021', 73, 'Rpz');
insert into prescription(expiration_date, client_id, prescription_type) values ('03/06/2021', 74, 'Rp');
insert into prescription(expiration_date, client_id, prescription_type) values ('02/06/2020', 75, 'Rp');
insert into prescription(expiration_date, client_id, prescription_type) values ('04/08/2021', 76, 'Rpw');
insert into prescription(expiration_date, client_id, prescription_type) values ('27/12/2020', 77, 'Rp');
insert into prescription(expiration_date, client_id, prescription_type) values ('03/05/2022', 78, 'Rpw');
insert into prescription(expiration_date, client_id, prescription_type) values ('10/07/2021', 79, 'OTC');
insert into prescription(expiration_date, client_id, prescription_type) values ('30/12/2021', 80, 'Rpw');
insert into prescription(expiration_date, client_id, prescription_type) values ('07/12/2020', 81, 'Rpw');
insert into prescription(expiration_date, client_id, prescription_type) values ('01/07/2021', 82, 'Rpw');
insert into prescription(expiration_date, client_id, prescription_type) values ('17/01/2021', 83, 'Rpz');
insert into prescription(expiration_date, client_id, prescription_type) values ('04/11/2021', 84, 'Rp');
insert into prescription(expiration_date, client_id, prescription_type) values ('25/06/2021', 85, 'Rp');
insert into prescription(expiration_date, client_id, prescription_type) values ('12/12/2020', 86, 'Rp');
insert into prescription(expiration_date, client_id, prescription_type) values ('02/10/2021', 87, 'Rpz');
insert into prescription(expiration_date, client_id, prescription_type) values ('15/10/2020', 88, 'Rpw');
insert into prescription(expiration_date, client_id, prescription_type) values ('20/01/2022', 89, 'Rpw');
insert into prescription(expiration_date, client_id, prescription_type) values ('18/01/2021', 90, 'Rpw');
insert into prescription(expiration_date, client_id, prescription_type) values ('19/09/2020', 91, 'Rpz');
insert into prescription(expiration_date, client_id, prescription_type) values ('30/04/2022', 92, 'OTC');
insert into prescription(expiration_date, client_id, prescription_type) values ('17/05/2021', 93, 'OTC');
insert into prescription(expiration_date, client_id, prescription_type) values ('20/09/2020', 94, 'Rp');
insert into prescription(expiration_date, client_id, prescription_type) values ('20/01/2022', 95, 'Rp');
insert into prescription(expiration_date, client_id, prescription_type) values ('08/01/2022', 96, 'OTC');

commit;
