import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;

Box2DProcessing box2d;

ArrayList<Boundary> boundaries;

PFont letra;
PFont letra2;
PFont letra3;

Box box;

void setup(){
  size(600,700);
  letra = loadFont("HarlowSolid-70.vlw");
  letra2 = createFont("Arial",18);
  letra3 = createFont("Arial",100);
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0, -0.5);
  
  box = new Box(62,123);

  boundaries = new ArrayList<Boundary>();
  //x,  y,  x ancho,  y alto,  angulo
  
  boundaries.add(new Boundary(302,103,526,6,0));//arriba
  boundaries.add(new Boundary(302,618,526,6,0));//abajo
  boundaries.add(new Boundary(42,360,6,520,0));//izq
  boundaries.add(new Boundary(562,360,6,520,0));
  boundaries.add(new Boundary(414,394,6,367,0));//1
  boundaries.add(new Boundary(433,213,43,6,0));
  boundaries.add(new Boundary(451,175,6,75,0)); 
  boundaries.add(new Boundary(490,140,80,6,0));  
  boundaries.add(new Boundary(304,320,6,74,0));  
  boundaries.add(new Boundary(357,285,111,6,0));
  boundaries.add(new Boundary(414,141,6,79,0));//2
  boundaries.add(new Boundary(378,176,79,6,0));
  boundaries.add(new Boundary(341,288,6,224,0));
  boundaries.add(new Boundary(304,397,80,6,0));
  boundaries.add(new Boundary(305,433,153,6,0));
  boundaries.add(new Boundary(267,358,6,78,0));
  boundaries.add(new Boundary(231,323,79,6,0));
  boundaries.add(new Boundary(194,304,6,42,0));
  boundaries.add(new Boundary(231,286,79,6,0));
  boundaries.add(new Boundary(267,265,6,42,0));
  boundaries.add(new Boundary(286,247,42,6,0));
  boundaries.add(new Boundary(378,213,6,73,0));
  boundaries.add(new Boundary(157,160,6,115,0));//3
  boundaries.add(new Boundary(232,214,150,6,0));
  boundaries.add(new Boundary(303,174,6,75,0));
  boundaries.add(new Boundary(341,138,80,6,0));
  boundaries.add(new Boundary(194,157,6,43,0));//4
  boundaries.add(new Boundary(231,176,79,6,0));
  boundaries.add(new Boundary(267,138,6,78,0));
  boundaries.add(new Boundary(231,118,6,36,0));
  boundaries.add(new Boundary(525,250,6,78,0));//5
  boundaries.add(new Boundary(543,286,44,6,0));
  boundaries.add(new Boundary(524,175,78,6,0));
  boundaries.add(new Boundary(488,249,6,153,0));
  boundaries.add(new Boundary(507,324,43,6,0));
  boundaries.add(new Boundary(451,303,6,115,0));
  boundaries.add(new Boundary(505,360,116,6,0));
  boundaries.add(new Boundary(103,139,43,6,0));
  boundaries.add(new Boundary(65,213,43,6,0));
  boundaries.add(new Boundary(61,359,43,6,0));
  boundaries.add(new Boundary(434,432,43,6,0));  
  boundaries.add(new Boundary(176,470,43,6,0));
  boundaries.add(new Boundary(469,543,43,6,0));
  boundaries.add(new Boundary(506,580,43,6,0));
  boundaries.add(new Boundary(542,542,42,6,0));
  boundaries.add(new Boundary(432,505,43,6,0));
  boundaries.add(new Boundary(102,580,41,6,0));
  boundaries.add(new Boundary(85,192,6,43,0));
  boundaries.add(new Boundary(121,448,6,39,0));
  boundaries.add(new Boundary(341,486,6,39,0));
  boundaries.add(new Boundary(451,486,6,41,0));
  boundaries.add(new Boundary(157,595,6,41,0));
  boundaries.add(new Boundary(230,596,6,41,0));
  boundaries.add(new Boundary(194,559,6,39,0));
  boundaries.add(new Boundary(120,250,6,219,0));
  boundaries.add(new Boundary(525,486,6,189,0));
  boundaries.add(new Boundary(157,322,6,153,0));
  boundaries.add(new Boundary(231,433,6,153,0));
  boundaries.add(new Boundary(158,249,152,6,0));
  boundaries.add(new Boundary(118,432,158,6,0));
  boundaries.add(new Boundary(231,506,80,6,0));
  boundaries.add(new Boundary(488,488,6,116,0));
  boundaries.add(new Boundary(378,561,6,116,0));
  boundaries.add(new Boundary(267,526,6,116,0));
  boundaries.add(new Boundary(84,524,6,116,0));
  boundaries.add(new Boundary(83,285,6,74,0));
  boundaries.add(new Boundary(194,430,6,74,0));
  boundaries.add(new Boundary(157,510,6,74,0));
  boundaries.add(new Boundary(121,544,6,78,0));
  boundaries.add(new Boundary(451,580,6,74,0));
  boundaries.add(new Boundary(122,396,74,6,0));
  boundaries.add(new Boundary(193,360,74,6,0));
  boundaries.add(new Boundary(486,395,74,6,0));
  boundaries.add(new Boundary(378,469,74,6,0));
  boundaries.add(new Boundary(179,543,110,6,0));
  boundaries.add(new Boundary(338,543,74,6,0));
  boundaries.add(new Boundary(304,579,80,6,0));
  boundaries.add(new Boundary(304,491,6,110,0));
  boundaries.add(new Boundary(378,379,6,110,0));
}

void mouseMoved(){
  box.attract(mouseX,mouseY);
 
}

void draw(){
  background(0);
  fill(255);
  textFont(letra2);
  text("Instrucciones: Mueve el mouse para dirigir la figura a través del laberinto ",10,650);
  fill(#D1D1D1);
  textFont(letra);
  text("Neon maze",150,65);
  rect(300,10,600,4);
  rect(300,87,600,4);
  fill(255,0,0);
  rect(543,579,32,68);
  println(mouseX+","+mouseY);
  
  box2d.step();

  // Display all the boundaries
  for (int i = 0; i < boundaries.size(); i++) {
    Boundary wall = (Boundary) boundaries.get(i);
    wall.display();
  }
  
  box.display();
  
}

  

/*
*hacer la meta
*Hacer que a la dirección donde vaya mi mouse, esa zona se ilumine (ver sketch 3d de luz direccional).
*Transcurridos 30 segundos que caigan más partículas y llenen el laberinto.
*Al llegar a la meta que salga pantalla de YOU WIN
-Si después de 1 minuto no ha llegado a la meta YOU LOST
-Poner un if dentro de la clase o la pantalla para que no afecte después de 1 minuto si ha ganado.
*Hacer mis pantallas para el videojuego
-La inicial con el nombre, click en start para empezar (con mousePressed).
-Instrucciones: Mueve el mouse para dirigir la figura a través del laberinto
*/