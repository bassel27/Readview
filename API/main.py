from flask import Flask, request, jsonify

app = Flask(__name__)

@app.route('/')
def return_sth(): # route function
    d={}
    user_input = str(request.args['query']) 
    
    
    d['output']= 'LOl'
    return d


if __name__ == '__main__':
    app.run(debug=True) # debug mode makes any errors pop up on the page 