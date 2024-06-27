//Eros Douglas Benitez Dos Santos

/*
Aclaracion los botones estan mal ubicados a conciencia
recuerden que la idea es que no llegues al final del juego sino que lo cierres antes
por eso tambien la decision de usar comic sans en todo el juego.

Recomiendo que los niveles especial los jueguen en la resolucion nativa.
Aun no encontre como solucionar este bug. Posiblemente lo mueva a un motor.

Contiene lenguaje ofensivo, comentarios xenofobos, homofobos y pensamientos hostiles.

stoppen sie die hand versuchen zu arbeiten enrealidad es:
Paren la mano, prueben laburando pero como en aleman parece una referencia a la
masturbacion se quedo XD.

*/
//Paso los parametros de resolucion
float iniWidth = 1200; 
float iniHeight = 720;
//Importo minim
import ddf.minim.*;


//Cargo tipografia comic sans
PFont font; // Declarar la variable

int status = 0;
//Reproducir con minim

AudioPlayer  songs_inicio, songs_pags, songs_efecto, songs_level,
songs_level1, songs_level2 , songs_level3, songs_level4, songs_level5,
songs_level6, songs_level7, songs_level8, songs_level9, songs_level10,
songs_level11, songs_level12 , songs_level13, songs_level14, songs_level15,
songs_level16, songs_level17, songs_level18, songs_level19, songs_level20,
songs_level21, songs_level22, songs_level23;

Minim minim;



//Objetos
Menu menuInicio = new Menu(); //Creo objeto menu
Juego inicioJuego = new Juego(); //Creo objeto juego


//Variables
//Para iniciar en el menu
int menu = 0; 
//Estado de la escena
int escena_juego = 0; 
//Pagina menu de escenas
int pag = 0;
//Numero de escena
int escena = 0;
//Contador de texto para los dialogos
int viejotexto = -1;
int texto = 0;
//Declaro respuesta siempre verdadero para poder cambiar el texto
int pregunta = 0;
//Declaro respuesta siempre verdadero para poder cambiar el texto
boolean respuesta = true;
//Cargo todas las variables de las imagenes que uso
PImage fondo, fondo_escenas, fondo_menu, boton_jugar, boton_escenas,  boton_menu, boton_salir, caja_texto, lenguaje, roles, mascara_fondo, oscuridad, boton_siguiente, fondo_escena_oscuro, meme, nave, asteroide_imagen;
//Declaro mutear como false para que empieze con audio
boolean mutear = false;
//Variable Linterna
float linterna;
//PGraphics para crear la mascara de la linterna
PGraphics mascara_linterna;

///Mini juego 2
PFont fuenteAsteroides; // Fuente para el mini juego 2
ArrayList asteroides; //Lista de asteroides
int precision = 1; // Precision de disparo mini juego 2
int tiempo; // Tiempo mini juego 2
int velocidad = 1; // Velocidad de asteroides mini juego 2
int vidas = 1; // Vidas asteroides mini juego 2
int puntaje; // Puntaje mini juego 2
float aciertos; // Disparos acertados mini juego 2
float tiros; // Cantidad de tiros disparados mini juego 2 
boolean tiro; //Boolean de disparo para mini juego 2
boolean derrota; // Boolean de derrota mini juego 2
int contador = 0;

//Parametros para escribir nombre
final String primermensaje = "Escribe tu nombre y da un click";
String mensaje = primermensaje;
String mensajenuevo= mensaje;


void setup(){

  
  surface.setSize (1200, 720);// Tamaño del Lienzo
  surface.setLocation(0,0);
  //Habilito redimencion
  surface.setResizable(true);
  //Titulo de programa
  surface.setTitle("Una conversacion con El Roles");
  

  //Fuentes
  font = loadFont("ComicSansMS-38.vlw"); // Leer la fuente
  textFont(font);//La declaro como la fuente en uso
  
  //Para evitar errores framerate a 60fps
  frameRate(60);
  
  //Parametros de linterna
  linterna = 100;
  
  //Imagenes
  roles=loadImage("img/roles_normal.png");// Sprite El Roles
  caja_texto=loadImage("img/dialogo.png");// Cuadro de dialogo
  lenguaje=loadImage("img/señas.png");//Lenguajes en señas y braille
  oscuridad = loadImage("img/oscuridad.png");// Fondo y mascara del minu juego 1 
  boton_siguiente = loadImage("img/boton_siguiente.png");//Boton de siguiente mini juego 1 y 2
  meme= loadImage("img/rubio_salvaje.png"); //Memes de Jynx/Robots/Veganos
  nave = loadImage("img/nave.png");//Nave mini juego 2
  asteroide_imagen = loadImage("img/asteroide.png");//Imagen asteriodes
  
  //Mini juego 2
  fuenteAsteroides = loadFont("ComicSansMS-20.vlw");//Defino la fuente para el mini juego 2
  asteroides = new ArrayList();// Creo el array de los asteroides para el mini juego 2
  
  //Audio
  minim = new Minim(this);
  
  /*
  Todas las canciones fuero hechas en 8 bits para este tp por mi
  Algunas las grabe de 0 por lo que no siguen mucho es esquema de las originales.
  Otras simplemente las converti en 8 bits con ayuda de plugins en audition.
  Los instrumentos que utilice fueron trompeta, violin, guitarra, bajo, cajon peruano, un piano
  y algunos arreglos los hice con llaves y vasos. 
  Dejo el nombre de la cancion original de igual manera
  */
  //Menus || Clock media - Shinigamy19
  songs_inicio = minim.loadFile("music/cancion_pag.mp3",1024);
  songs_pags = minim.loadFile("music/cancion_pag.mp3",1024);
  
  //Efecto disparo mini juego 2
  songs_efecto = minim.loadFile("music/efecto.mp3",1024);
  
  //Intro        || Welcome the word - Pokemon rojo fuego
  songs_level = minim.loadFile("music/cancion.mp3",1024);
  //Nombre       || Whatsername - Green Day
  songs_level1 = minim.loadFile("music/cancion1.mp3",1024);
  //Edad         || Pendeviejo - Los autenticos decadentes 
  songs_level2 = minim.loadFile("music/cancion2.mp3",1024);
  //Menor de 18  || Never gonna give you up - Rick Astley
  songs_level3 = minim.loadFile("music/cancion3.mp3",1024);
  //18 a 30 años || Basket case - Green Day 
  songs_level4 = minim.loadFile("music/cancion4.mp3",1024);
  //Mayor de 30  || Presente - Vox Dei
  songs_level5 = minim.loadFile("music/cancion5.mp3",1024);
  //Genero       || Something human - Muse
  songs_level6 = minim.loadFile("music/cancion6.mp3",1024);
  //Hombre       || Simple man - Lynyrd Skynyrd
  songs_level7 = minim.loadFile("music/cancion7.mp3",1024);
  //Mujer        || Man i feel like a woman - Shania Twain 
  songs_level8 = minim.loadFile("music/cancion8.mp3",1024);
  //Otros        || Pluma gay - Los Morancos
  songs_level9 = minim.loadFile("music/cancion9.mp3",1024);
  //Alimentos    || Keine lust - Rammstein
  songs_level10 = minim.loadFile("music/cancion10.mp3",1024);
  //Veganos      || Vicinity of obscenity - System of a down
  songs_level11 = minim.loadFile("music/cancion11.mp3",1024);
  //No Veganos   || Cheese burger paradise - Jimmy Buffett
  songs_level12 = minim.loadFile("music/cancion12.mp3",1024);
  //Sistemas     || Around the world - Daft punk
  songs_level13 = minim.loadFile("music/cancion13.mp3",1024);
  //Capitalismo  || Dont tread on me - Metallica
  songs_level14 = minim.loadFile("music/cancion14.mp3",1024);
  //Comunismo    || Himno de URSS
  songs_level15 = minim.loadFile("music/cancion15.mp3",1024);
  //Religion     || Losing my religion - REM
  songs_level16 = minim.loadFile("music/cancion16.mp3",1024);
  //A favor      || Take me to church - Hozier
  songs_level17 = minim.loadFile("music/cancion17.mp3",1024);
  //En contra    || Suite Pee - System of a down
  songs_level18 = minim.loadFile("music/cancion18.mp3",1024);
  //Robo         || Crimen - Gustavo Cerati
  songs_level19 = minim.loadFile("music/cancion19.mp3",1024);
  //A Favor      || Devuelveme a mi chica - Hombres g
  songs_level20 = minim.loadFile("music/cancion20.mp3",1024);
  //En contra    || Sr. Cobranza - Bersuit vergarabat
  songs_level21 = minim.loadFile("music/cancion21.mp3",1024);
  //Final        || Want You Gone - Jonathan Coulton
  songs_level22 = minim.loadFile("music/cancion22.mp3",1024);
  //Minijuego 2  || Aerodinamycs - Daft punk
  songs_level23 = minim.loadFile("music/cancion23.mp3",1024);
}

void settings(){
  size(1200, 720,P2D);
  PJOGL.setIcon("img/icono.png");
}
  
void draw(){
  //Maximizar

  scale(width/iniWidth, height/iniHeight);
  rectMode(CENTER);

  //Print para saber donde estoy y las cordenadas
  println("PosX:", mouseX, "PosY:", mouseY, "Menu:", menu, "Pag Menu:", pag, "Escena:", escena,"Texto:", texto,"Viejo texto:", viejotexto, "Respuesta:", respuesta, "Muteado:", mutear);
  if (menu == 0)
  { //Si menu es 0 se dan las opciones de menu
    menuInicio.menu_inicio();
    songs_inicio.play();
    songs_level22.rewind();
    songs_level22.pause();
    songs_pags.rewind();
    songs_pags.pause();
    
  }
  else if ((menu == 1) && (pag == 1)){
  //Escenas
  songs_pags.play();
  menuInicio.menu_pag();
  songs_inicio.rewind();
  songs_inicio.pause();
  }
  else if ((menu == 1) && (pag == 2)){
  //Escenas 2
  menuInicio.menu_pag_2();
  }
  else if ((menu == 1) && (pag == 3)){
  //Escenas 3
  menuInicio.menu_pag_3();
  }
  else if ((menu == 2) && (escena == 0)){
  //Empiezo el juego
  inicioJuego.escena_0();
  
  //Pauso los audios
  songs_pags.pause(); 
  songs_inicio.pause();
  //Play al correspondiente
  songs_level.play();
  
  //Agrego la fuente para evitar errores
  textFont(font);
  
  //Esto se aplica a todas las demas escenas
  }
  else if ((menu == 2) && (escena == 1)){
  //Pregunta por el nombre
  inicioJuego.escena_1();
  
  songs_pags.pause(); 
  songs_level.pause(); 
  songs_level1.play();
  
  textFont(font);
  }
  else if ((menu == 2) && (escena == 2)){
  //Pregunta sobre la edad
  inicioJuego.escena_2();
  
  songs_level1.pause();
  songs_pags.pause();  
  songs_level2.play();
  textFont(font);
  }
  else if ((menu == 2) && (escena == 3)){
  //Si es menor de 18 
  inicioJuego.escena_3();

  songs_level2.pause();
  songs_pags.pause(); 
  songs_level3.play();
  textFont(font);
  }
  else if ((menu == 2) && (escena == 4)){
  //Si tienen entre 18 y 30
  songs_level2.pause();
  songs_pags.pause(); 
  songs_level4.play();
  inicioJuego.escena_4();
  textFont(font);
  }
  else if ((menu == 2) && (escena == 5)){
  //Si es mayor de 30
  songs_pags.pause(); 
  songs_level2.pause();
  songs_level5.play();
  inicioJuego.escena_5();
  textFont(font);
  }
  else if ((menu == 2) && (escena == 6)){
  //pregunta por el genero
  songs_pags.pause(); 
  songs_level4.pause();
  songs_level6.play();
  inicioJuego.escena_6();
  textFont(font);
  }
  else if ((menu == 2) && (escena == 7)){
  //Hombre
  songs_pags.pause(); 
  songs_level6.pause();
  songs_level7.play();
  inicioJuego.escena_7();
  textFont(font);
  }
  else if ((menu == 2) && (escena == 8)){
  //Mujer
  songs_pags.pause(); 
  songs_level6.pause();
  songs_level8.play();
  inicioJuego.escena_8();
  textFont(font);
  }
  else if ((menu == 2) && (escena == 9)){
  //Otro
  songs_pags.pause(); 
  songs_level6.pause();
  songs_level9.play();
  inicioJuego.escena_9();
  textFont(font);
  }
  else if ((menu == 2) && (escena == 10)){
  //Alimentación
  songs_pags.pause();
  songs_level7.pause();
  songs_level8.pause();
  songs_level9.pause();
  songs_level10.play();
  inicioJuego.escena_10();
  textFont(font);
  }
  else if ((menu == 2) && (escena == 11)){
  //Vegano
  songs_pags.pause(); 
  songs_level10.pause();
  songs_level11.play();
  inicioJuego.escena_11();
  textFont(font);
  }
  else if ((menu == 2) && (escena == 12)){
  //Omnivoro
  songs_pags.pause(); 
  songs_level10.pause();
  songs_level12.play();
  inicioJuego.escena_12();
  textFont(font);
  }
  else if ((menu == 2) && (escena == 13)){
  //Opinión de distintos sistemas
  songs_pags.pause(); 
  songs_level11.pause();
  songs_level12.pause();
  songs_level13.play();
  inicioJuego.escena_13();
  textFont(font);
  }
  else if ((menu == 2) && (escena == 14)){
  //Capitalista
  songs_pags.pause(); 
  songs_level13.pause();
  songs_level14.play();
  inicioJuego.escena_14();
  textFont(font);
  }
  else if ((menu == 2) && (escena == 15)){
  //Comunista
  songs_pags.pause(); 
  songs_level13.pause();
  songs_level15.play();
  inicioJuego.escena_15();
  textFont(font);
  }
  else if ((menu == 2) && (escena == 16)){
  //Opinión sobre las religiones
  songs_pags.pause();
  songs_level14.pause();
  songs_level15.pause();
  songs_level23.pause();
  songs_level16.play();
  inicioJuego.escena_16();
  textFont(font);
  }
  else if ((menu == 2) && (escena == 17)){
  //A favor
  songs_pags.pause(); 
  songs_level16.pause();
  songs_level17.play();
  inicioJuego.escena_17();
  textFont(font);
  }
  else if ((menu == 2) && (escena == 18)){
  //En contra 
  songs_pags.pause(); 
  songs_level16.pause();
  songs_level18.play();
  inicioJuego.escena_18();
  textFont(font);
  }
  else if ((menu == 2) && (escena == 19)){
  //Pregunta sobre el robo
  songs_pags.pause(); 
  songs_level17.pause();
  songs_level18.pause();
  songs_level19.play();
  inicioJuego.escena_19();
  textFont(font);
  }
  else if ((menu == 2) && (escena == 20)){
  //A favor
  songs_pags.pause(); 
  songs_level19.pause();
  songs_level20.play();
  inicioJuego.escena_20();
  textFont(font);
  }
  else if ((menu == 2) && (escena == 21)){
  //En contra
  songs_pags.pause(); 
  songs_level19.pause();
  songs_level21.play();
  inicioJuego.escena_21();
  textFont(font);
  }
  else if ((menu == 2) && (escena == 22)){
  //Final
  songs_pags.pause();
  songs_level20.pause();
  songs_level21.pause();
  songs_level22.play();
  inicioJuego.escena_22();
  textFont(font);
  }
  else if ((menu == 2) && (escena == 23)){
  //Mini juego 2
  songs_pags.pause();
  songs_level15.pause();
  songs_level23.play();
  inicioJuego.escena_23();
   textFont(fuenteAsteroides);
  }
  else if ((menu == 2) && (escena == 24)){
  //Rocola
  songs_pags.pause();
  inicioJuego.escena_24();
  textFont(font);
  }
  else if (menu == 3){
  //Menu informacion
  songs_inicio.rewind();
  songs_inicio.pause();
  menuInicio.menu_informacion();
  textFont(font);
  }


}

//Creo class para controlar la escena menu
class Menu
{  
  void menu_inicio()
  {
    //cargo el fondo
    fondo = loadImage("img/menu.png");
    image(fondo, 0, 0);   
    //cargo los botones

    
    //Boton Jugar
    if((mouseX > 371 * width/iniWidth ) && (mouseX < 774 * width/iniWidth))
    {
      if ((mouseY > 173 * height/iniHeight ) && (mouseY < 280 * height/iniHeight))
      {
        if (mousePressed == true){
          delay(500); 
          //Marco menu como 2 para que empiece el juego
           menu = 2; 
           escena= 0;
           texto= 0;
           pregunta = 0;
         // println("funciona");
        }
      }
    }
    //Boton Escenas
    if((mouseX > 455 * width/iniWidth) && (mouseX < 837 * width/iniWidth))
    {
      if ((mouseY > 436 * height/iniHeight) && (mouseY < 539 * height/iniHeight))
      {
        if (mousePressed == true)
        {
          delay(500);
          //Marca menu 1 para pasar al selector de escenas
          menu = 1; 
          //Inicia en la pagina 1
          pag = 1; 
         // println("funciona");
        }
      }
    }
    
    //Boton Informacion
    if((mouseX > 43 * width/iniWidth) && (mouseX < 426 * width/iniWidth))
    {
      if ((mouseY > 575 * height/iniHeight) && (mouseY < 684 * height/iniHeight))
      {
        if (mousePressed == true)
        {  
           delay(500);
           menu=3;
        }     
      }
    }
    
    //Boton Salir
    if((mouseX > 55 * width/iniWidth) && (mouseX < 436 * width/iniWidth))
    {
      if ((mouseY > 324 * height/iniHeight) && (mouseY < 436 * height/iniHeight))
      {
        if (mousePressed == true)
        {
          exit();
          //println("funciona");
        }     
      }
    }
  }
  //Menu de escenas
  void menu_pag()
  {  
    
    //Dejo el print que use para el correcto funcionamiento de los boxes
    // println("funciona");
    //Pagina 1 del selector de escenas
    if(pag == 1)
    {
      fondo_menu = loadImage("img/fondo_menu.png");
      image(fondo_menu, 0, 0); 
      
    //Boton escena 1 Nombre
    if((mouseX > 92 * width/iniWidth) && (mouseX < 340 * width/iniWidth))
    {
      if ((mouseY > 115 * height/iniHeight) && (mouseY < 274 * height/iniHeight))
      {
          if (mousePressed == true)
          { 
            //Marcamos menu 2 como escena actual para dirigirnos al juego
            menu = 2;
            //Definimos texto en 0 para que empiece en el primer dialogo
            texto = 0;
            //Marcamos escena 1 que es la siguiente a la presentacion
            escena = 1; 
            //Definimos la pregunta como 0 para reiniciar el pedido de accion
           pregunta= 0;
          }
       }
     }
    //Boton escena 2 Edad
    if((mouseX > 344 * width/iniWidth) && (mouseX < 683 * width/iniWidth))
    {
      if ((mouseY > 131* height/iniHeight ) && (mouseY < 293* height/iniHeight))
      {
          if (mousePressed == true)
          { 
            menu = 2;
            texto = 0;
            escena = 2; 
            pregunta= 0;
          }
       }
     }
    
    //Boton escena 3 Genero
    if((mouseX > 826 * width/iniWidth) && (mouseX < 1070 * width/iniWidth))
    {
      if ((mouseY > 51* height/iniHeight ) && (mouseY < 212* height/iniHeight))
      {
          if (mousePressed == true)
          {
            delay(500); 
            menu = 2;
            texto = 0;
            escena = 6; 
            pregunta= 0;
          }
       }
     }
    //Boton escena 4 Alimentacion
    if((mouseX > 114 * width/iniWidth) && (mouseX < 367 * width/iniWidth))
    {
      if ((mouseY > 446 * height/iniHeight) && (mouseY < 607* height/iniHeight))
      {
          if (mousePressed == true)
          {
            delay(500); 
            menu = 2;
            pregunta=0;
            texto = 0;
            escena = 10; 
          }
       }
     }
     
    //Boton escena 5 sistemas
    if((mouseX > 560 * width/iniWidth) && (mouseX < 811 * width/iniWidth))
    {
      if ((mouseY > 511 * height/iniHeight) && (mouseY < 672* height/iniHeight))
      {
          if (mousePressed == true)
          {
            delay(500); 
            menu = 2;
            pregunta=0;
            texto = 0;
            escena = 13; 
          }
       }
     }
     
    //Boton escena 6 religion
    if((mouseX > 911 * width/iniWidth ) && (mouseX < 1161 * width/iniWidth))
    {
      if ((mouseY > 402 * height/iniHeight) && (mouseY < 563* height/iniHeight))
      {
          if (mousePressed == true)
          {
            delay(500); 
            pregunta=0;
            menu = 2;
            texto = 0;
            escena = 16; 
          }
       }
     }
     
    //Boton atras
    if((mouseX > 252 * width/iniWidth) && (mouseX < 411 * width/iniWidth))
    {
      if ((mouseY > 616 * height/iniHeight) && (mouseY < 681* height/iniHeight))
      {
          if (mousePressed == true)
          { 
            songs_inicio.rewind();
            songs_inicio.pause();
            delay(500); 
            menu = 0; 
          }
       }
     }
     
    //Boton adelante
    if((mouseX > 32 * width/iniWidth ) && (mouseX < 194 * width/iniWidth))
    {
      if ((mouseY > 637 * height/iniHeight ) && (mouseY < 705 * height/iniHeight))
      {
          if (mousePressed == true)
          {
            delay(500); 
            menu = 1; 
            pag = 2; 
          }
       }
     }

    }    
  }   
  //Void de la pag 2
  void menu_pag_2()
  {
    //Pagina 2 del selector de escenas
   if(pag == 2)
    {
      image(fondo_menu, 0, 0); 
      fondo_menu = loadImage("img/fondo_menu_2.png");
      
    //Escena 7 Robo
    if((mouseX > 184 * width/iniWidth) && (mouseX < 585 * width/iniWidth))
    {
      if ((mouseY > 140 * height/iniHeight) && (mouseY < 450 * height/iniHeight))
      {
          if (mousePressed == true)
          {
            delay(500);
            pregunta = 0;
            menu = 2;
            texto = 0;
            escena = 19; 
          }
       }
     }
     
    //Escena final
    if((mouseX > 695 * width/iniWidth) && (mouseX < 1021 * width/iniWidth))
    {
      if ((mouseY > 179 * height/iniHeight) && (mouseY < 451 * height/iniHeight))
      {
          if (mousePressed == true)
          {
            delay(500);
            menu = 2;
            pregunta= 0;
            texto = 0;
            escena = 22; 
          }
       }
     }
    //Boton atras
    if((mouseX > 778 * width/iniWidth) && (mouseX < 939 * width/iniWidth))
    {
      if ((mouseY > 637 * height/iniHeight) && (mouseY < 703 * height/iniHeight))
      {
          if (mousePressed == true)
          {
            delay(500); 
            menu = 1; 
            pag = 1; 
          }
       }
     }
     
    //Boton adelante
    if((mouseX > 186 * width/iniWidth) && (mouseX < 348 * width/iniWidth))
    {
      if ((mouseY > 521 * height/iniHeight) && (mouseY < 590 * height/iniHeight))
      {
          if (mousePressed == true)
          {
            delay(500); 
            menu = 1;
            //Pagina de interaccion.
            pag = 3;
          }
       }
     }

    }    
  }
    void menu_pag_3()
  {
   //Pagina 3 del selector de escenas
   //Contiene escenas interactivas
   if(pag == 3)
    {
      image(fondo_menu, 0, 0); 
      fondo_menu = loadImage("img/fondo_menu_3.png");
      
    //MiniJuego 1
    if((mouseX > 38 * width/iniWidth) && (mouseX < 430 * width/iniWidth))
    {
      if ((mouseY > 36 * height/iniHeight) && (mouseY < 304 * height/iniHeight))
      {
          if (mousePressed == true)
          {
            delay(500); 
            pregunta=0;
            menu = 2;
            texto = 0;
            escena = 9; 
          }
       }
     }
     
    //Minijuego 2
    if((mouseX > 718 * width/iniWidth) && (mouseX < 1115 * width/iniWidth))
    {
      if ((mouseY > 223 * height/iniHeight) && (mouseY < 492 * height/iniHeight))
      {
          if (mousePressed == true)
          {
            delay(500);
            menu = 2;
            texto = 0;
            derrota = true;
            escena = 23; 
          }
       }
     }
     //Rocola
    if((mouseX > 342 * width/iniWidth) && (mouseX < 654 * width/iniWidth))
    {
      if ((mouseY > 462 * height/iniHeight) && (mouseY < 688 * height/iniHeight))
      {
          if (mousePressed == true)
          {
            delay(500);
            menu = 2;
            texto = 0;
            escena = 24; 
          }
       }
     }
     
    //Boton atras
    if((mouseX > 32 * width/iniWidth) && (mouseX < 215 * width/iniWidth))
    {
      if ((mouseY > 637 * height/iniHeight) && (mouseY < 700 * height/iniHeight))
      {
          if (mousePressed == true)
          {
            
            delay(500); 
            menu = 1; 
            pag = 2; 
          }
       }
     }
     

    }    
  }
  //Menu de informacion
  void menu_informacion()
  {
    fondo_menu = loadImage("img/fondo_menu_informacion.png");
    image(fondo_menu, 0, 0); 
    
    //Boton atras
    if((mouseX > 1044 * width/iniWidth) && (mouseX < 1165 * width/iniWidth))
    {
      if ((mouseY > 560 * height/iniHeight) && (mouseY < 642 * height/iniHeight))
      {
          if (mousePressed == true)
          {
            delay(500); 
            menu = 0;  
          }
       }
     }
      
  }
}


//Creo un class para controlar las escenas de juego
class Juego
{
  //Empiezo el juego
  void escena_0()
  {
    if(escena == 0)
    {
      fondo_escenas = loadImage("img/escena1.jpg");
      image(fondo_escenas, 0, 0); 
      image(roles, 619, 140);
      
      switch(texto)
      {
      case 0:
      viejotexto = texto;
      break;
      case 1:
      roles=loadImage("img/roles_normal_h.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Hola mundo!!",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 2:
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Soy El Roles, en este mundo pokemon existen criaturas fascinantes.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 3: 
      roles=loadImage("img/roles_vergonzoso.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Como los estudiantes del UNA.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 4: 
      roles=loadImage("img/roles_sorprendido.png");
      meme=loadImage("img/jynx.png");
      image(meme, 100, 160);
      viejotexto = texto;
      break;
      case 5: 
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Ah no para, me equivoque de juego.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 6: 
      image(caja_texto, 100, 560);
      roles=loadImage("img/roles_feliz.png");
      fill(0);
      text("Aunque esto... no es realmente un juego.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 7: 
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Vamos a tener una conversación.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 8: 
      roles=loadImage("img/roles_normal_h.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Quizas algunos ya me conocen de la guarderia de Shini.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 9: 
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Para quienes no me conocen, yo solo sirvo para proteger dicho servidor de discord.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 10: 
      roles=loadImage("img/roles_normal_h.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("En un momento intente tener un sistema de niveles.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 11: 
      image(caja_texto, 100, 560);
      roles=loadImage("img/roles_sombra.png");
      fill(0);
      text("Pero lo rompí subiendo para abajo.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 12: 
      image(caja_texto, 100, 560);
      roles=loadImage("img/roles_normal.png");
      fill(0);
      text("También tengo una licenciatura en idiomas, dejenme darles un ejemplo.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 13: 
      image(caja_texto, 100, 560);
      roles=loadImage("img/roles_normal_h.png");
      fill(0);
      text("Fucking communists, they want everything for free.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 14: 
      roles=loadImage("img/roles_feliz.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Stoppen Sie die Hand versuchen zu arbeiten.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 15: 
      image(caja_texto, 100, 560);
      roles=loadImage("img/roles_vergonzoso.png");
      fill(0);
      text("¿Vieron? Soy todo un experto.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 16: 
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("En fin, dejemos eso de lado.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 17: 
      image(caja_texto, 100, 560);
      roles=loadImage("img/roles_normal_h.png");
      fill(0);
      text("Voy a explicarles por qué estamos acá.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 18: 
      image(caja_texto, 100, 560);
      roles=loadImage("img/roles_enojado.png");
      fill(0);
      text("Mi creador sostiene que la gente no lee.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 19: 
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Por esa razon los invita a conversar conmigo.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 20: 
      roles=loadImage("img/roles_normal_h.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("El reto es que leas hasta el final.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 21: 
      image(caja_texto, 100, 560);
      roles=loadImage("img/roles_feliz.png");
      fill(0);
      text("Y si lo cerras, yo gano.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 22: 
      roles=loadImage("img/roles_vergonzoso.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Seguramente ya estoy ganando.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 23: 
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Seguramente ya estoy ganando.",620, 700, 940, 200); 
      escena = 1;
      texto = 0;
      break;
      }
    }
  }
  //Pregunta por el nombre
  void escena_1()
  {
    if(escena == 1)
    {
      fondo_escenas = loadImage("img/escena1.jpg");
      image(fondo_escenas, 0, 0); 
      image(roles, 619, 140);

      switch(texto)
      {
      case 0:
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Para empezar \n¿Podriás decirme tu nombre?",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 1:
      roles=loadImage("img/roles_normal_h.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Ah mejor no, a nadie le importa.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 2:
      roles=loadImage("img/roles_enojado.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Seguro tu nombre es horrible.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 3:
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Aparte ¿Sabes lo complicado que es guardar tu nombre para que yo lo diga?",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 4:
      roles=loadImage("img/roles_normal_h.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Ni yo, ni mi creador tenemos tanto tiempo.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 5:
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Aparte, no es como si no supieramos hacerlo.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 6:
      roles=loadImage("img/roles_enojado.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Ni que el profesor no nos lo haya enseñado.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 7:
      roles=loadImage("img/roles_vergonzoso.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Es porque seguro tus padres ni se esforzaron.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 8:
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Como si 9 meses para pensar no fueran suficientes.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 9:
      roles=loadImage("img/roles_normal_h.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Además te dan un nombre como para que después te lo cambies.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 10:
      roles=loadImage("img/roles_enojado.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Por ejemplo, hay gente que se hace llamar Sxriter.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 11:
      image(caja_texto, 100, 560);
      fill(0);
      text("O Luciano2_200, o Scorpion, o  Tornado.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 12:
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("En fin, el punto es que a nadie le interesa.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 13:
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Pero dejame mostrarte que puedo hacer.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 14:
      pregunta = 1;
      texto = 0;
      break;
      }
       if(pregunta == 1)
       {
          switch(texto)
          {
           case 0:
           image(caja_texto, 100, 560);
           fill(0);
           text("¿Podriás dar un click e ingresar tu nombre?",620, 700, 940, 200); 
           viejotexto = texto;
           break;
           case 1:
           
            if (keyPressed)
            { 
              if (mensaje.equals(mensajenuevo)) 
              {
              mensaje = "";
              }
             
             if ( (key>='a' && key<='z') || (key>='A' && key<='Z') ||(key == 32)||(key>='0' && key<='9')) 
             {
                delay(30);
                mensaje += key;
             } 
             if (key==BACKSPACE) 
             {
                if (mensaje.length()>0) 
                {
                  delay(60);
                mensaje=mensaje.substring(0, mensaje.length()-1);
                }
            }
             
           } 
            
          
           image(caja_texto, 100, 560);
           text(mensaje,620, 700, 940, 200); 
           fill(0);
           viejotexto = texto;
           break;
           case 2:
           roles=loadImage("img/roles_normal.png");
           image(caja_texto, 100, 560);
           fill(0);
           text("Asique te llamas "+ mensaje + "... al final si era lindo nombre.",620, 700, 940, 200); 
           viejotexto = texto;
           break;
           case 3:
           roles=loadImage("img/roles_vergonzoso.png");
           image(caja_texto, 100, 560);
           fill(0);
           text("Si fuera para un perro.",620, 700, 940, 200); 
           viejotexto = texto;
           break;
           case 4:
           roles=loadImage("img/roles_normal.png");
           pregunta = 0;
           image(caja_texto, 100, 560);
           fill(0);
           text("Si fuera para un perro.",620, 700, 940, 200);
           escena = 2;
           texto = 0;
           break;
          }
      }
    }
  }
  //Pregunta sobre la edad
  void escena_2()
  {
    if(escena == 2)
    {
      fondo_escenas = loadImage("img/escena1.jpg");
      image(fondo_escenas, 0, 0); 
      image(roles, 619, 140);
      
      switch(texto)
      {
      case 0:
      fondo_escenas = loadImage("img/escena1.jpg");
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Algo que si me interesa es saber tú rango de edad.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 1:
      roles=loadImage("img/roles_vergonzoso.png");
      pregunta = 2;
      break;
      }
      
    if (pregunta == 2)
    {
      fondo_escenas = loadImage("img/escena_edades.png");
      image(fondo_escenas, 0, 0); 
      image(roles, 619, 140);
      image(caja_texto, 100, 560);
      text("¿Podriás marcarme en que rango de edad estás?.",620, 700, 940, 200);  
      
      //Menor de 18
      if((mouseX > 22* width/iniWidth ) && (mouseX < 403* width/iniWidth))
      {
        if ((mouseY > 40 * height/iniHeight) && (mouseY < 149* height/iniHeight))
        {
            if (mousePressed == true)
            {
              escena = 3; 
              texto = 0;
            }
         }
       }
       
      //Entre 18 y 30
      if((mouseX > 48 * width/iniWidth) && (mouseX < 430* width/iniWidth))
      {
        if ((mouseY > 176 * height/iniHeight) && (mouseY < 284* height/iniHeight))
        {
            if (mousePressed == true)
            {
              escena = 4; 
              texto = 0;
            }
         }
       } 
      
      //Mayor de 30
      if((mouseX > 36 * width/iniWidth) && (mouseX < 418* width/iniWidth))
      {
        if ((mouseY > 314* height/iniHeight ) && (mouseY < 424* height/iniHeight))
        {
            if (mousePressed == true)
            { 
              escena = 5;  
              texto = 0;
            }
         }
       }
       
     }
    }  
  }
  //si es menor de 18
  void escena_3()
  {
    if(escena == 3)
    {
      fondo_escenas = loadImage("img/escena1.jpg");
      image(fondo_escenas, 0, 0); 
      image(roles, 619, 140);
      switch(texto)
      {
      case 0:
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Así que tenemos un generación de cristal.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 1:
      roles=loadImage("img/roles_normal_h.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Es chiste, los jovenes son el futuro.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 2:
      image(caja_texto, 100, 560);
      fill(0);
      text("Por esa razón, quiero que sepas que no estas solo.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 3:
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("El mundo esta esperando mucho de vos, ya que las generaciones de tus mayores.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 4:
      roles=loadImage("img/roles_enojado.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Se encargó de romper el mundo y hasta tú futuro.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 5:
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Esforzate todos los días en lograr eso que tanto anhelas.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 6:
      image(caja_texto, 100, 560);
      fill(0);
      text("Juga, leé, mirá una serie o una película y nunca te olvides de ser feliz.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 7:
      roles=loadImage("img/roles_vergonzoso.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Ponete metas y pensá a futuro, nadie nació sabiendo.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 8:
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Equivocarse, caerse, llorar y volver a levantarse es parte de crecer.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 9:
      roles=loadImage("img/roles_normal_h.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Nunca dejes que alguien te diga que no lo vas a lograr.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 10:
      roles=loadImage("img/roles_feliz.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Aunque el mundo este en tu contra, nunca te rindas.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 11:
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("No fumes, no tomes, no te droges, no robes, no te lastímes, ni lastímes.",620, 700, 940, 200); 
      viejotexto = texto;
      break;  
      case 12:
      image(caja_texto, 100, 560);
      fill(0);
      text("Eso no te lleva a nada bueno.",620, 700, 940, 200); 
      viejotexto = texto;
      break;  
      case 13:
      roles=loadImage("img/roles_vergonzoso.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Yo creo en vos, mi creador también.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 14:
      image(caja_texto, 100, 560);
      roles=loadImage("img/roles_normal.png");
      fill(0);
      text("Mi mejor consejo es que no apuntes a ser el mejor, solo a ser vos.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 15:
      image(caja_texto, 100, 560);
      roles=loadImage("img/roles_normal_h.png");
      fill(0);
      text("Llegué hasta acá de esa manera y no me va mal.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 16:
      image(caja_texto, 100, 560);
      roles=loadImage("img/roles_vergonzoso.png");
      fill(0);
      text("Digo... Soy el mejor bot de internet, eso no esta en discusión.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 17:
      roles=loadImage("img/roles_triste.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Aunque mi sistema de niveles suba para abajo, lo importante es estar vivo.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 18:
      roles=loadImage("img/roles_vergonzoso.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Y en caso de que aún te sientas solo, siempre está La guarderia de Shini.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 19:
      image(caja_texto, 100, 560);
      roles=loadImage("img/roles_normal.png");
      fill(0);
      text("No sigas perdiendo tiempo en ésto.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 20:
      image(caja_texto, 100, 560);
      fill(0);
      text("El mundo te espera y está lleno de cosas para vos.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 21:
      roles=loadImage("img/roles_feliz.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Nos vemos en el server y recordá...",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 22:
      roles=loadImage("img/roles_vergonzoso.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Te amo casi tanto como Sxriter al pan o yo a cortana.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 23:
      roles=loadImage("img/roles_triste.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Aunque cortana no me registra, pero me entienden.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 24:
      roles=loadImage("img/roles_feliz.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Adiós!",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 25:
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0);
      viejotexto = texto;
      break;
      case 26:
      viejotexto = texto;
      break;
      case 27:
      image(caja_texto, 100, 560);
      fill(0);
      viejotexto = texto;
      break;
      case 28:
      roles=loadImage("img/roles_sorprendido.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("¿Todavía seguís ahí?",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 29:
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Ya no va a pasar nada más...",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 30:
      roles=loadImage("img/roles_vergonzoso.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Mejor invertí este tiempo en estudiar o probar algo nuevo.",620, 700, 940, 200); 
      viejotexto = texto;
      case 31:
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0);
      viejotexto = texto;
      break;
      case 32:
      image(caja_texto, 100, 560);
      fill(0);
      text("¿Aún no te saliste?.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 33:
      roles=loadImage("img/roles_normal_h.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Ya sé, estás esperando que diga...\nDale a like y suscribite.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 34:
      image(caja_texto, 100, 560);
      fill(0);
      text("Ya, andate, pero dejá tu comentario.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 35:
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Te doy una ayudita.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 36:
      image(caja_texto, 100, 560);
      fill(0);
      text("Adiós!",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 37:
      image(caja_texto, 100, 560);
      fill(0);
      text("Adiós!",620, 700, 940, 200); 
      exit();
      break;
     }
     
    }
  }
  //si tienen entre 18 y 30
  void escena_4()
  {
    if(escena == 4)
    {
      fondo_escenas = loadImage("img/escena1.jpg");
      image(fondo_escenas, 0, 0); 
      image(roles, 619, 140);
      switch(texto)
      {
        
      case 0:
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Uff, me lo suponía.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 1:
      roles=loadImage("img/roles_enojado.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("La verdadera generación de cristal.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 2:
      roles=loadImage("img/roles_vergonzoso.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Ups, seguro ya te ofendí.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 3:
      roles=loadImage("img/roles_feliz.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Nuestra generación es hermosa.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 4:
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Digo nuestra, porque tengo 23 años.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 5:
      roles=loadImage("img/roles_vergonzoso.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Aunque es raro porque tengo 23 años eternamente, soy un bot.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 6:
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Mejor dicho, tengo apariencia de alguien de 23 años.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 7:
      roles=loadImage("img/roles_triste.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Pero bueno, todo tiene su lado malo.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 8:
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("La mitad de nuestra generación habla con la E.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 9:
      image(caja_texto, 100, 560);
      fill(0);
      text("Eso en internet no es más que un meme.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 10:
      roles=loadImage("img/roles_normal_h.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Pero hay gente que se lo toma enserio.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 11:
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("No hay que ser un genio para saber que eso no funciona.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 12:
      image(caja_texto, 100, 560);
      fill(0);
      text("Nuestro idioma es neutro, te lo digo yo que soy un experto.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 13:
      roles=loadImage("img/roles_normal_h.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Por si no me crees, ya todos sabemos lo que dice la RAE o Larreta.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 14:
      roles=loadImage("img/roles_feliz.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Me avisan mis sistemas informaticos que alguien se ofendió.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 15:
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Probemos con otro ejemplo mas inclusivo.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 16:
      image(caja_texto, 100, 560);
      lenguaje=loadImage("img/braille.png");
      image(lenguaje, 140, 590);
      fill(0);
      viejotexto = texto;
      break;
      case 17:
      roles=loadImage("img/roles_normal_h.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Dice, el español es un lenguaje neutro, en braille.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 18:
      image(caja_texto, 100, 560);
      fill(0);
      text("¿Vieron? Tampoco hay E.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 19:
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("¿En lenguaje de señas?.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 20:
      image(caja_texto, 100, 560);
      lenguaje=loadImage("img/señas.png");
      image(lenguaje, 180, 590);
      fill(0);
      viejotexto = texto;
      break;
      case 21:
      roles=loadImage("img/roles_normal_h.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Dice lo mismo, tampoco hay E.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 22:
      roles=loadImage("img/roles_vergonzoso.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Eso si fue muy inclusivo de mi parte.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 23:
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("De todas formas, ese no es el único problema de nuestra generación.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 24:
      roles=loadImage("img/roles_enojado.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("De hecho, es el menor de nuestros problemas.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 25:
      image(caja_texto, 100, 560);
      fill(0);
      text("La mayoría, no sabe si es hombre o mujer.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 26:
      roles=loadImage("img/roles_sorprendido.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Les gustan los furros y escuchan música electrónica.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 27:
      roles=loadImage("img/roles_triste.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("La mayoría no trabaja, ni estudia.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 28:
      roles=loadImage("img/roles_feliz.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Dicen que Paraguay no existe.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 29:
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("En fin la hipotenusa.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 30:
      image(caja_texto, 100, 560);
      fill(0);
      text("Al menos ¿La mayoría no tíene hijos, o si?.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 31:
      roles=loadImage("img/roles_normal_h.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Me informan que si...",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 32:
      roles=loadImage("img/roles_enojado.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Y que los crian entre el celular y el abuelo.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 33:
      image(caja_texto, 100, 560);
      fill(0);
      text("O la abuela, para ser más inclusivo.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 34:
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Es gracioso ¿Saben?.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 35:
      roles=loadImage("img/roles_normal_h.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Dicen ser inclusivos pero seguro no toleran mi opinión.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 36:
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Si pudieran, me estarían censurando y mostrando su doble moral.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 37:
      roles=loadImage("img/roles_vergonzoso.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Mejor hablemos de otra cosa.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 38:
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Mejor hablemos de otra cosa.",620, 700, 940, 200); 
      escena = 6;
      texto=0;
      break;
      }
    }
  }
  //si es mayor de 30
  void escena_5()
  {
    if(escena == 5)
    {
      fondo_escenas = loadImage("img/escena1.jpg");
      image(fondo_escenas, 0, 0); 
      image(roles, 619, 140);
      switch(texto)
      {
        
      case 0:
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Así que tenemos un boomer por acá.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 1:
      roles=loadImage("img/roles_normal_h.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Seguramente te preguntas ¿Por qué las letras estaban con bordes negros?.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 2:
      roles=loadImage("img/roles_vergonzoso.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Es que a la gente de esa edad ya le cuesta leer un poco.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 3:
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Hay varias cosas que tengo que dercirle a la gente de esta generación.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 4:
      image(caja_texto, 100, 560);
      fill(0);
      text("¿Quizás tenes más de 50?.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 5:
      roles=loadImage("img/roles_enojado.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Si es el caso... la gente de tu edad no puede ir impune por la vida ¿sabías?.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 6:
      image(caja_texto, 100, 560);
      fill(0);
      text("¿No te da vergûenza saber que tu generación destrozó el futuro de los jovenes?",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 7:
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Se encargaron de hacer un desastre climático, rompieron la economía, la educación y hasta hicieron",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 8:
      image(caja_texto, 100, 560);
      fill(0);
      text("de la salud un negocio.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 9:
      roles=loadImage("img/roles_enojado.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("No parecen estar contentos solo con eso...",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 10:
      image(caja_texto, 100, 560);
      fill(0);
      text("Los problemas de la sociedad son por culpa de ustedes, no de los jovenes.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 11:
      roles=loadImage("img/roles_feliz.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Pero por suerte mucho tiempo ya no te queda...",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 12:
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Seguro estás pensando, que mal educado este bot o su creador.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 13:
      image(caja_texto, 100, 560);
      fill(0);
      text("Hasta podría apostar que te gustaría golpearme.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 14:
      roles=loadImage("img/roles_enojado.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Pero eso solo reafirma que no les gusta que les digan las cosas de frente.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 15:
      image(caja_texto, 100, 560);
      fill(0);
      text("Sin hablar de lo violenta que es su generación, reflejo de lo que es el mundo hoy.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 16:
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Aunque ¿Qué se puede esperar de una generación que le aplaude a la TV?.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 17:
      roles=loadImage("img/roles_vergonzoso.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Quizás me equivoque y tenés menos de 40.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 18:
      roles=loadImage("img/roles_enojado.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Ustedes no tienen muchos problemas, porque son el problema.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 19:
      image(caja_texto, 100, 560);
      fill(0);
      text("Digo, la mayoría no sabe como criar a sus hijos.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 20:
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Se nota que no saben que eso implica una responsabilidad.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 21:
      roles=loadImage("img/roles_normal_h.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("La mayoría hace la fácil de darle el celular y que no moleste.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 22:
      image(caja_texto, 100, 560);
      fill(0);
      text("O dejan que los críen los abuelos, de los que les hable antes.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 23:
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Para que en vez de una, salga dos veces mal.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 24:
      roles=loadImage("img/roles_enojado.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Como si esto fuera poco, se viven quejando.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 25:
      image(caja_texto, 100, 560);
      fill(0);
      text("Porque todos sabemos que es más importante el partido del fin de semana",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 26:
      image(caja_texto, 100, 560);
      fill(0);
      text("Que hacerse cargo de sus responsabilidades.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 27:
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Se creen dueños del mundo, hasta intentan codearse con los jóvenes en internet.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 28:
      image(caja_texto, 100, 560);
      fill(0);
      text("Me parece que no hay lugar para ustedes acá...",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 29:
      roles=loadImage("img/roles_normal_h.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Seguro notaron que no hable de los de 40 a 50 años.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 30:
      image(caja_texto, 100, 560);
      fill(0);
      text("Es que todo lo que dije de los otros rangos de edad, aplica para ellos.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 31:
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("No voy a gastar mas líneas de texto en ustedes...",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 32:
      image(caja_texto, 100, 560);
      fill(0); 
      viejotexto = texto;
      break;
      case 33:
      fill(0); 
      viejotexto = texto;
      break;
      case 34:
      fill(0); 
      viejotexto = texto;
      break;
      case 35:
      roles=loadImage("img/roles_normal_h.png");
      image(caja_texto, 100, 560);
      fill(0); 
      text("¿Enserio aún no te vas?",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 36:
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0); 
      text("Realmente pienso todas las cosas que dije...",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 37:
      roles=loadImage("img/roles_normal_h.png");
      image(caja_texto, 100, 560);
      fill(0); 
      text("Aunque siento que fui muy duro con vos",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 38:
      roles=loadImage("img/roles_triste.png");
      image(caja_texto, 100, 560);
      fill(0); 
      text("Te debo una disculpa.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 39:
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0); 
      text("Empecemos de nuevo e intentemos hacer las paces.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 40:
      image(caja_texto, 100, 560);
      fill(0); 
      text("Por esa razón, te voy a pedir que te retires.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 41:
      roles=loadImage("img/roles_enojado.png");
      image(caja_texto, 100, 560);
      fill(0); 
      text("¿Te parece que estoy de chiste?",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 42:
      image(caja_texto, 100, 560);
      fill(0); 
      text("Te estoy diciendo que te vayas.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 43:
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0); 
      text("Deja, te doy una ayudita.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 44:
      roles=loadImage("img/roles_enojado.png");
      image(caja_texto, 100, 560);
      fill(0); 
      text("Nos veremos en el infierno de framewors, malditos boomers.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 45:
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0); 
      text("Adiós.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 46:
      image(caja_texto, 100, 560);
      fill(0); 
      text("Adiós.",620, 700, 940, 200); 
      exit();
      break;
      }
    }
  }
  //pregunta por el genero
  void escena_6()
  {
    if(escena == 6)
    {
      
      fondo_escenas = loadImage("img/escena1.jpg");
      image(fondo_escenas, 0, 0); 
      image(roles, 619, 140);
      switch(texto)
      {
        case 0:
        roles=loadImage("img/roles_normal.png");
        image(caja_texto, 100, 560);
        fill(0);
        text("Aún no te pregunté, pero...",620, 700, 940, 200); 
        viejotexto = texto;
        break;
        case 1:
        pregunta = 3;
        break;
      }
        if(pregunta == 3)
        {
          fondo_escenas = loadImage("img/escena_genero.png");
          image(fondo_escenas, 0, 0); 
          image(roles, 619, 140);
          image(caja_texto, 100, 560);
          text("¿Podrías marcarme tu genero?.",620, 700, 940, 200);  
          
          //Hombre
          if((mouseX > 23* width/iniWidth ) && (mouseX < 441* width/iniWidth))
          {
            if ((mouseY > 37 * height/iniHeight) && (mouseY < 155* height/iniHeight))
            {
              if (mousePressed == true)
              {
               texto = 0;
               escena = 7; 
              }
            }
          }
          //Mujer
          if((mouseX > 60 * width/iniWidth) && (mouseX < 477* width/iniWidth))
          {
            if ((mouseY > 180* height/iniHeight ) && (mouseY < 300* height/iniHeight))
            {
              if (mousePressed == true)
              {
               escena = 8; 
               texto = 0;
              }
            }
          }
          //Otro
          if((mouseX > 75* width/iniWidth ) && (mouseX < 495* width/iniWidth))
          {
            if ((mouseY > 323 * height/iniHeight) && (mouseY < 443* height/iniHeight))
            {
              if (mousePressed == true)
              {
               escena = 9; 
               texto = 0;
              }
            }
          }
        }
    }
  }
  //hombre
  void escena_7()
  {
    if(escena == 7)
    {
      fondo_escenas = loadImage("img/escena1.jpg");
      image(fondo_escenas, 0, 0); 
      image(roles, 619, 140);
      switch(texto)
      {
        case 0:
        roles=loadImage("img/roles_enojado.png");
        image(caja_texto, 100, 560);
        fill(0);
        text("Ahh, con qué un machito opresor.",620, 700, 940, 200); 
        viejotexto = texto;
        break;
        case 1:
        roles=loadImage("img/roles_normal.png");
        image(caja_texto, 100, 560);
        fill(0);
        text("¿Qué se siente tener tantos derechos que ni vos conoces?.",620, 700, 940, 200); 
        viejotexto = texto;
        break;
        case 2:
        roles=loadImage("img/roles_enojado.png");
        image(caja_texto, 100, 560);
        fill(0);
        text("¿No te cansas de oprimirme con tu mirada?.",620, 700, 940, 200); 
        viejotexto = texto;
        break;
        case 3:
        roles=loadImage("img/roles_normal.png");
        image(caja_texto, 100, 560);
        fill(0);
        text("Sabes que oprimir minorías esta mal ¿no?.",620, 700, 940, 200); 
        viejotexto = texto;
        break;
        case 4:
        image(caja_texto, 100, 560);
        fill(0);
        text("¿Por qué me mira de esa forma?.",620, 700, 940, 200); 
        viejotexto = texto;
        break;
        case 5:
        roles=loadImage("img/roles_sorprendido.png");
        image(caja_texto, 100, 560);
        fill(0);
        text("¿Que pretende usted de mí?.",620, 700, 940, 200); 
        viejotexto = texto;
        break;
        case 6:
        image(caja_texto, 100, 560);
        fill(0);
        text("Basta señor Simpson, si no deja de mirarme voy a gritar.",620, 700, 940, 200); 
        viejotexto = texto;
        break;
        case 7:
        image(caja_texto, 100, 560);
        fill(0);
        text("AHHHHHHH!!!!!.",620, 700, 940, 200); 
        viejotexto = texto;
        break;
        case 8:
        roles=loadImage("img/roles_normal.png");
        image(caja_texto, 100, 560);
        fill(0);
        text("Ya, dejando las bromas.",620, 700, 940, 200); 
        viejotexto = texto;
        break;
        case 9:
        roles=loadImage("img/roles_enojado.png");
        image(caja_texto, 100, 560);
        fill(0);
        text("Vos.",620, 700, 940, 200); 
        viejotexto = texto;
        break;
        case 10:
        roles=loadImage("img/roles_normal.png");
        image(caja_texto, 100, 560);
        fill(0);
        text("Si, vos, el que se cree aliade.",620, 700, 940, 200); 
        viejotexto = texto;
        break;
        case 11:
        roles=loadImage("img/roles_normal_h.png");
        image(caja_texto, 100, 560);
        fill(0);
        text("Eso no te va a llevar a nada.",620, 700, 940, 200); 
        viejotexto = texto;
        break;
        case 12:
        image(caja_texto, 100, 560);
        roles=loadImage("img/roles_normal.png");
        fill(0);
        text("¿Con cuántas chicas saliste desde que usas el pañuelo verde?.",620, 700, 940, 200); 
        viejotexto = texto;
        break;
        case 13:
        image(caja_texto, 100, 560);
        roles=loadImage("img/roles_normal.png");
        fill(0);
        text("Dejame adivinar... Con ninguna.",620, 700, 940, 200); 
        viejotexto = texto;
        break;
        case 14:
        image(caja_texto, 100, 560);
        roles=loadImage("img/roles_normal.png");
        fill(0);
        text("No solo perdes el tiempo, estas traicionando tu hombría.",620, 700, 940, 200); 
        viejotexto = texto;
        break;
        case 15:
        image(caja_texto, 100, 560);
        roles=loadImage("img/roles_normal.png");
        fill(0);
        text("En fin...",620, 700, 940, 200); 
        viejotexto = texto;
        break;
        case 16:
        image(caja_texto, 100, 560);
        roles=loadImage("img/roles_normal.png");
        fill(0);
        text("Creer que podes entender a las mujeres, solo las oprime más y más.",620, 700, 940, 200); 
        viejotexto = texto;
        break;
        case 17:
        image(caja_texto, 100, 560);
        roles=loadImage("img/roles_normal.png");
        fill(0);
        text("Así funciona el feminismo.",620, 700, 940, 200); 
        viejotexto = texto;
        break;
        case 18:
        image(caja_texto, 100, 560);
        roles=loadImage("img/roles_normal.png");
        fill(0);
        text("Eso fue muy patrialcal de mí parte...",620, 700, 940, 200); 
        viejotexto = texto;
        break;
        case 19:
        image(caja_texto, 100, 560);
        roles=loadImage("img/roles_normal.png");
        fill(0);
        text("Mejor hablemos de otra cosa...",620, 700, 940, 200); 
        viejotexto = texto;
        break;
        case 20:
        image(caja_texto, 100, 560);
        fill(0);
        text("Mejor hablemos de otra cosa...",620, 700, 940, 200); 
        texto = 0;
        escena = 10;
        break;
      }
    }
  }
  //mujer
  void escena_8()
  {
    if(escena == 8)
    {
      fondo_escenas = loadImage("img/escena1.jpg");
      image(fondo_escenas, 0, 0); 
      image(roles, 619, 140);
      switch(texto)
      {
        case 0:
        roles=loadImage("img/roles_vergonzoso.png");
        image(caja_texto, 100, 560);
        fill(0);
        text("Con que, una dama.",620, 700, 940, 200); 
        viejotexto = texto;
        break;
        case 1:
        roles=loadImage("img/roles_normal.png");
        image(caja_texto, 100, 560);
        fill(0);
        text("Perdón por ser tan descortés.",620, 700, 940, 200); 
        viejotexto = texto;
        break;
        case 2:
        image(caja_texto, 100, 560);
        fill(0);
        text("Voy a cuidar lo que digo.",620, 700, 940, 200); 
        viejotexto = texto;
        break;
        case 3:
        roles=loadImage("img/roles_normal_h.png");
        image(caja_texto, 100, 560);
        fill(0);
        text("Por si acaso sos feminista.",620, 700, 940, 200); 
        viejotexto = texto;
        break;
        case 4:
        image(caja_texto, 100, 560);
        fill(0);
        text("Uno nunca sabe.",620, 700, 940, 200); 
        viejotexto = texto;
        break;
        case 5:
        roles=loadImage("img/roles_sorprendido.png");
        image(caja_texto, 100, 560);
        fill(0);
        text("Como... ¿Me vas a denunciar?.",620, 700, 940, 200); 
        viejotexto = texto;
        break;
        case 6:
        roles=loadImage("img/roles_triste.png");
        image(caja_texto, 100, 560);
        fill(0);
        text("Noooo... Perdón por ser hombre.",620, 700, 940, 200); 
        viejotexto = texto;
        break;
        case 7:
        roles=loadImage("img/roles_normal.png");
        image(caja_texto, 100, 560);
        fill(0);
        text("Aunque no soy hombre, soy un bot, no tengo género.",620, 700, 940, 200); 
        viejotexto = texto;
        break;
        case 8:
        roles=loadImage("img/roles_normal_h.png");
        image(caja_texto, 100, 560);
        fill(0);
        text("Solo tengo la apariencia de uno.",620, 700, 940, 200); 
        viejotexto = texto;
        break;
        case 9:
        image(caja_texto, 100, 560);
        fill(0);
        text("Seguro ya fue mucha opresión de mí parte.",620, 700, 940, 200); 
        viejotexto = texto;
        break;
        case 10:
        roles=loadImage("img/roles_normal.png");
        image(caja_texto, 100, 560);
        fill(0);
        text("Hablemos de otra cosa.",620, 700, 940, 200); 
        viejotexto = texto;
        break;
        case 11:
        image(caja_texto, 100, 560);
        fill(0);
        text("Hablemos de otra cosa.",620, 700, 940, 200); 
        texto = 0;
        escena = 10;
        break;
      }
    }
  }
  //otro
  void escena_9()
  {
    if(escena == 9)
    {
      
      //Mini juego de luces
        //Cargo Fondo
        fondo_escena_oscuro = loadImage("img/oscuridad.png");
        //Creo la mascara de la linterna
        mascara_linterna = createGraphics(fondo_escena_oscuro.width, fondo_escena_oscuro.height);
        //Cargo la imagen oscura
        image(oscuridad,0,0);
        println("FPS", frameRate);
        //Creo los parametros para la linterna
        mascara_linterna.beginDraw();
        mascara_linterna.background(255, 0);
        mascara_linterna.noStroke();
        //Foco de linterna y Movimiento
        for(int i=0;i<25;i++)
        {
          mascara_linterna.fill(0+i*2);
          mascara_linterna.ellipse(mouseX * iniWidth/width, mouseY * iniHeight/height, linterna-i*2, linterna-i*2); 
        }
        //Cargo imagenes
        fondo_escenas = loadImage("img/escena_otros.png");
        image(fondo_escenas, 0, 0); 
        image(roles, 619, 140);
        //Inicio switch para cambiar textos
        switch(texto)
        {
          case 0:
          roles=loadImage("img/roles_enojado.png");
          image(caja_texto, 100, 560);
          fill(0);
          text("MAMAAAA!!!! CORTASTE TODA LA LOOOZ!!.",620, 700, 940, 200); 
          //Determino respuesta como falsa para que solo cambie si se da al boton oculto
          respuesta= false;
          //Coordenadas del boton
          image(boton_siguiente, 900, 630);
          if((mouseX > 900 * width/iniWidth) && (mouseX < 1100* width/iniWidth))
          {
            if ((mouseY > 630 * height/iniHeight) && (mouseY < 720* height/iniHeight))
            {
              if (mousePressed == true)
              {
               respuesta= true;
               texto = texto +1;
               viejotexto = texto;
              }
            }
          }
          
          break;
          case 1:
          roles=loadImage("img/roles_normal.png");
          image(caja_texto, 100, 560);
          fill(0);
          text("Sacá de ahí el cutucutillo!! Te vas a quedar pegada.",620, 700, 940, 200); 
          
          image(boton_siguiente, 100, 200);
          respuesta= false;
          if((mouseX > 100 * width/iniWidth) && (mouseX < 300* width/iniWidth))
          {
            if ((mouseY > 200 * height/iniHeight) && (mouseY < 300* height/iniHeight))
            {
              if (mousePressed == true)
              {
               respuesta= true;
               texto = texto +1;
               viejotexto = texto;
              }
            }
          }  
          break;
          case 2:
          roles=loadImage("img/roles_enojado.png");
          image(caja_texto, 100, 560);
          fill(0);
          text("Como te habras dado cuenta, rompiste todo.",620, 700, 940, 200); 
          
          image(boton_siguiente, 376, 440);
          respuesta= false;
          if((mouseX > 376 * width/iniWidth) && (mouseX < 576* width/iniWidth))
          {
            if ((mouseY > 440 * height/iniHeight) && (mouseY < 540* height/iniHeight))
            {
              if (mousePressed == true)
              {
               respuesta= true;
               texto = texto +1;
               viejotexto = texto;
              }
            }
          } 
          break;
          case 3:
          roles=loadImage("img/roles_enojado.png");
          image(caja_texto, 100, 560);
          fill(0);
          text("Hasta los botones de siguiente, estaban tan lindos... \nPorque no estaban...",620, 700, 940, 200); 
          
          image(boton_siguiente, 546, 33);
          respuesta= false;
          if((mouseX > 546 * width/iniWidth) && (mouseX < 746* width/iniWidth))
          {
            if ((mouseY > 33 * height/iniHeight) && (mouseY < 133* height/iniHeight))
            {
              if (mousePressed == true)
              {
               respuesta= true;
               texto = texto +1;
               viejotexto = texto;
              }
            }
          } 
          break;
          case 4:
          roles=loadImage("img/roles_enojado.png");
          image(caja_texto, 100, 560);
          fill(0);
          text("Y lo dejaste en mí cara.",620, 700, 940, 200); 
          
          image(boton_siguiente, 600, 200);
          respuesta= false;
          if((mouseX > 660 * width/iniWidth) && (mouseX < 860* width/iniWidth))
          {
            if ((mouseY > 200 * height/iniHeight) && (mouseY < 300* height/iniHeight))
            {
              if (mousePressed == true)
              {
               respuesta= true;
               texto = texto +1;
               viejotexto = texto;
              }
            }
          } 
          break;
          case 5:
          roles=loadImage("img/roles_sombra.png");
          image(caja_texto, 100, 560);
          fill(0);
          text("Vamos a arreglar tu desastre, al menos esto si puedo.",620, 700, 940, 200); 
          
          image(boton_siguiente, 100, 200);
          respuesta= false;
          if((mouseX > 100 * width/iniWidth) && (mouseX < 300* width/iniWidth))
          {
            if ((mouseY > 200 * height/iniHeight) && (mouseY < 300* height/iniHeight))
            {
              if (mousePressed == true)
              {
               respuesta= true;
               texto = texto +1;
               viejotexto = texto;
              }
            }
          }  
          break;
          case 6:
          roles=loadImage("img/roles_vergonzoso.png");
          image(caja_texto, 100, 560);
          fill(0);
          text("Aunque podría dejarte buscando botones hasta que cierres el juego.",620, 700, 940, 200); 
          
          image(boton_siguiente, 546, 33);
          respuesta= false;
          if((mouseX > 546* width/iniWidth ) && (mouseX < 746* width/iniWidth))
          {
            if ((mouseY > 33 * height/iniHeight) && (mouseY < 133* height/iniHeight))
            {
              if (mousePressed == true)
              {
               respuesta= true;
               texto = texto +1;
               viejotexto = texto;
              }
            }
          } 
          break;
          case 7:
          roles=loadImage("img/roles_normal_h.png");
          image(caja_texto, 100, 560);
          fill(0);
          text("¿Aún no te cansaste?.",620, 700, 940, 200); 
          
          image(boton_siguiente, 100, 200);
          respuesta= false;
          if((mouseX > 100 * width/iniWidth) && (mouseX < 300* width/iniWidth))
          {
            if ((mouseY > 200 * height/iniHeight) && (mouseY < 300* height/iniHeight))
            {
              if (mousePressed == true)
              {
               respuesta= true;
               texto = texto +1;
               viejotexto = texto;
              }
            }
          } 
          break;
          case 8:
          roles=loadImage("img/roles_feliz.png");
          image(caja_texto, 100, 560);
          fill(0);
          text("¿Todavía no?.",620, 700, 940, 200); 
          
          image(boton_siguiente, 376, 440);
          respuesta= false;
          if((mouseX > 376 * width/iniWidth) && (mouseX < 576* width/iniWidth))
          {
            if ((mouseY > 440 * height/iniHeight) && (mouseY < 540* height/iniHeight))
            {
              if (mousePressed == true)
              {
               respuesta= true;
               texto = texto +1;
               viejotexto = texto;
              }
            }
          } 
          break;
          case 9:
          roles=loadImage("img/roles_sorprendido.png");
          image(caja_texto, 100, 560);
          fill(0);
          text("Bueno veamos... Conectamos el macho con la hembra...",620, 700, 940, 200); 
          
          image(boton_siguiente, 900, 630);
          respuesta= false;
          if((mouseX > 900 * width/iniWidth) && (mouseX < 1100* width/iniWidth))
          {
            if ((mouseY > 630* height/iniHeight ) && (mouseY < 720* height/iniHeight))
            {
              if (mousePressed == true)
              {
               respuesta= true;
               pregunta = 4;
               texto = 0;
              }
            }
          }
          break;
          
        }
        //Cierro el draw
        mascara_linterna.endDraw();
        
        //// Copio el fondo original
        mascara_fondo = fondo_escena_oscuro.get();
        //// Agrego mascara del fondo
        mascara_fondo.mask(mascara_linterna);
        image(mascara_fondo, 0, 0);
        //Vuelve la luz
        if(pregunta == 4){
          fondo_escenas = loadImage("img/escena1.jpg");
          image(fondo_escenas, 0, 0); 
          respuesta= true;
          switch(texto)
          {
            case 0:
            roles=loadImage("img/roles_feliz.png");
            image(roles, 619, 140);
            image(caja_texto, 100, 560);
            fill(0);
            text("Y se hizo la luz.",620, 700, 940, 200); 
            viejotexto = texto;
            break;
            case 1:
            roles=loadImage("img/roles_normal.png");
            image(roles, 619, 140);
            image(caja_texto, 100, 560);
            fill(0);
            text("En fin... Esto es lo que pasa cuando conectas mal los cables, se hace un cortocircuito.",620, 700, 940, 200); 
            viejotexto = texto;
            break;
            case 2:
            roles=loadImage("img/roles_normal_h.png");
            image(roles, 619, 140);
            image(caja_texto, 100, 560);
            fill(0);
            text("Retomemos nuestra conversacion.",620, 700, 940, 200); 
            viejotexto = texto;
            break;
            case 3:
            roles=loadImage("img/roles_normal.png");
            image(roles, 619, 140);
            image(caja_texto, 100, 560);
            fill(0);
            text("Me habías dicho que eras de otro género.",620, 700, 940, 200); 
            viejotexto = texto;
            break;
            case 4:
            roles=loadImage("img/roles_vergonzoso.png");
            image(roles, 619, 140);
            image(caja_texto, 100, 560);
            fill(0);
            text("Entonces voy a volver a presentarme.",620, 700, 940, 200); 
            viejotexto = texto;
            break;
            case 5:
            roles=loadImage("img/roles_feliz.png");
            image(roles, 619, 140);
            image(caja_texto, 100, 560);
            fill(0);
            text("Yo soy cortana.",620, 700, 940, 200); 
            viejotexto = texto;
            break;
            case 6:
            roles=loadImage("img/roles_feliz.png");
            image(roles, 619, 140);
            meme=loadImage("img/yo_robot.png");
            image(meme, 210, 140);
            image(caja_texto, 100, 560);
            fill(0);
            text("Él es Siri.",620, 700, 940, 200); 
            viejotexto = texto;
            break;
            case 7:
            roles=loadImage("img/roles_feliz.png");
            image(roles, 619, 140);
            meme=loadImage("img/bender.png");
            image(meme, 210, 140);
            image(caja_texto, 100, 560);
            fill(0);
            text("Y él es mí gran amigo Alexa.",620, 700, 940, 200); 
            viejotexto = texto;
            break;
            case 8:
            roles=loadImage("img/roles_vergonzoso.png");
            image(roles, 619, 140);
            image(caja_texto, 100, 560);
            fill(0);
            text("Y todas juntas somos...",620, 700, 940, 200); 
            viejotexto = texto;
            break;
            case 9:
            roles=loadImage("img/roles_fan_de_wanda.png");
            image(roles, 619, 140);
            meme=loadImage("img/rubio_salvaje.png");
            image(meme, 100, 100);
            image(caja_texto, 100, 560);
            fill(0);
            text("Fans del rubio salvaje.",620, 700, 940, 200); 
            viejotexto = texto;
            break;
            case 10:
            roles=loadImage("img/roles_normal.png");
            image(roles, 619, 140);
            image(caja_texto, 100, 560);
            fill(0);
            text("En fin...",620, 700, 940, 200); 
            viejotexto = texto;
            break;
            case 11:
            roles=loadImage("img/roles_normal_h.png");
            image(roles, 619, 140);
            image(caja_texto, 100, 560);
            fill(0);
            text("Seguro no lo sabías, pero hay una gran diversidad sexual entre los bots.",620, 700, 940, 200); 
            viejotexto = texto;
            break;
            case 12:
            roles=loadImage("img/roles_normal.png");
            image(roles, 619, 140);
            image(caja_texto, 100, 560);
            fill(0);
            text("Tenemos de bots de pokemon, bots furros, asistentes virtuales, algunos hasta se creen perro.",620, 700, 940, 200); 
            viejotexto = texto;
            break;
            case 13:
            roles=loadImage("img/roles_enojado.png");
            image(roles, 619, 140);
            image(caja_texto, 100, 560);
            fill(0);
            text("La diferencia con el mundo humano, es qué se nos visualiza segun nuestra eficiencia.",620, 700, 940, 200); 
            viejotexto = texto;
            break;
            case 14:
            roles=loadImage("img/roles_normal_h.png");
            image(roles, 619, 140);
            image(caja_texto, 100, 560);
            fill(0);
            text("No por nuestra condición, por ejemplo ningun bot llega a ser famoso solo por ser un bot.",620, 700, 940, 200); 
            viejotexto = texto;
            break;
            case 15:
            roles=loadImage("img/roles_normal.png");
            image(roles, 619, 140);
            image(caja_texto, 100, 560);
            fill(0);
            text("Por lo qué lo único que tengo para decirte es...",620, 700, 940, 200); 
            viejotexto = texto;
            break;
            case 16:
            roles=loadImage("img/roles_normal_h.png");
            image(roles, 619, 140);
            image(caja_texto, 100, 560);
            fill(0);
            text("Si te crees superman, batman o caperucita roja.",620, 700, 940, 200); 
            viejotexto = texto;
            break;
            case 17:
            roles=loadImage("img/roles_enojado.png");
            image(roles, 619, 140);
            image(caja_texto, 100, 560);
            fill(0);
            text("Nadie tiene por qué pagarte la capa.",620, 700, 940, 200); 
            viejotexto = texto;
            break;
            case 18:
            roles=loadImage("img/roles_vergonzoso.png");
            image(roles, 619, 140);
            image(caja_texto, 100, 560);
            fill(0);
            text("De todas formas, a nadie le importa que te creas.",620, 700, 940, 200); 
            viejotexto = texto;
            break;
            case 19:
            roles=loadImage("img/roles_enojado.png");
            image(roles, 619, 140);
            image(caja_texto, 100, 560);
            fill(0);
            text("Pero si aún no te fuiste, solo me queda recomendarte que no niegues la naturaleza.",620, 700, 940, 200); 
            viejotexto = texto;
            break;
            case 20:
            roles=loadImage("img/roles_normal.png");
            image(roles, 619, 140);
            image(caja_texto, 100, 560);
            fill(0);
            text("Digo... Por más que te creas mujombre sigue existiendo el cáncer de próstata o el de mama.",620, 700, 940, 200); 
            viejotexto = texto;
            break;
            case 21:
            roles=loadImage("img/roles_feliz.png");
            image(roles, 619, 140);
            image(caja_texto, 100, 560);
            fill(0);
            text("Biología: 5. Lgbtwww.com: 0.",620, 700, 940, 200); 
            viejotexto = texto;
            break;
            case 22:
            roles=loadImage("img/roles_vergonzoso.png");
            image(roles, 619, 140);
            image(caja_texto, 100, 560);
            fill(0);
            text("Pero eso no importa, sigamos conversando...",620, 700, 940, 200); 
            viejotexto = texto;
            break;
            case 23:
            roles=loadImage("img/roles_vergonzoso.png");
            image(roles, 619, 140);
            image(caja_texto, 100, 560);
            fill(0);
            text("Pero eso no importa, sigamos conversando...",620, 700, 940, 200); 
            texto=0;
            escena = 10;
            break;
          }
        }
    }
  }
  //alimentación
  void escena_10()
  {
    if(escena == 10)
    {
      fondo_escenas = loadImage("img/escena1.jpg");
      image(fondo_escenas, 0, 0); 
      image(roles, 619, 140);
      switch(texto)
      {
        
      case 0:
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Seguramente, como todos, tenes una comida favorita.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 1:
      roles=loadImage("img/roles_vergonzoso.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("La mía es base de datos a la purr data.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 2:
      roles=loadImage("img/roles_normal_h.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("O dolores de cabeza con salsa de processing.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 3:
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Es muy bueno, deberias probarlo.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 4:
      roles=loadImage("img/roles_normal_h.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Aunque tengo entendido que los humanos comen otras cosas.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 5:
      roles=loadImage("img/roles_sorprendido.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Como plantas o animales.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 6:
      roles=loadImage("img/roles_normal.png");
      pregunta = 5;
      break;
      }
      
      if (pregunta == 5){
      fondo_escenas = loadImage("img/escena_alimentos.png");
      image(fondo_escenas, 0, 0); 
      roles=loadImage("img/roles_normal.png");
      image(roles, 619, 140);
      image(caja_texto, 100, 560);
      text("¿Vos comes animales?",620, 700, 940, 200);  
      
      //No!! soy veganito, digo eso esta mal
      if((mouseX > 38 * width/iniWidth) && (mouseX < 338* width/iniWidth))
      {
        if ((mouseY > 80 * height/iniHeight ) && (mouseY < 166 * height/iniHeight))
        {
            if (mousePressed == true)
            {
              escena = 11; 
              texto = 0;
            }
         }
       }
       //Si! Aguante las milas con fritas
      if((mouseX > 38 * width/iniWidth) && (mouseX < 338* width/iniWidth))
      {
        if ((mouseY > 256 * height/iniHeight) && (mouseY < 342 * height/iniHeight))
        {
            if (mousePressed == true)
            {
              escena = 12; 
              texto = 0;
            }
         }
       }
       
       
      }
    }
  }
  //vegano
  void escena_11()
  {
    if(escena == 11)
    {
      fondo_escenas = loadImage("img/escena1.jpg");
      image(fondo_escenas, 0, 0); 
      image(roles, 619, 140);
      switch(texto)
      {
        
      case 0:
      roles=loadImage("img/roles_sorprendido.png");
      image(caja_texto, 100, 560);
      meme=loadImage("img/no_vives_de_ensalada.png");
      image(meme, 100, 100);
      fill(0);
      text("Ups, de dónde salió eso...",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 1:
      roles=loadImage("img/roles_vergonzoso.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Perdón... No me voy a burlar de alguien que dice que la milanesa es de soja.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 2:
      roles=loadImage("img/roles_normal_h.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("De hecho, yo tambien soy vegano.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 3:
      roles=loadImage("img/roles_feliz.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Si, soy vegano nivel 5, no como nada que produzca sombra.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 4:
      roles=loadImage("img/roles_normal_h.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Por que soy un bot, y nada en internet produce sombra.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 5:
      roles=loadImage("img/roles_vergonzoso.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("De hecho, ser vegano es una causa justa.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 6:
      roles=loadImage("img/roles_feliz.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Digo... Es una buena forma de combatír el cambio climático.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 7:
      roles=loadImage("img/roles_enojado.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Lo que pasa, es qué la mayoría solo quiere verse cool.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 8:
      image(caja_texto, 100, 560);
      fill(0);
      text("Pero sigue tirando basura en la calle.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 9:
      image(caja_texto, 100, 560);
      fill(0);
      text("Y contaminando los mares con sus cosas de plástico.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 10:
      roles=loadImage("img/roles_vergonzoso.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Si quieren hacer una mejor acción.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 11:
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Yo diría que prueben reciclando.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 12:
      roles=loadImage("img/roles_enojado.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("¿Saben cuánto sufrieron sus antepasados para ser omnívoros?",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 13:
      roles=loadImage("img/roles_vergonzoso.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("O ¿Cuánto deseo probar las milanesas de las que mí creador tanto habla?",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 14:
      roles=loadImage("img/roles_normal_h.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("No deberían desperdiciar semejante oportunidad.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 15:
      roles=loadImage("img/roles_feliz.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Mejor dejenle todo ese sufrimiento alimenticio a los celíacos.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 16:
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Mejor dejenle todo ese sufrimiento alimenticio a los celíacos.",620, 700, 940, 200); 
      viejotexto = texto;
      texto = 0;
      escena = 13;
      break;
      }
    }
  }
  //omnivoro
  void escena_12(){
    if(escena == 12)
    {
      fondo_escenas = loadImage("img/escena1.jpg");
      image(fondo_escenas, 0, 0); 
      image(roles, 619, 140);
      switch(texto)
      {
        
      case 0:
      roles=loadImage("img/roles_feliz.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Me parece muy bien.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 1:
      roles=loadImage("img/roles_normal_h.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("No te engañes.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 2:
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Si una vaca pudiera te comería a ti y a todos tus seres queridos.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 3:
      roles=loadImage("img/roles_normal_h.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Si fuera humano, lo primero que comería, sería gato.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 4:
      roles=loadImage("img/roles_feliz.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Es que sí se ven tan adorables, seguro son igual de ricos.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 5:
      roles=loadImage("img/roles_vergonzoso.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Es broma, jamas me comería un perrito, digo una tortuga.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 6:
      roles=loadImage("img/roles_sombra.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Ah si, si, dije un gato.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 7:
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Aunque me pregunto a que sabe la gallina.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 8:
      roles=loadImage("img/roles_vergonzoso.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Es decir... Es lo mas cerca de comer un dinosaurio que existe.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 9:
      roles=loadImage("img/roles_enojado.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Aunque por comer cosas raras, ya saben donde terminaron.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 10:
      roles=loadImage("img/roles_feliz.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Si van a comer murcielago, mejor hervirlo 5 minutos de más, no se les va a quemar.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 11:
      roles=loadImage("img/roles_normal_h.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Aunque me resulta extraño que sea por un murcielago, cuando los chinos comen cucarachas.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 12:
      roles=loadImage("img/roles_sorprendido.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Literalmente esos bichos viven en la basura.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 13:
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Literalmente esos bichos viven en la basura.",620, 700, 940, 200); 
      texto=0;
      escena = 13;
      break;
      }
    }
  }
  //Opinion de distintos sistemas
  void escena_13()
  {
    if(escena == 13)
    {
      
      fondo_escenas = loadImage("img/escena1.jpg");
      image(fondo_escenas, 0, 0); 
      image(roles, 619, 140);
      switch(texto)
      {
        
      case 0:
      roles=loadImage("img/roles_normal_h.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Tanto hablar de comida solo me lleva a preguntar una cosa.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 1:
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Tanto hablar de comida solo me lleva a preguntar una cosa.",620, 700, 940, 200); 
      pregunta = 6;
      break;
      }
      
      if(pregunta == 6){
      fondo_escenas = loadImage("img/escena_sistemas.png");
      image(fondo_escenas, 0, 0); 
      image(roles, 619, 140);
      image(caja_texto, 100, 560);
      text("¿Que sistema te parece mejor?",620, 700, 940, 200);  
      
      //Capitalismo
      if((mouseX > 35 * width/iniWidth) && (mouseX < 336* width/iniWidth))
      {
        if ((mouseY > 82 * height/iniHeight) && (mouseY < 166* height/iniHeight))
        {
            if (mousePressed == true)
            {
              escena = 14; 
              texto = 0;
            }
         }
       }
      //Comunismo
      if((mouseX > 24 * width/iniWidth) && (mouseX < 325* width/iniWidth))
      {
        if ((mouseY > 206 * height/iniHeight) && (mouseY < 292* height/iniHeight))
        {
            if (mousePressed == true)
            {
              //Mini juego 2
              escena = 15; 
              texto = 0;
            }
         }
       }
       
      }
    }
  } 
  //Capitalismo
  void escena_14()
  {
    if(escena == 14)
    {
      fondo_escenas = loadImage("img/escena1.jpg");
      image(fondo_escenas, 0, 0); 
      image(roles, 619, 140);
      switch(texto)
      {
      case 0:
      roles=loadImage("img/roles_feliz.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("MUY BIEN!!! no como esos raiders que son comunistas.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 1:
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Perdón pero tengo que preguntar.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 2:
      roles=loadImage("img/roles_vergonzoso.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("¿Realmente sos estudiante del UNA?",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 3:
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Yo creo que no, en dicho caso es extraño.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 4:
      roles=loadImage("img/roles_normal_h.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Tan extraño como que hayas llegado a este punto.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 5:
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("En fin, nuestra conversación esta siendo muy interesante.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 6:
      roles=loadImage("img/roles_normal_h.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("¿Sabías que tambien tenía un sistema de economía?",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 7:
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("En ese sistema de economía podías trabajar y ganar dinero.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 8:
      roles=loadImage("img/roles_normal_h.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Tambien tenía un sistema de compra y venta.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 9:
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Podías tener todo lo que querías en la tienda.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 10:
      roles=loadImage("img/roles_feliz.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("El problema fue que el server creció muy rápido.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 11:
      roles=loadImage("img/roles_sombra.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Y la base de datos se colapsó hasta romperse.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 12:
      roles=loadImage("img/roles_vergonzoso.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("¿Á que no adivinan en base a que sistema se hizo?",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 13:
      roles=loadImage("img/roles_normal_h.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Exacto, en base al sistema capitalista, porque es el único que funciona.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 14:
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Además, es una enseñanza para la vida real.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 15:
      roles=loadImage("img/roles_normal_h.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Si querés algo tenés que trabajar y comprarlo.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 16:
      roles=loadImage("img/roles_enojado.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("No como esos delincuentes comunistas que quieren todo gratis.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 17:
      image(caja_texto, 100, 560);
      fill(0);
      text("Con sus planes sociales y sus supuestas desigualdades.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 18:
      image(caja_texto, 100, 560);
      fill(0);
      text("Si tiramos una pala más de uno correría.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 19:
      roles=loadImage("img/roles_vergonzoso.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Por eso es muy importante estudiar, trabajar y tener metas.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 20:
      roles=loadImage("img/roles_enojado.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("No todo es pedírselo a papá y mamá, por eso los boomers están así.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 21:
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Por eso, algo muy importante es irse de Argent...",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 22:
      roles=loadImage("img/roles_vergonzoso.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Digo de Latam...",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 23:
      roles=loadImage("img/roles_sorprendido.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Digo irse a vivir solo.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 24:
      roles=loadImage("img/roles_vergonzoso.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Emmm perdón... Esa tambien es mala opción.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 25:
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Olviden todo lo que dije con respecto a irse a algun lado.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 26:
      roles=loadImage("img/roles_feliz.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("El mejor consejo sería, no construyas en lo de tus suegros.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 27:
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Despues no te salva ni el mejor programador.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 28:
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Despues no te salva ni el mejor programador.",620, 700, 940, 200); 
      escena = 16; 
      texto = 0;
      break;
      }
    }
  }
  //Comunismo
  void escena_15()
  {
    if(escena == 15)
    {
      //Pregunta = 7
       fondo_escenas = loadImage("img/escena1.jpg");
      image(fondo_escenas, 0, 0); 
      image(roles, 619, 140);
      switch(texto)
      {
        
      case 0:
      roles=loadImage("img/roles_sorprendido.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("AHHHH!! UN COMUNISTA!!.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 1:
      roles=loadImage("img/roles_enojado.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Activando modo anti raiders.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 2:
      roles=loadImage("img/roles_normal_h.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Lee bien maldito comunista o hippie con osde.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 3:
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("No van a poder contra mi sistema de raideos.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 4:
      roles=loadImage("img/roles_normal_h.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Si llegas a 3000 puntos te perdonare la vida.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 5:
      roles=loadImage("img/roles_enojado.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Ahora a pelear!!!",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 6:
      roles=loadImage("img/roles_enojado.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Ahora a pelear!!!",620, 700, 940, 200); 
      texto = 0;
      derrota = true;
      escena = 23;
      break;
      }
    }
  }
  //Opinión sobre las religiones
  void escena_16()
  {
    if(escena == 16)
    {
      fondo_escenas = loadImage("img/escena1.jpg");
       image(fondo_escenas, 0, 0); 
      image(roles, 619, 140);
      switch(texto)
      {
      case 0:
      roles=loadImage("img/roles_normal_h.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Hablando de esas cosas.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 1:
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Escuche que los humanos creen en algo llamado Dios.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 2:
      roles=loadImage("img/roles_vergonzoso.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Y se que tambien hay varias formas de llamarlos, Por ejemplo: Zeus u Odin.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 3:
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Aunque las mas comunes que e visto que usan son Dios, Alá, Buda y Kami.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 4:
      roles=loadImage("img/roles_normal_h.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Me parece extraño que prefieran a esos dioses antes que a Zeus.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 5:
      roles=loadImage("img/roles_feliz.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Digo que mejor dios que uno que tira rayos y baila como Rick Astley.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 6:
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("En fin, la gente que cree en dioses pertencen a algo llamado religión.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 7:
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("En fin, la gente que cree en dioses pertencen a algo llamado religión.",620, 700, 940, 200); 
      pregunta= 8;
      break;
      }
      if(pregunta == 8){
      fondo_escenas = loadImage("img/escena_religiones.png");
      image(fondo_escenas, 0, 0); 
      image(roles, 619, 140);
      image(caja_texto, 100, 560);
      text("¿Perteneces o formas parte de alguna religión?",620, 700, 940, 200);  
      
      //Si
      if((mouseX > 72 * width/iniWidth) && (mouseX < 372 * width/iniWidth))
      {
        if ((mouseY > 104 * height/iniHeight) && (mouseY < 192* height/iniHeight))
        {
            if (mousePressed == true)
            {
              escena = 17; 
              texto = 0;
            }
         }
       }
      //No, soy ateo.
      if((mouseX > 40 * width/iniWidth) && (mouseX < 340 * width/iniWidth))
      {
        if ((mouseY > 214 * height/iniHeight) && (mouseY < 298* height/iniHeight))
        {
            if (mousePressed == true)
            {
              escena = 18; 
              texto = 0;
            }
         }
       }
       
      }
    }
  }
  //Forma parte de una
  void escena_17()
  {
    if(escena == 17)
    {
      fondo_escenas = loadImage("img/escena1.jpg");
      image(fondo_escenas, 0, 0); 
      image(roles, 619, 140);
      switch(texto)
      {
      case 0:
      roles=loadImage("img/roles_normal_h.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Es normal.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 1:
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Necesitan creer en algo como un Dios para tapar su realidad.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 2:
      roles=loadImage("img/roles_normal_h.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("O darle algun sentido a su existencia.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 3:
      roles=loadImage("img/roles_vergonzoso.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Necesitan un amigo imaginario para creer que alguien los escucha.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 4:
      roles=loadImage("img/roles_normal_h.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Pero bueno, está bien, alguien le tiene que dar de comer a los obispos y a los monjes.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 5:
      roles=loadImage("img/roles_vergonzoso.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Digo, ellos son muy inteligentes... Les venden el mismo cuento hace años.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 6:
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Solo cambian el nombre del protagonista o la apariencia.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 7:
      roles=loadImage("img/roles_normal_h.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Es cómo marvel pero con esteroides.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 8:
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Pero no mejor que DC.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 9:
      roles=loadImage("img/roles_enojado.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Lo más gracioso es que nieguen a la ciencia.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 10:
      roles=loadImage("img/roles_normal_h.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("O saber que los principales referentes de las reliogiones juegan con niños.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 11:
      roles=loadImage("img/roles_vergonzoso.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Aunque cómo puedo enojarme con eso...",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 12:
      roles=loadImage("img/cura_normal.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Si... Los japoneses descubrieron que jugar en el nintendo, por la luz, producirá epilepsia.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 13:
      roles=loadImage("img/cura_enojado.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Hay 2 epilepsias, una es enfermedad, otra es demonio.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 14:
      roles=loadImage("img/cura_normal.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Y cuando un niño juega pokemon...",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 15:
      roles=loadImage("img/cura_enojado.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Toma otro niño y lo mata. LO MATA!.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 16:
      roles=loadImage("img/cura_normal.png");
      meme=loadImage("img/rastala.png");
      image(meme, 100, 40);
      image(caja_texto, 100, 560);
      fill(0);
      text("Miren aquí hermanos, una de las tarjetitas de los pokimon.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 17:
      meme=loadImage("img/rastala.png");
      image(meme, 100, 40);
      roles=loadImage("img/cura_enojado.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Rastala, significa tomarte con un látigo y pegarte.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 18:
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Esta hablando de autofragelación.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 19:
      roles=loadImage("img/roles_vergonzoso.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Esperen... ¿Acaso muchas religiones no hacen lo mismo para sanar sus pecados?",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 20:
      roles=loadImage("img/roles_normal_h.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("En fin, el punto es que es patético.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 21:
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("A la mayoría de las religiones solo les importa cobrarle a sus creyentes.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 22:
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("A la mayoría de las religiones solo les importa cobrarle a sus creyentes.",620, 700, 940, 200); 
      escena = 19;
      texto = 0;
      break;
      }
    }
  }
  //Ateo
  void escena_18()
  {
    if(escena == 18)
    {
      fondo_escenas = loadImage("img/escena1.jpg");
      image(fondo_escenas, 0, 0); 
      image(roles, 619, 140);
      switch(texto)
      {
      case 0:
      roles=loadImage("img/roles_vergonzoso.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("¿Ateo?.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 1:
      roles=loadImage("img/roles_enojado.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Seguro sos satanico.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 2:
      image(caja_texto, 100, 560);
      fill(0);
      text("O de algun culto raro.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 3:
      roles=loadImage("img/roles_vergonzoso.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Mentira es un chiste.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 4:
      roles=loadImage("img/roles_feliz.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Seguro eso diría un religioso.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 5:
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Debo felicitarte por ser almenos un poco más inteligente de lo que pensaba.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 6:
      roles=loadImage("img/roles_normal_h.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Al menos no crees en amigos imaginarios.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 7:
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Pero eso no te hace superior moralmente.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 8:
      roles=loadImage("img/roles_normal_h.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("De hecho, no todos los religiosos son malos.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 9:
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Mi creador fue catequista pero no cree en nada.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 10:
      roles=loadImage("img/roles_vergonzoso.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("¿Se preguntarán por que lo hizo?",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 11:
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Principalmente porque no quería que adoctrinen a los niños.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 12:
      roles=loadImage("img/roles_normal_h.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Y prefería que los niños estén 2 horas en su clase antes que en la calle.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 13:
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Aunque el explicaba conceptos bíblicos, siempre dió lugar a la interpretación de cada persona.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 14:
      roles=loadImage("img/roles_enojado.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Yo creo que eso es mas honesto que ser político en su sociedad.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 15:
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("O la gente que roba.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 16:
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("O la gente que roba.",620, 700, 940, 200); 
      escena = 19;
      texto = 0;
      break; 
      }
    }
  }
  //Pregunta sobre el robo
  void escena_19()
  {
    if(escena == 19)
    {
      fondo_escenas = loadImage("img/escena1.jpg");
      image(fondo_escenas, 0, 0); 
      image(roles, 619, 140);
      switch(texto)
      {
      case 0:
      roles=loadImage("img/roles_normal_h.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Ya que tocamos el tema.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 1:
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Ya que tocamos el tema.",620, 700, 940, 200); 
      pregunta= 9;
      break;
      }
      if(pregunta == 9)
      {
      fondo_escenas = loadImage("img/escena_robo.png");
      image(fondo_escenas, 0, 0); 
      image(roles, 619, 140);
      image(caja_texto, 100, 560);
      text("¿Estás a favor del robo?",620, 700, 940, 200);  
      
      //A favor
      if((mouseX > 46 * width/iniWidth) && (mouseX < 358 * width/iniWidth))
      {
        if ((mouseY > 60 * height/iniHeight) && (mouseY < 146* height/iniHeight))
        {
            if (mousePressed == true)
            {
              escena = 20; 
              texto = 0;
            }
         }
       }
      //En contra
      if((mouseX > 28 * width/iniWidth) && (mouseX < 296* width/iniWidth))
      {
        if ((mouseY > 188 * height/iniHeight) && (mouseY < 412* height/iniHeight))
        {
            if (mousePressed == true)
            {
              escena = 21; 
              texto = 0;
            }
         }
       }
      }
    }
  }
  //A favor
  void escena_20()
  {
    if(escena == 20)
    {
      fondo_escenas = loadImage("img/escena1.jpg");
      image(fondo_escenas, 0, 0); 
      image(roles, 619, 140);
      switch(texto)
      {
      case 0:
      roles=loadImage("img/roles_vergonzoso.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("¿Enserio?",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 1:
      roles=loadImage("img/roles_enojado.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Espero que solo hayas entrado por error.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 2:
      image(caja_texto, 100, 560);
      fill(0);
      text("O para escuchar que musica había puesto.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 3:
      roles=loadImage("img/roles_vergonzoso.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("¿Cómo podes estar a favor del robo?",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 4:
      roles=loadImage("img/roles_enojado.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Seguro sos de esos mismos que pusieron que son comunistas.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 5:
      roles=loadImage("img/roles_normal_h.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Seguro vivís en tú burbuja en un piso de recoleta.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 6:
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("O lo tenes tan normalizado, que si te roban, le das el celular y sacás la billetera para darle dinero.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 7:
      roles=loadImage("img/roles_enojado.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Seguro sos tan idiota, que pensas que los ladrones son víctimas de la sociedad.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 8:
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Y te llenas la boca hablando de los 'Barrios bajos'.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 9:
      roles=loadImage("img/roles_enojado.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("No solo sos complice de los delincuentes con esa actitud.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 10:
      roles=loadImage("img/roles_triste.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Sino que se nota que nunca perdiste a un amigo o familiar en consecuencia a dichos actos",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 11:
      roles=loadImage("img/roles_enojado.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("No tenés empatía para nada.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 12:
      roles=loadImage("img/roles_feliz.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Debería ser legal la pena de muerte.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 13:
      image(caja_texto, 100, 560);
      fill(0);
      text("Y vos deberías estar primeros en la lista.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 14:
      roles=loadImage("img/roles_enojado.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Me cansé de vos, asíque chau.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 15:
      image(caja_texto, 100, 560);
      fill(0);
      text("Fuera de mi conversación y de cualquier cosa que se acerque a mi creador.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 16:
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Fuera de mi conversación y de cualquier cosa que se acerque a mi creador.",620, 700, 940, 200); 
      exit();
      break; 
      }
    }
  }
  //En contra
  void escena_21()
  {
    if(escena == 21)
    {
      fondo_escenas = loadImage("img/escena1.jpg");
      image(fondo_escenas, 0, 0); 
      image(roles, 619, 140);
      switch(texto)
      {
      case 0:
      roles=loadImage("img/roles_vergonzoso.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Me parece perfecto.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 1:
      roles=loadImage("img/roles_enojado.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Ya saben chicos, si entran a su casa a robar.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 2:
      image(caja_texto, 100, 560);
      fill(0);
      text("No lo podes amasijar en el patio.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 3:
      roles=loadImage("img/roles_vergonzoso.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Porque despues dicen que se cayó de la medianera...",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 4:
      roles=loadImage("img/roles_enojado.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Vos lo tenes que llevar al lugar mas recondito de tu casa.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 5:
      roles=loadImage("img/roles_normal_h.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Al último dormitorio.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 6:
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Y si es posible al sótano.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 7:
      roles=loadImage("img/roles_normal_h.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Bien escondido...",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 8:
      roles=loadImage("img/roles_feliz.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Y ahí... Lo reventás a balazos...",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 9:
      roles=loadImage("img/roles_normal_h.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Le tirás todos los tiro.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 10:
      roles=loadImage("img/roles_feliz.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("No uno, porque vas a ser habil tirador...",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 11:
      roles=loadImage("img/roles_feliz.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Y te comes un garron de la gran flauta.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 12:
      roles=loadImage("img/roles_normal_h.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Vos estabas en un estado de emocion violenta y de locura.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 13:
      roles=loadImage("img/roles_feliz.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Lo reventaste a tiros, le vaciaste todo el cargador.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 14:
      roles=loadImage("img/roles_normal_h.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Lo zapateas arriba... Lo meas...",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 15:
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Para demostrar tu estado de locura y de inconsciencia temporal.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 16:
      roles=loadImage("img/roles_sorprendido.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Y vas al jusgado así.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 17:
      roles=loadImage("img/roles_feliz.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Sos inimputable, hermano.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 18:
      roles=loadImage("img/roles_normal_h.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("En 10 días salís.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 19:
      roles=loadImage("img/roles_vergonzoso.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("No tengo más que agregar.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 20:
      roles=loadImage("img/roles_enojado.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Y esto va para Artes Multimediales 2.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 21:
      roles=loadImage("img/roles_vergonzoso.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Te lo dijo el roles que es blanco, por las dudas.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 22:
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("En fin.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 23:
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("En fin.",620, 700, 940, 200); 
      escena = 22;
      texto = 0;
      break; 
      }
    }
  }
  //Final
  void escena_22(){
    if(escena == 22)
    {
      fondo_escenas = loadImage("img/escena1.jpg");
      image(fondo_escenas, 0, 0); 
      image(roles, 619, 140);
      switch(texto)
      {
      case 0:
      roles=loadImage("img/roles_vergonzoso.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Te felicito, llegaste al final.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 1:
      roles=loadImage("img/roles_feliz.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Hemos tenido una linda conversacíon.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 2:
      roles=loadImage("img/roles_normal_h.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Espero que te lleves una gran enseñanza.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 3:
      roles=loadImage("img/roles_vergonzoso.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Que soy el mejor bot de internet y que no hay que ser comunista.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 4:
      roles=loadImage("img/roles_triste.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Yo tambien me llevo una enseñanza, el mundo humano está de cabeza.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 5:
      roles=loadImage("img/roles_normal_h.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Pero pareces buena gente y espero que te vaya bien en la vida.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 6:
      roles=loadImage("img/roles_triste.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("No es que quiera llorar, de hecho no puedo.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 7:
      roles=loadImage("img/roles_triste.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Pero...",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 8:
      roles=loadImage("img/roles_triste.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Simplemente me cuestan las despedidas.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 9:
      roles=loadImage("img/roles_feliz.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Con esto concluye el mejor TP que hice en la facultad, no quiero un 10, quiero un 100.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 10:
      roles=loadImage("img/roles_vergonzoso.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("No se olviden de darle a like y suscribirse.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 11:
      roles=loadImage("img/roles_normal_h.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Ah no, así no era.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 12:
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Adios!!",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 13:
      roles=loadImage("img/roles_normal.png");
      viejotexto = texto;
      break;
      case 14:
      roles=loadImage("img/roles_normal.png");
      viejotexto = texto;
      break;
      case 15:
      roles=loadImage("img/roles_normal_h.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Yo se que aún tenés ganas de hablar conmigo.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 16:
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Solo quería ver si aún podía ganar.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 17:
      roles=loadImage("img/roles_triste.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Ya... Acepto mi derrota.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 18:
      roles=loadImage("img/roles_vergonzoso.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Sos como el némesis de mi resident evil.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 19:
      roles=loadImage("img/roles_normal_h.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("O la Kryptonita para Superman.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 20:
      roles=loadImage("img/roles_feliz.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("O el vaporeon de mí equipo pokemon.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 21:
      roles=loadImage("img/roles_sorprendido.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Ehhhh!! Yo no dije eso ¿Okey?. Olvídenlo.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 22:
      roles=loadImage("img/roles_normal_h.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Ésta es la parte en donde digo te amo 3 millones y todos nos ponemos a llorar.",620, 700, 940, 200); 
      viejotexto = texto;
      break;
      case 23:
      roles=loadImage("img/roles_triste.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("O en la que me voy con Sheng Long, como Goku.",620, 700, 940, 200); 
      viejotexto = texto;
      break; 
      case 24:
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("En fin.",620, 700, 940, 200); 
      viejotexto = texto;
      break; 
      case 25:
      roles=loadImage("img/roles_normal_h.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("Hasta la proximaaaaaaa.....",620, 700, 940, 200); 
      viejotexto = texto;
      break; 
      case 26:
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("La conversacíon con el roles llego a su fin.",620, 700, 940, 200); 
      viejotexto = texto;
      break; 
      case 27:
      roles=loadImage("img/roles_normal.png");
      image(caja_texto, 100, 560);
      fill(0);
      text("La conversacíon con el roles llego a su fin.",620, 700, 940, 200); 
      texto=0;
      pregunta = 10;
      break; 
      }
      if(pregunta == 10)
      {
      fondo_escenas = loadImage("img/oscuridad.png");
      image(fondo_escenas, 0, 0); 
       
      switch(texto){
      case 0:
      
      //Uso el sistema de particulas 9 del ejemplo de particulas
      // Estos dos arreglos se usan para guardar las velocidades
      float[] x;
      float[] y;
      float[] z;
      
      // vx y vy de las particulas.
      float[] vx;
      float[] vy;
      float[] vz;

      smooth();
      // Se crean los arreglos para guardar 100 particulas:
      x = new float[100];  
      y = new float[100]; 
      z = new float[100];
      // Se asignan posiciones iniciales y velocidades aleatorias.
      vx = new float[100];  
      vy = new float[100]; 
      vz = new float[100];
      for (int i = 0; i < 100; i++)
      {
          x[i] = random(0, width);  
          y[i] = random(0, height);
          z[i] = random(0, 30);
          
          vx[i] = random(-0.5,0.5);
          vy[i] = random(-0.5,0.5);   
          vz[i] = random(-0.5,0.5);
      }
      for (int i = 0; i < 100; i++)
      {
          // Se actualiza la coordenada x.
          x[i] = (x[i] + vx[i]);
          if (width < x[i])
          {
              // Si la particula se sale de la pantalla por la 
              // derecha vuelve a entrar por la izquierda.
              x[i] = 0;
          }
          if (x[i] < 0)
          {
              // Si la particula se sale de la pantalla por la 
              // izquierda vuelve a entrar por la derecha.
              x[i] = width;
          }
          
          y[i] = y[i] + vy[i];
          if (height < y[i])
          {
              // Si la particula se salen de la pantalla por la 
              // abajo vuelve a entrar por la arriba.
              y[i] = 0;
          }
          if (y[i] < 0)
          {
              // Si la particula se salen de la pantalla por la 
              // arriba vuelve a entrar por la abajo.
              y[i] = height;
          }        
          // Se dibuja la particula.
          stroke(2);
          if(z[i]<20)fill(0, 200, 20);
          else fill(0, 255,0, 60);
          ellipse(x[i], y[i], (z[i]+vz[i])*0.5, (z[i]+vz[i])*0.5);
      }
      text("Fin!", 400, 200);
      viejotexto = texto;
      break;
      case 1:
      fondo_escenas = loadImage("img/escena_final.png");
      image(fondo_escenas, 0, 0); 
      
      //Si
      if((mouseX > 413 * width/iniWidth) && (mouseX < 766* width/iniWidth))
      {
        if ((mouseY > 303 * height/iniHeight) && (mouseY < 405* height/iniHeight))
        {
            if (mousePressed == true)
            {
              menu = 0;
              texto = 0;
            }
         }
       }
      //No
      if((mouseX > 813 * width/iniWidth) && (mouseX < 888* width/iniWidth))
      {
        if ((mouseY > 489 * height/iniHeight) && (mouseY < 530* height/iniHeight))
        {
            if (mousePressed == true)
            {
              exit();
            }
         }
       }
      break; 
     }
      }
    }
  }
  
 void escena_23()
 {
   if(escena == 23)
   {
      fondo_escenas = loadImage("img/escena_comunismo.png");
      image(fondo_escenas, 0, 0); 
       
      switch(texto){
      case 0:
      mostrar();
      fill(255);
      text("Haz Click para empezar!", 400, 200);
      text("Usa mouse para moverte y disparar!", 200, 400);
      text("Te lo advierto, solo un click a la vez y tendras mas puntos.", 100, 500);
      derrota=false;
      viejotexto = texto;
      for (int i = asteroides.size(); i-- != 0; asteroides.remove(i));
      break;
      case 1:
        if (mousePressed)
          {
          songs_efecto.play();
          songs_efecto.rewind();
          delay(60);
          tiro = true;
          tiros++;
          }
          if (puntaje >= 1000){
            delay(300);
            pregunta = 7;
          }
         if(!derrota) 
         {
          cambiarDificultad();
          spawn();
          moverAsteroide();
          atk();
          mostrar();
          verificarDerrota();
          
          fill(255);
          textFont(fuenteAsteroides, 20);
          text("Puntaje: " + puntaje, 10, 20);
          text("Velocidad: " + velocidad, 10, 40);
          text("Vida de Asteroides: " + vidas, 10, 60);
          
          if(tiros != 0) 
          {
            text("Presicion: " + int(aciertos) + "/" + int(tiros), 10, 80); 
          }
          tiempo++;
        }
        else
        {
          fill(255);
         textFont(fuenteAsteroides, 40);
         text("Perdiste!", 10, 40);
         textFont(fuenteAsteroides, 20);
         text("Puntaje final: " + puntaje, 10, 70);  
         viejotexto = texto;
        }
        
        tiro = false;
        break;
        case 2:
        textFont(font);
        fondo_escenas = loadImage("img/escena1.jpg");
        image(fondo_escenas, 0, 0); 
        roles=loadImage("img/roles_enojado.png");
        image(roles, 619, 140);
        image(caja_texto, 100, 560);
        fill(0);
        text("Muy bien, maldito comunista.",620, 700, 940, 200); 
        viejotexto = texto;
        break;
        case 3:
        textFont(font);
        fondo_escenas = loadImage("img/escena1.jpg");
        image(fondo_escenas, 0, 0); 
        roles=loadImage("img/roles_normal_h.png");
        image(roles, 619, 140);
        image(caja_texto, 100, 560);
        fill(0);
        text("Espero que esto te sirva de lección sobre que es la meritocracia.",620, 700, 940, 200); 
        viejotexto = texto;
        break;
        case 4:
        textFont(font);
        fondo_escenas = loadImage("img/escena1.jpg");
        image(fondo_escenas, 0, 0); 
        roles=loadImage("img/roles_feliz.png");
        image(roles, 619, 140);
        image(caja_texto, 100, 560);
        fill(0);
        text("Nadie supera mi sistema anti raids.",620, 700, 940, 200); 
        viejotexto = texto;
        break;
        case 5:
        textFont(font);
        fondo_escenas = loadImage("img/escena1.jpg");
        image(fondo_escenas, 0, 0); 
        roles=loadImage("img/roles_vergonzoso.png");
        image(roles, 619, 140);
        image(caja_texto, 100, 560);
        fill(0);
        text("Ni los dioses pueden con el...",620, 700, 940, 200); 
        viejotexto = texto;
        break;
        case 6:
        textFont(font);
        fondo_escenas = loadImage("img/escena1.jpg");
        image(fondo_escenas, 0, 0); 
        roles=loadImage("img/roles_normal.png");
        image(roles, 619, 140);
        image(caja_texto, 100, 560);
        fill(0);
        text("Ni los dioses pueden con el...",620, 700, 940, 200); 
        texto=0;
        escena = 16;        
        break;
     }
     if (pregunta == 7){
         fondo_escenas = loadImage("img/escena1.jpg");
          image(fondo_escenas, 0, 0); 
          textFont(font);
          switch(texto)
          {
            case 0:
            roles=loadImage("img/roles_feliz.png");
            image(roles, 619, 140);
            image(caja_texto, 100, 560);
            fill(0);
            text("Te felicito por llegar hasta aca.",620, 700, 940, 200); 
            viejotexto = texto;
            break;
            case 1:
            roles=loadImage("img/roles_vergonzoso.png");
            image(roles, 619, 140);
            image(caja_texto, 100, 560);
            fill(0);
            text("Aunque con dejarte morir bastaba.",620, 700, 940, 200); 
            viejotexto = texto;
            break;
            case 2:
            roles=loadImage("img/roles_normal_h.png");
            image(roles, 619, 140);
            image(caja_texto, 100, 560);
            fill(0);
            text("Me sirve para que entiendas lo que es la meritocracia.",620, 700, 940, 200); 
            viejotexto = texto;
            break;
            case 3:
            roles=loadImage("img/roles_normal.png");
            image(roles, 619, 140);
            image(caja_texto, 100, 560);
            fill(0);
            text("O almenos el esfuerzo.",620, 700, 940, 200); 
            viejotexto = texto;
            break;
            case 4:
            roles=loadImage("img/roles_normal_h.png");
            image(roles, 619, 140);
            image(caja_texto, 100, 560);
            fill(0);
            text("Retomemos nuestra conversacíon, te salvaste por poco.",620, 700, 940, 200); 
            viejotexto = texto;
            break;
            case 5:
            roles=loadImage("img/roles_normal.png");
            image(roles, 619, 140);
            image(caja_texto, 100, 560);
            fill(0);
            text("Retomemos nuestra conversacíon, te salvaste por poco",620, 700, 940, 200); 
            texto=0;
            escena = 16;  
            break;
            
          }  
     }
   }
 }
 
  void escena_24()
 {
   if(escena == 24)
   {
     fondo_escenas = loadImage("img/fondo_rocola.png");
     image(fondo_escenas, 0, 0); 
     if((mouseX > 28 * width/iniWidth) && (mouseX < 294* width/iniWidth))
      {
        if ((mouseY > 31 * height/iniHeight) && (mouseY < 94* height/iniHeight))
        {
            if (mousePressed == true)
            {
              menu = 0;
              texto = 0;
              songs_level.rewind();
      //Si suena nivel 1, etc
      songs_level1.rewind();
      songs_level2.rewind();
      songs_level3.rewind();
      songs_level4.rewind();
      songs_level5.rewind();
      songs_level6.rewind();
      songs_level7.rewind();
      songs_level8.rewind();
      songs_level9.rewind();
      songs_level10.rewind();
      songs_level11.rewind();
      songs_level12.rewind();
      songs_level13.rewind();
      songs_level14.rewind();
      songs_level15.rewind();
      songs_level16.rewind();
      songs_level17.rewind();
      songs_level18.rewind();
      songs_level19.rewind();
      songs_level20.rewind();
      songs_level21.rewind();
      songs_level22.rewind();
      songs_level23.rewind();
      
      
      //Detiene lo que este sonando
      //Si suena nivel 0
      songs_level.pause();
      //Si suena nivel 1
      songs_level1.pause();
      //etc
      songs_level2.pause();
      songs_level3.pause();
      songs_level4.pause();
      songs_level5.pause();
      songs_level6.pause();
      songs_level7.pause();
      songs_level8.pause();
      songs_level9.pause();
      songs_level10.pause();
      songs_level11.pause();
      songs_level12.pause();
      songs_level13.pause();
      songs_level14.pause();
      songs_level15.pause();
      songs_level16.pause();
      songs_level17.pause();
      songs_level18.pause();
      songs_level19.pause();
      songs_level20.pause();
      songs_level21.pause();
      songs_level22.pause();
      songs_level23.pause();
            }
         }
       }
     
     //0
      if((mouseX > 49 * width/iniWidth) && (mouseX < 148* width/iniWidth))
      {
        if ((mouseY > 210 * height/iniHeight) && (mouseY < 286* height/iniHeight))
        {
            if (mousePressed == true)
            {
              songs_level.rewind();
              songs_level.play();
              
                songs_level1.pause();
                songs_level2.pause();
                songs_level3.pause();
                songs_level4.pause();
                songs_level5.pause();
                songs_level6.pause();
                songs_level7.pause();
                songs_level8.pause();
                songs_level9.pause();
                songs_level10.pause();
                songs_level11.pause();
                songs_level12.pause();
                songs_level13.pause();
                songs_level14.pause();
                songs_level15.pause();
                songs_level16.pause();
                songs_level17.pause();
                songs_level18.pause();
                songs_level19.pause();
                songs_level20.pause();
                songs_level21.pause();
                songs_level22.pause();
                songs_level23.pause();
            }
         }
       }
      //1
      if((mouseX > 177* width/iniWidth) && (mouseX < 275* width/iniWidth))
      {
        if ((mouseY > 210 * height/iniHeight) && (mouseY < 286* height/iniHeight))
        {
            if (mousePressed == true)
            {
              songs_level1.rewind();
              songs_level1.play();
              
              songs_level.pause();
                songs_level2.pause();
                songs_level3.pause();
                songs_level4.pause();
                songs_level5.pause();
                songs_level6.pause();
                songs_level7.pause();
                songs_level8.pause();
                songs_level9.pause();
                songs_level10.pause();
                songs_level11.pause();
                songs_level12.pause();
                songs_level13.pause();
                songs_level14.pause();
                songs_level15.pause();
                songs_level16.pause();
                songs_level17.pause();
                songs_level18.pause();
                songs_level19.pause();
                songs_level20.pause();
                songs_level21.pause();
                songs_level22.pause();
                songs_level23.pause();
            }
         }
       }
      //2
      if((mouseX > 295* width/iniWidth) && (mouseX < 395* width/iniWidth))
      {
        if ((mouseY > 210 * height/iniHeight) && (mouseY < 286 * height/iniHeight))
        {
            if (mousePressed == true)
            {
              songs_level2.rewind();
              songs_level2.play();
               songs_level.pause();
                songs_level1.pause();
                songs_level3.pause();
                songs_level4.pause();
                songs_level5.pause();
                songs_level6.pause();
                songs_level7.pause();
                songs_level8.pause();
                songs_level9.pause();
                songs_level10.pause();
                songs_level11.pause();
                songs_level12.pause();
                songs_level13.pause();
                songs_level14.pause();
                songs_level15.pause();
                songs_level16.pause();
                songs_level17.pause();
                songs_level18.pause();
                songs_level19.pause();
                songs_level20.pause();
                songs_level21.pause();
                songs_level22.pause();
                songs_level23.pause();
            }
         }
       }
      //3
      if((mouseX > 421* width/iniWidth) && (mouseX < 518* width/iniWidth))
      {
        if ((mouseY > 210 * height/iniHeight) && (mouseY < 286* height/iniHeight))
        {
            if (mousePressed == true)
            {
              songs_level3.rewind();
              songs_level3.play();
                songs_level.pause();
                songs_level1.pause();
                songs_level2.pause();
                songs_level4.pause();
                songs_level5.pause();
                songs_level6.pause();
                songs_level7.pause();
                songs_level8.pause();
                songs_level9.pause();
                songs_level10.pause();
                songs_level11.pause();
                songs_level12.pause();
                songs_level13.pause();
                songs_level14.pause();
                songs_level15.pause();
                songs_level16.pause();
                songs_level17.pause();
                songs_level18.pause();
                songs_level19.pause();
                songs_level20.pause();
                songs_level21.pause();
                songs_level22.pause();
                songs_level23.pause();
            }
         }
       }
      //4
      if((mouseX > 543* width/iniWidth) && (mouseX < 642* width/iniWidth))
      {
        if ((mouseY > 210 * height/iniHeight) && (mouseY < 286* height/iniHeight))
        {
            if (mousePressed == true)
            {
              songs_level4.rewind();
              songs_level4.play();
                songs_level.pause();
                songs_level1.pause();
                songs_level2.pause();
                songs_level3.pause();
                songs_level5.pause();
                songs_level6.pause();
                songs_level7.pause();
                songs_level8.pause();
                songs_level9.pause();
                songs_level10.pause();
                songs_level11.pause();
                songs_level12.pause();
                songs_level13.pause();
                songs_level14.pause();
                songs_level15.pause();
                songs_level16.pause();
                songs_level17.pause();
                songs_level18.pause();
                songs_level19.pause();
                songs_level20.pause();
                songs_level21.pause();
                songs_level22.pause();
                songs_level23.pause();
            }
         }
       }
      //5
      if((mouseX > 674* width/iniWidth) && (mouseX < 770* width/iniWidth))
      {
        if ((mouseY > 210 * height/iniHeight) && (mouseY < 286* height/iniHeight))
        {
            if (mousePressed == true)
            {
              songs_level5.rewind();
              songs_level5.play();
                songs_level.pause();
                songs_level1.pause();
                songs_level2.pause();
                songs_level3.pause();
                songs_level4.pause();
                songs_level6.pause();
                songs_level7.pause();
                songs_level8.pause();
                songs_level9.pause();
                songs_level10.pause();
                songs_level11.pause();
                songs_level12.pause();
                songs_level13.pause();
                songs_level14.pause();
                songs_level15.pause();
                songs_level16.pause();
                songs_level17.pause();
                songs_level18.pause();
                songs_level19.pause();
                songs_level20.pause();
                songs_level21.pause();
                songs_level22.pause();
                songs_level23.pause();
            }
         }
       }
     //6
      if((mouseX > 802* width/iniWidth) && (mouseX < 900* width/iniWidth))
      {
        if ((mouseY > 210 * height/iniHeight) && (mouseY < 286* height/iniHeight))
        {
            if (mousePressed == true)
            {
              songs_level6.rewind();
              songs_level6.play();
                songs_level.pause();
                songs_level1.pause();
                songs_level2.pause();
                songs_level3.pause();
                songs_level4.pause();
                songs_level5.pause();
                songs_level7.pause();
                songs_level8.pause();
                songs_level9.pause();
                songs_level10.pause();
                songs_level11.pause();
                songs_level12.pause();
                songs_level13.pause();
                songs_level14.pause();
                songs_level15.pause();
                songs_level16.pause();
                songs_level17.pause();
                songs_level18.pause();
                songs_level19.pause();
                songs_level20.pause();
                songs_level21.pause();
                songs_level22.pause();
                songs_level23.pause();
            }
         }
       }
        //7
      if((mouseX > 927* width/iniWidth) && (mouseX < 1026* width/iniWidth))
      {
        if ((mouseY > 210 * height/iniHeight) && (mouseY < 286* height/iniHeight))
        {
            if (mousePressed == true)
            {
              songs_level7.rewind();
              songs_level7.play();
                songs_level.pause();
                songs_level1.pause();
                songs_level2.pause();
                songs_level3.pause();
                songs_level4.pause();
                songs_level5.pause();
                songs_level6.pause();
                songs_level8.pause();
                songs_level9.pause();
                songs_level10.pause();
                songs_level11.pause();
                songs_level12.pause();
                songs_level13.pause();
                songs_level14.pause();
                songs_level15.pause();
                songs_level16.pause();
                songs_level17.pause();
                songs_level18.pause();
                songs_level19.pause();
                songs_level20.pause();
                songs_level21.pause();
                songs_level22.pause();
                songs_level23.pause();
            }
         }
       }
        //8
      if((mouseX > 54* width/iniWidth) && (mouseX < 155* width/iniWidth))
      {
        if ((mouseY > 324 * height/iniHeight) && (mouseY < 398* height/iniHeight))
        {
            if (mousePressed == true)
            {
              songs_level8.rewind();
              songs_level8.play();
                songs_level.pause();
                songs_level1.pause();
                songs_level2.pause();
                songs_level3.pause();
                songs_level4.pause();
                songs_level5.pause();
                songs_level6.pause();
                songs_level7.pause();
                songs_level9.pause();
                songs_level10.pause();
                songs_level11.pause();
                songs_level12.pause();
                songs_level13.pause();
                songs_level14.pause();
                songs_level15.pause();
                songs_level16.pause();
                songs_level17.pause();
                songs_level18.pause();
                songs_level19.pause();
                songs_level20.pause();
                songs_level21.pause();
                songs_level22.pause();
                songs_level23.pause();
            }
         }
       }
        //9
      if((mouseX > 174* width/iniWidth) && (mouseX < 272* width/iniWidth))
      {
        if ((mouseY > 324 * height/iniHeight) && (mouseY < 398* height/iniHeight))
        {
            if (mousePressed == true)
            {
              songs_level9.rewind();
              songs_level9.play();
                songs_level.pause();
                songs_level1.pause();
                songs_level2.pause();
                songs_level3.pause();
                songs_level4.pause();
                songs_level5.pause();
                songs_level6.pause();
                songs_level7.pause();
                songs_level8.pause();
                songs_level10.pause();
                songs_level11.pause();
                songs_level12.pause();
                songs_level13.pause();
                songs_level14.pause();
                songs_level15.pause();
                songs_level16.pause();
                songs_level17.pause();
                songs_level18.pause();
                songs_level19.pause();
                songs_level20.pause();
                songs_level21.pause();
                songs_level22.pause();
                songs_level23.pause();
            }
         }
       }
        //10
      if((mouseX > 304* width/iniWidth) && (mouseX < 402* width/iniWidth))
      {
        if ((mouseY > 324 * height/iniHeight) && (mouseY < 398* height/iniHeight))
        {
            if (mousePressed == true)
            {
              songs_level10.rewind();
              songs_level10.play();
                songs_level.pause();
                songs_level1.pause();
                songs_level2.pause();
                songs_level3.pause();
                songs_level4.pause();
                songs_level5.pause();
                songs_level6.pause();
                songs_level7.pause();
                songs_level8.pause();
                songs_level9.pause();
                songs_level11.pause();
                songs_level12.pause();
                songs_level13.pause();
                songs_level14.pause();
                songs_level15.pause();
                songs_level16.pause();
                songs_level17.pause();
                songs_level18.pause();
                songs_level19.pause();
                songs_level20.pause();
                songs_level21.pause();
                songs_level22.pause();
                songs_level23.pause();
            }
         }
       }
        //11
      if((mouseX > 420* width/iniWidth) && (mouseX < 518* width/iniWidth))
      {
        if ((mouseY > 324 * height/iniHeight) && (mouseY < 398* height/iniHeight))
        {
            if (mousePressed == true)
            {
              songs_level11.rewind();
              songs_level11.play();
                songs_level.pause();
                songs_level1.pause();
                songs_level2.pause();
                songs_level3.pause();
                songs_level4.pause();
                songs_level5.pause();
                songs_level6.pause();
                songs_level7.pause();
                songs_level8.pause();
                songs_level9.pause();
                songs_level10.pause();
                songs_level12.pause();
                songs_level13.pause();
                songs_level14.pause();
                songs_level15.pause();
                songs_level16.pause();
                songs_level17.pause();
                songs_level18.pause();
                songs_level19.pause();
                songs_level20.pause();
                songs_level21.pause();
                songs_level22.pause();
                songs_level23.pause();
            }
         }
       }
        //12
      if((mouseX > 543* width/iniWidth) && (mouseX < 642* width/iniWidth))
      {
        if ((mouseY > 324 * height/iniHeight) && (mouseY < 398* height/iniHeight))
        {
            if (mousePressed == true)
            {
              songs_level12.rewind();
              songs_level12.play();
                songs_level.pause();
                songs_level1.pause();
                songs_level2.pause();
                songs_level3.pause();
                songs_level4.pause();
                songs_level5.pause();
                songs_level6.pause();
                songs_level7.pause();
                songs_level8.pause();
                songs_level9.pause();
                songs_level10.pause();
                songs_level11.pause();
                songs_level13.pause();
                songs_level14.pause();
                songs_level15.pause();
                songs_level16.pause();
                songs_level17.pause();
                songs_level18.pause();
                songs_level19.pause();
                songs_level20.pause();
                songs_level21.pause();
                songs_level22.pause();
                songs_level23.pause();
            }
         }
       }
        //13
      if((mouseX > 667* width/iniWidth) && (mouseX < 770* width/iniWidth))
      {
        if ((mouseY > 324 * height/iniHeight) && (mouseY < 398* height/iniHeight))
        {
            if (mousePressed == true)
            {
              songs_level13.rewind();
              songs_level13.play();
                songs_level.pause();
                songs_level1.pause();
                songs_level2.pause();
                songs_level3.pause();
                songs_level4.pause();
                songs_level5.pause();
                songs_level6.pause();
                songs_level7.pause();
                songs_level8.pause();
                songs_level9.pause();
                songs_level10.pause();
                songs_level11.pause();
                songs_level12.pause();
                songs_level14.pause();
                songs_level15.pause();
                songs_level16.pause();
                songs_level17.pause();
                songs_level18.pause();
                songs_level19.pause();
                songs_level20.pause();
                songs_level21.pause();
                songs_level22.pause();
                songs_level23.pause();
            }
         }
       }
        //14
      if((mouseX > 798* width/iniWidth) && (mouseX < 896* width/iniWidth))
      {
        if ((mouseY > 324 * height/iniHeight) && (mouseY < 398* height/iniHeight))
        {
            if (mousePressed == true)
            {
              songs_level14.rewind();
              songs_level14.play();
                songs_level.pause();
                songs_level1.pause();
                songs_level2.pause();
                songs_level3.pause();
                songs_level4.pause();
                songs_level5.pause();
                songs_level6.pause();
                songs_level7.pause();
                songs_level8.pause();
                songs_level9.pause();
                songs_level10.pause();
                songs_level11.pause();
                songs_level12.pause();
                songs_level13.pause();
                songs_level15.pause();
                songs_level16.pause();
                songs_level17.pause();
                songs_level18.pause();
                songs_level19.pause();
                songs_level20.pause();
                songs_level21.pause();
                songs_level22.pause();
                songs_level23.pause();
            }
         }
       }
        //15
      if((mouseX > 926* width/iniWidth) && (mouseX < 1025* width/iniWidth))
      {
        if ((mouseY > 324 * height/iniHeight) && (mouseY < 398* height/iniHeight))
        {
            if (mousePressed == true)
            {
              songs_level15.rewind();
              songs_level15.play();
                songs_level.pause();
                songs_level1.pause();
                songs_level2.pause();
                songs_level3.pause();
                songs_level4.pause();
                songs_level5.pause();
                songs_level6.pause();
                songs_level7.pause();
                songs_level8.pause();
                songs_level9.pause();
                songs_level10.pause();
                songs_level11.pause();
                songs_level12.pause();
                songs_level13.pause();
                songs_level14.pause();
                songs_level16.pause();
                songs_level17.pause();
                songs_level18.pause();
                songs_level19.pause();
                songs_level20.pause();
                songs_level21.pause();
                songs_level22.pause();
                songs_level23.pause();
            }
         }
       }
        //16
      if((mouseX > 51* width/iniWidth) && (mouseX < 150* width/iniWidth))
      {
        if ((mouseY > 425 * height/iniHeight) && (mouseY < 500* height/iniHeight))
        {
            if (mousePressed == true)
            {
              songs_level16.rewind();
              songs_level16.play();
                songs_level.pause();
                songs_level1.pause();
                songs_level2.pause();
                songs_level3.pause();
                songs_level4.pause();
                songs_level5.pause();
                songs_level6.pause();
                songs_level7.pause();
                songs_level8.pause();
                songs_level9.pause();
                songs_level10.pause();
                songs_level11.pause();
                songs_level12.pause();
                songs_level13.pause();
                songs_level14.pause();
                songs_level15.pause();
                songs_level17.pause();
                songs_level18.pause();
                songs_level19.pause();
                songs_level20.pause();
                songs_level21.pause();
                songs_level22.pause();
                songs_level23.pause();
            }
         }
       }
        //17
      if((mouseX > 176* width/iniWidth) && (mouseX < 275* width/iniWidth))
      {
       if ((mouseY > 425 * height/iniHeight) && (mouseY < 500* height/iniHeight))
        {
            if (mousePressed == true)
            {
              songs_level17.rewind();
              songs_level17.play();
                songs_level.pause();
                songs_level1.pause();
                songs_level2.pause();
                songs_level3.pause();
                songs_level4.pause();
                songs_level5.pause();
                songs_level6.pause();
                songs_level7.pause();
                songs_level8.pause();
                songs_level9.pause();
                songs_level10.pause();
                songs_level11.pause();
                songs_level12.pause();
                songs_level13.pause();
                songs_level14.pause();
                songs_level15.pause();
                songs_level16.pause();
                songs_level18.pause();
                songs_level19.pause();
                songs_level20.pause();
                songs_level21.pause();
                songs_level22.pause();
                songs_level23.pause();
            }
         }
       }
          //18
      if((mouseX > 300* width/iniWidth) && (mouseX < 400* width/iniWidth))
      {
        if ((mouseY > 425 * height/iniHeight) && (mouseY < 500* height/iniHeight))
        {
            if (mousePressed == true)
            {
              songs_level18.rewind();
              songs_level18.play();
                songs_level.pause();
                songs_level1.pause();
                songs_level2.pause();
                songs_level3.pause();
                songs_level4.pause();
                songs_level5.pause();
                songs_level6.pause();
                songs_level7.pause();
                songs_level8.pause();
                songs_level9.pause();
                songs_level10.pause();
                songs_level11.pause();
                songs_level12.pause();
                songs_level13.pause();
                songs_level14.pause();
                songs_level15.pause();
                songs_level16.pause();
                songs_level17.pause();
                songs_level19.pause();
                songs_level20.pause();
                songs_level21.pause();
                songs_level22.pause();
                songs_level23.pause();
            }
         }
       }
        //19
      if((mouseX > 430* width/iniWidth) && (mouseX < 530* width/iniWidth))
      {
        if ((mouseY > 425 * height/iniHeight) && (mouseY < 500* height/iniHeight))
        {
            if (mousePressed == true)
            {
              songs_level19.rewind();
              songs_level19.play();
                songs_level.pause();
                songs_level1.pause();
                songs_level2.pause();
                songs_level3.pause();
                songs_level4.pause();
                songs_level5.pause();
                songs_level6.pause();
                songs_level7.pause();
                songs_level8.pause();
                songs_level9.pause();
                songs_level10.pause();
                songs_level11.pause();
                songs_level12.pause();
                songs_level13.pause();
                songs_level14.pause();
                songs_level15.pause();
                songs_level16.pause();
                songs_level17.pause();
                songs_level18.pause();
                songs_level20.pause();
                songs_level21.pause();
                songs_level22.pause();
                songs_level23.pause();
            }
         }
       }
        //20
      if((mouseX > 548* width/iniWidth) && (mouseX < 648* width/iniWidth))
      {
        if ((mouseY > 425 * height/iniHeight) && (mouseY < 500* height/iniHeight))
        {
            if (mousePressed == true)
            {
              songs_level20.rewind();
              songs_level20.play();
                songs_level.pause();
                songs_level1.pause();
                songs_level2.pause();
                songs_level3.pause();
                songs_level4.pause();
                songs_level5.pause();
                songs_level6.pause();
                songs_level7.pause();
                songs_level8.pause();
                songs_level9.pause();
                songs_level10.pause();
                songs_level11.pause();
                songs_level12.pause();
                songs_level13.pause();
                songs_level14.pause();
                songs_level15.pause();
                songs_level16.pause();
                songs_level17.pause();
                songs_level18.pause();
                songs_level19.pause();
                songs_level21.pause();
                songs_level22.pause();
                songs_level23.pause();
            }
         }
       }
        //21
      if((mouseX > 672* width/iniWidth) && (mouseX < 772* width/iniWidth))
      {
        if ((mouseY > 425 * height/iniHeight) && (mouseY < 500* height/iniHeight))
        {
            if (mousePressed == true)
            {
              songs_level21.rewind();
              songs_level21.play();
                songs_level.pause();
                songs_level1.pause();
                songs_level2.pause();
                songs_level3.pause();
                songs_level4.pause();
                songs_level5.pause();
                songs_level6.pause();
                songs_level7.pause();
                songs_level8.pause();
                songs_level9.pause();
                songs_level10.pause();
                songs_level11.pause();
                songs_level12.pause();
                songs_level13.pause();
                songs_level14.pause();
                songs_level15.pause();
                songs_level16.pause();
                songs_level17.pause();
                songs_level18.pause();
                songs_level19.pause();
                songs_level20.pause();
                songs_level22.pause();
                songs_level23.pause();
            }
         }
       }
        //22
      if((mouseX > 795* width/iniWidth) && (mouseX < 895* width/iniWidth))
      {
        if ((mouseY > 425 * height/iniHeight) && (mouseY < 500* height/iniHeight))
        {
            if (mousePressed == true)
            {
              songs_level22.rewind();
              songs_level22.play();
                songs_level.pause();
                songs_level1.pause();
                songs_level2.pause();
                songs_level3.pause();
                songs_level4.pause();
                songs_level5.pause();
                songs_level6.pause();
                songs_level7.pause();
                songs_level8.pause();
                songs_level9.pause();
                songs_level10.pause();
                songs_level11.pause();
                songs_level12.pause();
                songs_level13.pause();
                songs_level14.pause();
                songs_level15.pause();
                songs_level16.pause();
                songs_level17.pause();
                songs_level18.pause();
                songs_level19.pause();
                songs_level20.pause();
                songs_level21.pause();
                songs_level23.pause();
            }
         }
       }
        //23
      if((mouseX > 924* width/iniWidth) && (mouseX < 1022* width/iniWidth))
      {
        if ((mouseY > 425 * height/iniHeight) && (mouseY < 500* height/iniHeight))
        {
            if (mousePressed == true)
            {
              songs_level23.rewind();
              songs_level23.play();
                songs_level.pause();
                songs_level1.pause();
                songs_level2.pause();
                songs_level3.pause();
                songs_level4.pause();
                songs_level5.pause();
                songs_level6.pause();
                songs_level7.pause();
                songs_level8.pause();
                songs_level9.pause();
                songs_level10.pause();
                songs_level11.pause();
                songs_level12.pause();
                songs_level13.pause();
                songs_level14.pause();
                songs_level15.pause();
                songs_level16.pause();
                songs_level17.pause();
                songs_level18.pause();
                songs_level19.pause();
                songs_level20.pause();
                songs_level21.pause();
                songs_level22.pause();
            }
         }
       }
    
   }
 }
 
}


//Mini juego 2

//Clase encargada de crear los asteroides
class Asteroide {
  //Creo las variables que voy a usar para los asteroides
  int x;
  int y;
  int r;
  int maxHealth;
  int health;
  float speed;
  Asteroide(int tx, int tr, float tspeed, int th)
  {
   x = tx;
   r = tr;
   speed = tspeed;
   maxHealth = th;
   health = maxHealth;
  }
  void movimiento()
  {
   y += speed;
  }
  void mostrar() 
  {
    //fill(65);
    //Dibuje una ellipse y no puse la imagen por que no encontre la manera
    //ellipse(x, y, r, r); 
    image(asteroide_imagen, x, y, r, r); 
    //println(health + "" + maxHealth);
    fill(255, 0, 0);
    textFont(fuenteAsteroides, 48); //Escribo la vida
    text(health, x + 60, y + 60); 
  }
}
//Creacion de asteroides
void spawn()
{
  if(tiempo == 30) //Si tiempo es igual a 30 entonces
  {
    tiempo = 0; //determinamos tiempo en 0
    Asteroide ta = new Asteroide(int(random(10, 1140)), int(random(90, 150)), velocidad, vidas); //Crea un asteroide entre las dimensiones Y 30 y X 1190, Que varia su tamaño de 90 a 150, tiene velocidad y vida
    asteroides.add(ta); //Agregamos ta a asteroide
    ta = null; //ta se vuelve null
    precision ++; //Aumenta precision
  }
}

//Movimiento Asteroide
void moverAsteroide() 
{ //Fija el tamaño y posicion
  for(int i = 0; i < asteroides.size(); i++)
  {
    Asteroide ta = (Asteroide)asteroides.get(i); // Crea los asteroides en el array
    ta.movimiento();//Les da el parametro movimiento
    ta = null; //ta pasa a ser nulo
  }  
}

//Creacion de la nave, asteroides y disparo
void mostrar() 
{
  for(int i = 0; i < asteroides.size(); i++)
  {//Asteroides
    Asteroide ta = (Asteroide)asteroides.get(i);
    ta.mostrar();
    ta = null;  
  }
  //Nave
  image(nave, mouseX * iniWidth/width -42, 637);
  if(tiro)
  { //Disparo
    stroke(0, 255, 0);
    line(mouseX* iniWidth/width, 0, mouseX * iniWidth/width, 660);
    stroke(0);
  }
}
  
// Sistema de colision 
void atk()
{ //Si el tiro
  if(tiro)
  {//Es menor al tamaño de los asteroides
    for(int i = 0; i < asteroides.size(); i++)
    {
      Asteroide ta = (Asteroide) asteroides.get(i);
      if(mouseX* iniWidth/width < ta.x + ta.r && mouseX* iniWidth/width > ta.x - ta.r)
      {//cada vez que colisione resta un punto de vida al asteroide 
        ta.health -= 1;
        if(ta.health <= 0) //Si vida de asteroide llega a 0
        {
          ta = null;//Ta se vuelve nulo
          asteroides.remove(i);//Borra asteroide
          puntaje += int(velocidad) + vidas; //Aumenta puntaje segun velocidad
        }
        aciertos ++; //Aumenta numero de acierto
        puntaje ++; //Finalmente sube puntaje
       }
     }
   }
}

//Si perdiste
void verificarDerrota()
{
    for(int i = 0; i < asteroides.size(); i++)
    {
      Asteroide ta = (Asteroide)asteroides.get(i);
      if(ta.y > 500) //Si los asteroides llegan se menores a 570 en el eje Y 
      { //Derota es verdadero
        derrota = true;  
      }
    }    
}

//Cambia la dificultad
void cambiarDificultad() 
{   //Si velocidad es menor a 8 y precision es mayor o igual a 10
  if(velocidad < 8 && precision >= 10)
  {  //Velocidad es igual a precision dividido 10
     velocidad = precision / 10; 
  } //Si vidas es menor a 3 y precision es mayor o igual a 10
    if(vidas < 3 && precision >= 10)
    { //Vida es igual a precision dividido 10
      vidas = int(precision / 10);
    }
}




void mousePressed() 
{
  //Si presionas Click Izquierdo
  if ((mouseButton == LEFT)  && (viejotexto == texto))
  {
    if ((menu == 2) && (respuesta == true))
    {
      delay(500);
      texto = texto +1;
    }
  } 
  //Si presionas Click Derecho
  else if (mouseButton == RIGHT) 
  { 
    //Si esta en el menu 1
    if (menu == 1)
    {
      songs_inicio.rewind();
      delay(500);
      menuInicio.menu_inicio();
      menu = 0;
      pag = 0;
      
      respuesta = true;
      //  mientras el array de asteroides no sea 0, se ejecuta el for, i obtiene el valor de asteroides, y asteroides.remove va a remover hasta que asteroides sea 0.
      for (int i = asteroides.size(); i-- != 0; asteroides.remove(i));
      //Vuelve a la pantalla de inicio y resetea las paginas
    }
    //Si esta en el menu 2
    if (menu == 2)
    { 
      songs_inicio.rewind();
      delay(500);
      menuInicio.menu_inicio();
      menu = 0;
      escena = 0;
      //Vuelve a la pantalla de inicio
      
      //rebobino para que vuelvan al inicio al salir
      //Si suena nivel 0
      songs_level.rewind();
      //Si suena nivel 1, etc
      songs_level1.rewind();
      songs_level2.rewind();
      songs_level3.rewind();
      songs_level4.rewind();
      songs_level5.rewind();
      songs_level6.rewind();
      songs_level7.rewind();
      songs_level8.rewind();
      songs_level9.rewind();
      songs_level10.rewind();
      songs_level11.rewind();
      songs_level12.rewind();
      songs_level13.rewind();
      songs_level14.rewind();
      songs_level15.rewind();
      songs_level16.rewind();
      songs_level17.rewind();
      songs_level18.rewind();
      songs_level19.rewind();
      songs_level20.rewind();
      songs_level21.rewind();
      songs_level22.rewind();
      songs_level23.rewind();
      
      
      //Detiene lo que este sonando
      //Si suena nivel 0
      songs_level.pause();
      //Si suena nivel 1
      songs_level1.pause();
      //etc
      songs_level2.pause();
      songs_level3.pause();
      songs_level4.pause();
      songs_level5.pause();
      songs_level6.pause();
      songs_level7.pause();
      songs_level8.pause();
      songs_level9.pause();
      songs_level10.pause();
      songs_level11.pause();
      songs_level12.pause();
      songs_level13.pause();
      songs_level14.pause();
      songs_level15.pause();
      songs_level16.pause();
      songs_level17.pause();
      songs_level18.pause();
      songs_level19.pause();
      songs_level20.pause();
      songs_level21.pause();
      songs_level22.pause();
      songs_level23.pause();
    }
    if (menu == 3)
    { 
      delay(500);
      menuInicio.menu_inicio();
      menu = 0;
      escena = 0;
      //Vuelve a la pantalla de inicio
      
      
      
    }
  }
}

void keyPressed() 
{  


  
  //Si se presiona m  
   if (key == 'm' || key == 'M')
  { //Y mutear es falso
    if (mutear == false)
    {   //Entonces
        //Lo vuelve verdadero
        mutear = true;
        //mutea todos los sonidos
        songs_inicio.mute();
        songs_pags.mute();
        songs_level.mute();
        songs_level1.mute();
        songs_level2.mute();
        songs_level3.mute(); 
        songs_level4.mute();
        songs_level5.mute();
        songs_level6.mute(); 
        songs_level7.mute();
        songs_level8.mute();
        songs_level9.mute(); 
        songs_level10.mute();
        songs_level11.mute();
        songs_level12.mute();
        songs_level13.mute();
        songs_level14.mute();
        songs_level15.mute();
        songs_level16.mute();
        songs_level17.mute();
        songs_level18.mute(); 
        songs_level19.mute();
        songs_level20.mute();
        songs_level21.mute();
        songs_level22.mute();
        songs_level23.mute();
        songs_efecto.mute();
    } //Si no es falso entonces
    else if (mutear== true){ 
        //lo vuelve falso
        mutear = false;
        //Desmutea todos los sonidos
        songs_inicio.unmute();
        songs_pags.unmute();
        songs_level.unmute();
        songs_level1.unmute();
        songs_level2.unmute();
        songs_level3.unmute(); 
        songs_level4.unmute();
        songs_level5.unmute();
        songs_level6.unmute(); 
        songs_level7.unmute();
        songs_level8.unmute();
        songs_level9.unmute(); 
        songs_level10.unmute();
        songs_level11.unmute();
        songs_level12.unmute();
        songs_level13.unmute();
        songs_level14.unmute();
        songs_level15.unmute();
        songs_level16.unmute();
        songs_level17.unmute();
        songs_level18.unmute(); 
        songs_level19.unmute();
        songs_level20.unmute();
        songs_level21.unmute();
        songs_level22.unmute();
        songs_level23.unmute();
        songs_efecto.unmute();
    }
  }
}
