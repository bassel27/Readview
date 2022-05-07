from flask import Flask, request, jsonify
import CSV

app = Flask(__name__)


@app.route("/")
def return_sth():  # route function
    user_input = str(request.args["query"])
    dic = {}
    for i, line in enumerate(CSV.csv_reader):
        dic[i] = line
    CSV.reset_csv_reader()
    return dic


if __name__ == "__main__":
    app.run(debug=True)  # debug mode makes any errors pop up on the page
