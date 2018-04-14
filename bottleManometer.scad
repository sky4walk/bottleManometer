// Andre Betz
// github@AndreBetz.de

include <threads.scad>

$fn=100; 

module innenLeben(h=25) {
  translate([0,0,h])  {
    // Gewindeeinsatz
    cylinder(1,11.5/2,11.5/2,false);  

    // kegel  
    translate([0,0,-2])
      cylinder(2,0,11.5/2,false);
    // luftrohr
    translate([3,0,-26])
      cylinder(27,1,1,false);
  }
  // Flaschenhalterung
  translate([0,0,h-25])  {
    rotate([90,180,0])
     translate([0.5,-12.5,-15])
      rotate([0,0,-40])
       minkowski() {
        cube([30,0.1,30]);
         cylinder(r=1.9,h=2);  
       }      
   }
}

module innenLeben2(h=0) {
  translate([0,0,h])  {
    // Gewindeeinsatz
    cylinder(15,11.5/2,11.5/2,false);  

    // kegel  
    translate([0,0,-2])
      cylinder(2,0,11.5/2,false);
    // luftrohr
    translate([3,0,-26])
      cylinder(27,1,1,false);
  }
  // Flaschenhalterung
  translate([0,0,h-25])  {
    rotate([90,180,0])
     translate([0.5,-12.5,-15])
      rotate([0,0,-40])
       minkowski() {
        cube([30,0.1,30]);
         cylinder(r=1.9,h=2);  
       }      
   }
}
module innenLeben3() {
  // Gewindeeinsatz
  translate([(27-12.5)/2,0,7+2+5.1])
    metric_thread(diameter=10, pitch=1, length=7);
//    cylinder(7,11/2,11/2,false);  
  // Rohr
//  rotate([0,29.7,0])
  rotate([0,35,0])
    translate([-2,0,-2])  
      cylinder(24,1,1);
  // Flaschenhalterung
  /*  
  rotate([90,-90,0])
    translate([13,0,-20])
      minkowski() {
        cube([10,0.1,40]);
        cylinder(r=1.9,h=2);  
     }
  */    
  translate([7.5,0,0]){
    rotate([90,-120,0])
      translate([15,0,-20])
        minkowski() {
          cube([10,0.1,40]);
          cylinder(r=1.9,h=2);  
        }  
  }
}
module aussenLeben(h=2) {    
  translate([0,0,12.5+h])  {
    cylinder(23.5,25/2,25/2,false);
    sphere(r=25/2);
  }
  translate([0,0,h])    
    cylinder(2,5.25,10.5/2,false);
  translate([0,0,-2+h])
    cylinder(2,13/2,13/2,false);
}

module aussenLeben2(h=0) {    
  translate([0,0,h+7+2])
    cylinder(12,27/2,27/2,false);    
  translate([0,0,h+2])
    cylinder(7,0,27/2,false);
  translate([0,0,h+2])
    cylinder(2,8/2,8/2,false);    
  translate([0,0,h])
    cylinder(2,10/2,10/2,false);    
}

module gewindeM8PosMitte(h=10) {
  translate([0,0,30])  {
    // M8 Gewinde
    translate([0,0,0]) {  
      difference() {
        cylinder(8,11.5/2,11.5/2,false);
        translate([0,0,-1])
          metric_thread(diameter=8, pitch=1, length=10);
      }
    }
  }
}

module bottleManometer1() {
  difference() {
    aussenLeben();
    innenLeben();
  }

  gewindeM8PosMitte();
}

module bottleManometer2() {    
  difference() {
    aussenLeben2();
    innenLeben3();
  }
}

difference() {
 bottleManometer2();
//translate([-15,0,-1])   cube([30,30,30]);    
}