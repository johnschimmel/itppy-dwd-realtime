
// (Based on Ethernet's WebClient Example)

#include <SPI.h>
#include <WiFly.h>

#include "Credentials.h"

WiFlyClient client("herokuapp.com", 80);

int LED = 4;
int BTN = 2;

int buttonState;             // the current reading from the input pin
int lastButtonState = LOW;   // the previous reading from the input pin

// the following variables are long's because the time, measured in miliseconds,
// will quickly become a bigger number than can be stored in an int.
long lastDebounceTime = 0;  // the last time the output pin was toggled
long debounceDelay = 2000;    // the debounce time; increase if the output flickers

void setup() {

  Serial.begin(9600);

  WiFly.begin();

  if (!WiFly.join(ssid, passphrase)) {
    Serial.println("Association failed.");
    while (1) {
      // Hang on failure.
    }
  }  

  Serial.println("connecting...");
  if (client.connect()) {
    Serial.println("connected.");
  } 
  else {
    Serial.println("connection failed");
  }


  pinMode(LED, OUTPUT);
  pinMode(BTN, INPUT);
}

void loop() {

  if (digitalRead(BTN) == HIGH) {
    if (!client.connected()) {
      Serial.println("reconnecting");
      client.connect();
    }
    digitalWrite(LED, HIGH);

    Serial.println("sending");
    client.print("GET ");
    client.print("/t");
    client.println(" HTTP/1.1");    
    client.println("Host: itppy-realtime-demo.herokuapp.com");
    client.println(); 
  }

 


  if (client.available()) {
    Serial.println("reading in data");
    while (client.available()) {
      char c = client.read();
      Serial.print(c);

    }
    
  } else {
   digitalWrite(LED, LOW); 
  }

}


















