## My Library: net/url & json
Name: Saurabh Verma

http://jsonip.com/ returns a JSON-based result, showing the client’s IP address. I used the net/url library to make a GET request to their server. When the request returned successfully, I used the JSON library to parse the JSON result and display the result, broken down by elements. I sent the request using `get-pure-port` and received a valid response from JSONIP. I then closed the port and used `jsexpr` to read the response.

## Example

After executing the code, here is the output that was displayed in DrRacket's Interactions window:

    ip = 77.121.28.155
    about = /about
    Pro! = http://getjsonip.com

![Diagram](/diagram.png?raw=true "Diagram")

Diagram by Saurabh Verma
