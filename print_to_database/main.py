from csv import reader


def read_file(file):
    with open(file, 'r') as read_obj:
        # pass the file object to reader() to get the reader object
        csv_reader = reader(read_obj)
        next(csv_reader)
        # Get all rows of csv from csv_reader object as list of tuples
        records = list(map(list, csv_reader))
        for record in records:
            record[0] = int(record[0])

        for index in range(len(records)):
            records[index] = tuple(records[index])

    return records


def medicine_insert(records):
    for item in range(len(records)):
        print("""INSERT INTO medicine (medicine_id, trade_name, grammage, contraindications, recommendations, 
        prescription_type) VALUES""", f"{records[item]};")


def pharmacy_insert(records):
    for item in range(len(records)):
        print("""INSERT INTO medicine (pharmacy_id, medicine_id, quantity) VALUES""", f"{records[item]};")


def client_insert(records):
    for item in range(len(records)):
        print("""INSERT INTO medicine (client_id, name, surname) VALUES""", f"{records[item]};")


def prescription_insert(records):
    for item in range(len(records)):
        print("""INSERT INTO medicine (prescription_id, expiration_date, client_id, 
        prescription_type) VALUES""", f"{records[item]};")


def prescribed_medicine_insert(records):
    for item in range(len(records)):
        print("""INSERT INTO medicine (medicine_id, prescription_id, quantity) VALUES""", f"{records[item]};")


def active_substance_insert(records):
    for item in range(len(records)):
        print("""INSERT INTO medicine (active_substance_id, name, international_name, 
        description) VALUES""", f"{records[item]};")


def psychotropy_evidence_insert(records):
    for item in range(len(records)):
        print("""INSERT INTO medicine (client_id, active_substance_id, quantity, 
        dispensed_date, pharmacy_id) VALUES""", f"{records[item]};")


def medicine_substance_map_insert(records):
    for item in range(len(records)):
        print("""INSERT INTO medicine (active_substance_id, medicine_id) VALUES""", f"{records[item]};")


def substance_interaction_insert(records):
    for item in range(len(records)):
        print("""INSERT INTO medicine (substance_one, substance_two, description, 
        intensity) VALUES""", f"{records[item]};")


def order_insert(records):
    for item in range(len(records)):
        print("""INSERT INTO medicine (order_id, pharmacy_id, order_date, 
        order_status) VALUES""", f"{records[item]};")


def warehouse_order_item_insert(records):
    for item in range(len(records)):
        print("""INSERT INTO medicine (order_id, quantity, medicine_id) VALUES""", f"{records[item]};")


def availability_in_warehouse_insert(records):
    for item in range(len(records)):
        print("""INSERT INTO medicine (medicine_id, quantity) VALUES""", f"{records[item]};")


if __name__ == '__main__':
    record = read_file("C://Users//Dominika//Desktop//MOCK_DATA.csv")
    medicine_insert(record)
