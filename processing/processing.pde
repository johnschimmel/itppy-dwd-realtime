import org.json.*;

ArrayList circles;
Timer timer;

String BASE_URL = "http://127.0.0.1:5000";

void setup() {
  circles = new ArrayList();

  getMainData();

  timer = new Timer(5000);
  timer.start();

  size(400, 300);
}

void draw() {
  background(255);

  //display circles
  if (circles.isEmpty() == false) {
    for (int i=0; i<circles.size(); i++) {

      Circle tmpCircle = (Circle) circles.get(i);
      tmpCircle.display();
    }
  }

  //check timer
  if (timer.isFinished()) {
    println("timer is finished");
    getMainData();
    timer.start();
  }
}


JSONObject fetchJSON(String URL_PATH) {


  // Get the JSON formatted response
  String response = loadStrings(BASE_URL + URL_PATH)[0];

  // Make sure we got a response.
  if ( response != null ) {
    // Initialize the JSONObject for the response
    JSONObject jsonRoot = new JSONObject( response );
    println("inside fetchJSON");
    println(jsonRoot.toString());
    return jsonRoot;
  } 
  else {
    return null;
  }
}

void getMainData() {

  String mainURL = "/circle_json";
  JSONObject jsonData = fetchJSON(mainURL);
  println(mainURL);

  // Get the "circles" JSONObject
  JSONArray circles = jsonData.getJSONArray("circles");
  //println(circles);
  getCircles(circles); //loop through array of circles and create Circle objects
}

void getCircles(JSONArray jsonCircles) {

  // empty current circles ArrayList
  circles = new ArrayList();

  if (jsonCircles == null) {
  } 
  else {
    // loop through all jsonCircles
    for (int i=0; i<jsonCircles.length(); i++) {
      JSONObject tmpCircle = (JSONObject)jsonCircles.opt(i);

      String _color = tmpCircle.optString("color");  
      int _xpos = tmpCircle.optInt("xpos");
      int _ypos = tmpCircle.optInt("ypos");
      int _size = tmpCircle.optInt("size");
      String _id = tmpCircle.optString("_id");

      //create and add circle to 'circles' ArrayList
      Circle testCircle = new Circle(_color, _xpos, _ypos, _size, _id);
      circles.add(testCircle); // put into ArrayList of Circles
    }
  }
}

void mouseClicked() {

  // prepare url to create a new circle with x and y position
  String createCircleURL = "/circles/processing_set?xpos=" + mouseX + "&ypos="+ mouseY;
  JSONObject updatedJSON = fetchJSON(createCircleURL);
  println("mouse clicked");

  // redraw the circles with the returned/updated JSON
  JSONArray circles = updatedJSON.getJSONArray("circles");
  getCircles(circles);
}

