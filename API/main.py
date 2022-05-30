# # from flask import Flask, request, jsonify
# # import CSV

# # app = Flask(__name__)


# # @app.route("/")
# # def return_sth():  # route function
# #     user_input = str(request.args["query"])
# #     dic = {}
# #     for i, line in enumerate(CSV.csv_reader):
# #         dic[i] = line
# #     CSV.reset_csv_reader()
# #     print (dic)
# #     return dic


# # if __name__ == "__main__":
# #     app.run(debug=True)  # debug mode makes any errors pop up on the page

# import CSV, json
# dict = {}
# for i, line in enumerate(CSV.csv_reader):
#     dict[i] = line
# with open("API/books.json", "w") as outfile:
#     json.dump(dict, outfile, indent = 2)


