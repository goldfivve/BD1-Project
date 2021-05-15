create type intensity as enum('minor', 'moderate', 'major');
create type order_status as enum('delivered', 'not_yet_placed', 'being_fulfilled');
create type prescription_type as enum('OTC', 'RPW', 'RPZ', 'RP');

create table medicine(
    medicine_id serial primary key,
    trade_name text not null,
    grammage int not null,
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
