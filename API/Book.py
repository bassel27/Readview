from itertools import tee
from os import remove

class Book:
    def __init__(self, title, author, quotes):
        self.title = title
        self.author = author
        self.quotes = quotes

    def remove_weird_characters(quote):
        quote = quote.encode("ascii", "ignore")  # ignores non-ascii characters
        quote = quote.decode()
        return quote

    

        
