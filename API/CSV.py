from csv import *

append_file = open("Books.csv", "a")
read_file  = open("Books.csv", "r", encoding="utf-8")

csv_appender = writer(append_file, lineterminator="\n")
csv_reader = DictReader(read_file)


def initialize_csv():
    csv_appender.writerow(["Title", "Author", "Quote"])  # header

def write_record_in_csv(title, author, quote):
    csv_appender.writerow([title, author, quote])

def reset_csv_reader():
    global csv_reader
    csv_reader = DictReader(open("Books.csv", "r", encoding="utf-8"))
        

def close_file():
    try:
        append_file.close()
        read_file.close()
    except:
        pass
