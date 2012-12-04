# JSON & Processing 

**Installation instructions at bottom**

---------------

## Processing Sketch
Located in the ***processing_json*** folder.
Requires the [JSON-Processing library](https://github.com/agoransson/JSON-processing/downloads)

[Download the library](https://github.com/agoransson/JSON-processing/downloads) and put it in your Processing Library  ~/Documents/Processing/libraries. Create the 'libraries' directory if it does not already exist. Restart Processing.

Open the procession_json.pde inside Processing application.

---------------

## Flask Web Routes

*   [/circles](http://itppy-realtime-demo.herokuapp.com/circles) - displays web page that allows user to create a new circle
*   [/circle_json](http://itppy-realtime-demo.herokuapp.com/circle_json) - the main JSON data url

### Updating a circle
Provide the circle's embeded doc ID along with color, x, y and size

    /circles/processing_set?id=EMBEDED_DOC_ID&color=FF00FF&x=10&y=10&size=15

### Create a new circle
Just provide the x and y positions. Defaults will be provided for size and color

    /circles/processing_set?x=25&y=100

Or

    /circles/processing_set?x=25&y=100&color=00FF00&size=25
    
