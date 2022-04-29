from csv import *

csv_writer = writer(open("Books.csv", "a"), lineterminator="\n")
csv_reader = DictReader(open("Books.csv", "r", encoding="utf-8"))


def initialize_csv():
    csv_writer.writerow(["Title", "Author", "Quote"])  # header

def write_record_in_csv(title, author, quote):
    csv_writer.writerow([title, author, quote])

def reset_csv_reader():
    global csv_reader
    csv_reader = DictReader(open("Books.csv", "r", encoding="utf-8"))
