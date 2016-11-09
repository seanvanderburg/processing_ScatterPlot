float x;
float y;
float size;

float cat; 
float eig1;
float eig2;
float cat_max;
float cat_min;
float eig1_max;
float eig1_min;
float eig2_max;
float eig2_min;

String[] data;
float[] cat_val;
float[] eig1_val;
float[] eig2_val;
String[] dataSplit;

void setup() {
  size (800, 600);
  rect(0, 0, 400, 300);
  line(0, 300, 400, 0);
}

void draw() {
  data = loadStrings("scatterplot.txt");
  cat_val = new float[data.length];
  eig1_val = new float[data.length];
  eig2_val = new float[data.length];


  splitData();
}

void splitData(){
  for (int i = 1; i < data.length; i++) {
    dataSplit = splitTokens(data[i]);
    cat  = float(dataSplit[0]);
    eig1 = float(dataSplit[1]);
    eig2 = float(dataSplit[2].replaceAll(",", "."));

    cat_val[i] = cat;
    eig1_val[i] = eig1;
    eig2_val[i] = eig2;
    cat_max = max(cat_val);
    cat_min = min(cat_val);
    eig1_max = max(eig1_val);
    eig1_min = min(eig1_val);
    eig2_max = max(eig2_val);
    eig2_min = min(eig2_val);
//
    //TODO auto determine range
    x = map(eig1, 8, 72, 0, 400); 
    y = map(eig2, 200, 1700, 300, 0);
    
    size = map(cat, cat_min, cat_max, 0, 5);
    ellipse(x, y, size, size);
  }
}