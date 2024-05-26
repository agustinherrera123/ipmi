

// Variables
PImage pre1, pre2, pre3;
float contador = 0;
float posx1, posy1, posx2, posy2, posx3, posy3, posx3foto, movimiento1, movimiento2, movimiento3;
int estado = 0; 
String texto1, texto2, texto3, boton;
PFont fuente;

void setup() {
  size(640, 480);
  background(225);
  pre1 = loadImage("pre1.jpeg");
  pre2 = loadImage("pre2.jpeg");
  pre3 = loadImage("pre3.jpeg");
  texto1 = "Preguntados, \neste juego se trata de contestar preguntas según la categoría que te toque en la ruleta. \nSi tu respuesta es correcta se te dará como victoria y si es incorrecta perderás el turno\nEn esta imagen elegís el modo de juego";
  texto2 = "Se gira la ruleta y te toca la categoría";
  texto3 = "Se responde la pregunta. \nSi respondes bien ganas y si respondes mal perdes el turno";
  posx1 = 70;
  posy1 = 30;
  posx2 = 35;
  posy2 = 200;
  posx3 = 35;
  posy3 = 30;
  posx3foto = 0;
  movimiento1 = 1;
  movimiento2 = 0.5;
  movimiento3 = 2;

  fuente = createFont("Arial", 20, true); 
}

void draw() {
  background(255);
  textFont(fuente);
  fill(0);
  textSize(20);
  textAlign(CENTER, TOP);
  
  // contador
  contador++;
  
  
  if (estado < 2 && contador >= 500) {
    estado++;
    contador = 0; // Reinicia el contador
  }

  
  // Imagen 1
  if (estado == 0) {
    image(pre1, 0, 0, width, height);
    textSize(22);
    text(texto1, posx1, posy1, 400, 200);
    if (contador >= 350) {
      posx1 += movimiento1;
    }
  } 
  // Imagen 2
  else if (estado == 1) {
    image(pre2, 0, 0, width, height);
    textSize(25);
    text(texto2, posx2, posy2, 250, 200);
    if (contador >= 25) {
      posy2 += movimiento2;
    }
  } 
  // Imagen 3
  else if (estado == 2) {
    image(pre3, 0, 0, width, height);
    textSize(19);
    text(texto3, posx3, posy3, 250, 200);
    if (contador >= 200) {
      posx3 += movimiento3;
    }

    // Dibujar el botón
    fill(10, 10, 10);
    rect(410, 355, 190, 90);
    fill(255);
    text("Reiniciar", 505, 400);
  }

  println(frameCount);
}

void mousePressed() {
 
  if (estado == 2 && mouseX > 410 && mouseX < 410 + 190 && mouseY > 355 && mouseY < 355 + 90) {
    estado = 0; // Reinicia 
    contador = 0;
    posx1 = 70;
    posy1 = 30;
    posx2 = 35;
    posy2 = 200;
    posx3 = 35;
    posy3 = 30;
    movimiento1 = 1;
    movimiento2 = 0.5;
    movimiento3 = 2;
    posx3foto = 0;
  }
}
