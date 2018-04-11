// Andre Betz
// github@AndreBetz.de

include <threads.scad>

$fn=100; 

module innenLeben(h=25) {
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

module innenLeben2(h=25) {
  translate([0,0,h])  {
    // Gewindeeinsatz
    cylinder(15,11.5/2,11.5/2,false);  

    // kegel  
    translate([0,0,-2])
      cylinder(2,0,11.5/2,false);
      
    // luftrohr
      rotate([0,-18,0])
        translate([0,0,-15])
          cylinder(15,1,1,false);
      rotate([0,18,0])
        translate([8.5,0,-26])
          cylinder(15,1,1,false);
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


module gewindeM8(h=10) {
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
    innenLeben2();
  }

  gewindeM8();
}

bottleManometer1();