const int tempsensor=A5; // Assigning analog pin A5 to variable Temprature 'sensor'
int tempc=0; ; //variable to store temperature in degree Celsius
float vout; //temporary variable to hold sensor reading
int temp_out1_0=2;
int temp_out1_1=3;
int temp_out1_2=4;
int temp_out1_3=5;

int temp_out2_0=6;
int temp_out2_1=7;
int temp_out2_2=8;
int temp_out2_3=9;

int templeft;
int tempright;
const int pump = A0;  // the Arduino pin, which connects to the IN pin of relay


int Moisture_Level;
int Moist_out_0 = 10;//Pin that will output a digital value for the Most Significant Bit for Moisture
int Moist_out_1 = 11;//Pin that will output a digital value for the second bit for Moisture
int Moist_out_2 = 12;//Pin that will output a digital value for the Least Significant Bit for Moisture

int temporary;

void setup() {

  pinMode(tempsensor,INPUT); // Configuring sensor pin as input
  pinMode(pump, OUTPUT); // initialize digital pin A3 as an output.
  pinMode(temp_out1_0, OUTPUT);
  pinMode(temp_out1_1, OUTPUT);
  pinMode(temp_out1_2, OUTPUT);
  pinMode(temp_out1_3, OUTPUT);
  
  pinMode(temp_out2_0, OUTPUT);
  pinMode(temp_out2_1, OUTPUT);
  pinMode(temp_out2_2, OUTPUT);
  pinMode(temp_out2_3, OUTPUT);

  pinMode(Moist_out_0, OUTPUT);
  pinMode(Moist_out_1, OUTPUT);
  pinMode(Moist_out_2, OUTPUT);

  Serial.begin(9600);
}

// the loop routine runs over and over again forever:
void loop() {
  // read the input on analog pin 0:
  int MoistureValue = analogRead(A3);
  Moisture_Level = MoistureValue/128;
  // print out the value you read:
  Serial.print("Moisture: ");
  Serial.print(MoistureValue);
  digitalWrite(Moist_out_0, Moisture_Level %2);
  Moisture_Level = Moisture_Level/2;
  digitalWrite(Moist_out_1, Moisture_Level %2);
  Moisture_Level = Moisture_Level/2;
  digitalWrite(Moist_out_2, Moisture_Level %2);

  Serial.print("=");
  Serial.print(Moist_out_2);
  Serial.print(Moist_out_1);
  Serial.print(Moist_out_0);
  
  vout=analogRead(tempsensor); //Reading the value from sensor

  vout=(vout*500)/1023;

  tempc=vout; // Storing value in Degree Celsius
  
  // ASSIGNING BINARY VALUES
  tempright = tempc%10;
  templeft= tempc/10;
 
  digitalWrite(temp_out1_0, tempright %2);
  tempright = tempright/2;
  digitalWrite(temp_out1_1, tempright %2);
  tempright = tempright/2;
  digitalWrite(temp_out1_2, tempright %2);
  tempright = tempright/2;
  digitalWrite(temp_out1_3, tempright %2);


  digitalWrite(temp_out2_0, templeft %2);
  templeft = templeft/2;
  digitalWrite(temp_out2_1, templeft %2);
  templeft = templeft/2;
  digitalWrite(temp_out2_2, templeft %2);
  templeft = templeft/2;
  digitalWrite(temp_out2_3, templeft %2);


  // assigning binary values
  
  Serial.print("| DegreeC=");
  Serial.print(tempc);
  Serial.print("=");
  Serial.print(temp_out2_3);
  Serial.print(temp_out2_2);
  Serial.print(temp_out2_1);
  Serial.print(temp_out2_0);
  Serial.print(" ");
  Serial.print(temp_out1_3);
  Serial.print(temp_out1_2);
  Serial.print(temp_out1_1);
  Serial.print(temp_out1_0);
  

  
  Serial.println();


  if(MoistureValue>500 or tempc>35)
  {
    digitalWrite(pump, HIGH); // turn on pump for 5 seconds
    delay(5000);
    digitalWrite(pump, LOW);  // turn off pump
  }
  delay(30000000);        // check every 30 mins
}
