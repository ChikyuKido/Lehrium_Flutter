import json
from http.server import BaseHTTPRequestHandler, HTTPServer

# Define the test data for different endpoints
data = {
    "/teachers": [
        {
            "id": 1,
            "name": "Alice Smith",
            "imageUrl": "https://images.webuntis.com/image/7046800/alA3o6p8W1zVjmVfadKwkKEYQgnXOmyD",
            "rating": 4.8
        },
        {
            "id": 2,
            "name": "Bob Johnson",
            "imageUrl": "https://images.webuntis.com/image/7046800/OQ2pWK9GeRxEjB3fBEGwJzaglMyd1vn5",
            "rating": 4.5
        },
        {
            "id": 3,
            "name": "Charlie Brown",
            "imageUrl": "https://images.webuntis.com/image/7046800/OQ2pWK9GeRxEjB3fBEGwJzaglMyd1vn5",
            "rating": 4.9
        }
    ],
    "/comments": [
        {
            "commentId": "c1",
            "commentContent": "Great teacher! Very engaging.",
            "creationDate": 1694630400
        },
        {
            "commentId": "c2",
            "commentContent": "Very knowledgeable and helpful.",
            "creationDate": 1694716800
        },
        {
            "commentId": "c3",
            "commentContent": "The lessons were clear and well-structured.",
            "creationDate": 1694803200
        }
    ],
    "/teacherid":
        {
            "teacherId" : 1,
            "teacherName" : "Ulrich Ganz",
            "imageUrl" : "https://images.webuntis.com/image/7046800/OQ2pWK9GeRxEjB3fBEGwJzaglMyd1vn5",
            "rating" : 4.5,
            "teachingSkills": 4.3,
            "kindness": 4.7,
            "engagement": 3.4,
            "organization": 4.6
        }

}

class RequestHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        if self.path in data:
            # Handle /teachers, /comments, and /ratings endpoints
            self.send_response(200)
            self.send_header('Content-Type', 'application/json')
            self.end_headers()

            # Return the data for the requested endpoint
            self.wfile.write(json.dumps(data[self.path]).encode('utf-8'))
        else:
            # Handle 404 Not Found
            self.send_response(404)
            self.send_header('Content-Type', 'application/json')
            self.end_headers()
            self.wfile.write(json.dumps({"error": "Endpoint not found"}).encode('utf-8'))

def run(server_class=HTTPServer, handler_class=RequestHandler, port=8780):
    server_address = ('', port)
    httpd = server_class(server_address, handler_class)
    print(f'Starting httpd server on port {port}...')
    httpd.serve_forever()

if __name__ == '__main__':
    run()
