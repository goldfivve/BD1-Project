import re
from csv import reader
from bs4 import BeautifulSoup
import requests
import random


def url_import():
    pages = ["https://ktomalek.pl/apteki/wroclaw/M264011/af-" + f"{link + 1}" + ".html" for link in range(17)]

    for page in pages:
        response = requests.get(page)
        soup = BeautifulSoup(response.text, 'html.parser')
        links = soup.find_all('a', href=re.compile("apteki/apteka.*wroclaw"))
        for link in links:
            print(f" insert into pharmacy(pharmacy_name) values('{link.text}');")


def read_file(file):
    with open(file, 'r') as read_obj:
        # pass the file object to reader() to get the reader object
        csv_reader = reader(read_obj)
        next(csv_reader)
        # Get all rows of csv from csv_reader object as list of tuples
        records = list(map(list, csv_reader))

        # for record in records:
        #     record[0] = int(record[0])
        #     record[1] = int(record[1])
        #     record[2] = int(record[2])
        #     record[4] = int(record[4])
        # for index in range(len(records)):
        #     records[index] = tuple(records[index])

    return records


def medicine_insert(records):
    for item in range(len(records)):
        print("""insert into medicine (medicine_id, trade_name, grammage, contraindications, recommendations, 
        prescription_type) values""", f"{records[item]};")


def pharmacy_insert(records):
    for item in range(len(records)):
        print("""insert into pharmacy (pharmacy_id, medicine_id, quantity) values""", f"{records[item]};")


def client_insert(records):
    for item in range(len(records)):
        print("""insert into client (client_id, name, surname) values""", f"{records[item]};")


def prescription_insert(records):
    prescription_type = ['OTC', 'Rpw', 'Rpz', 'Rp']

    for item in range(len(records)):
        print("""insert into prescription (expiration_date, client_id, prescription_type) values""",
              f"({records[item]}, '{random.choice(prescription_type)}');")


def warehouse_order_insert(records):
    order_status = ['delivered', 'not_yet_placed', 'being_fulfilled']
    for item in range(len(records)):
        print("""insert into warehouse_order (warehouse_order_id, pharmacy_id, order_date, order_status) values""",
              f"{records[item]}, '{random.choice(order_status)}'),")


def prescribed_medicine_insert():
    for item in range(1001):
        print("""insert into prescribed_medicine (medicine_id, prescription_id, quantity) values""",
              f"({random.randint(1, 565)}, {random.randint(1, 96)}, {random.randint(1, 5)});")


def active_substance_insert(records):
    for item in range(len(records)):
        print("""insert into active_substance (active_substance_id, name, international_name, 
        description) values""", f"{records[item]};")


def psychotropy_evidence_insert(records):
    for item in range(len(records)):
        print("""insert into psychotropy_evidence (client_id, active_substance_id, quantity, dispensed_date, 
        pharmacy_id) values""", f"{records[item]},")


def medicine_substance_map_insert(records):
    for item in range(len(records)):
        print("""insert into medicine_substance_map (active_substance_id, medicine_id) values""", f"{records[item]};")


def substance_interaction_insert(records):
    for item in range(len(records)):
        print("""insert into substance_interaction (substance_one, substance_two, description, 
        intensity) values""", f"{records[item]};")


def warehouse_order_item_insert(records):
    for item in range(len(records)):
        print("""insert into warehouse_order_item (warehouse_order_id, quantity, medicine_id) values""",
              f"{records[item]},")


def availability_in_warehouse_insert(records):
    for item in range(len(records)):
        print("""insert into availability_in_warehouse (medicine_id, quantity) values""", f"{records[item]};")


if __name__ == '__main__':
    record = read_file("C://Users//Dominika//Desktop//MOCK_DATA5.csv")
    psychotropy_evidence_insert(record)
