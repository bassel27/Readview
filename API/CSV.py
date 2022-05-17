from csv import *
csv_folder = "E:\Programming Projects\Readview\API\Books.csv"
append_file = open(csv_folder, "a")
read_file  = open(csv_folder, "r", encoding="utf-8")

csv_appender = writer(append_file, lineterminator="\n")
csv_reader = DictReader(read_file)


def initialize_csv():
    csv_appender.writerow(["Title", "Author", "Quote"])  # header

def write_record_in_csv(title, author, quote):
    csv_appender.writerow([title, author, quote])

def reset_csv_reader():
    global csv_reader
    csv_reader = DictReader(open(csv_folder, "r", encoding="utf-8"))
        

def close_file():
    try:
        append_file.close()
        read_file.close()
    except:
        pass
