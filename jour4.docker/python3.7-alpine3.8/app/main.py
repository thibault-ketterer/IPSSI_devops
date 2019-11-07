import sys

from flask import Flask

from flask import request

app = Flask(__name__)


@app.route("/")
def hello():
    version = "{}.{}".format(sys.version_info.major, sys.version_info.minor)
    message = "Hello World from Flask in a uWSGI Nginx Docker container with Python {} on Alpine (default)".format(
        version
    )
    return message

@app.route("/addition")
def addition():
    a = int(request.args.get("a"))
    b = int(request.args.get("b"))
    return str(a + b)

@app.route("/toto")
def toto():
    return "toto"


if __name__ == "__main__":
    app.run(host="0.0.0.0", debug=True, port=80)
