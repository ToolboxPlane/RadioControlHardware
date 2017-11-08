res = 256;
wallThickness = 2;

parts = "lipo"; //["top", "body", "lipo", "remote", "all"]

module JoyStick(){
    color("red"){
        difference(){
            cube([25.4, 31.75,1]);
            {
                translate([0,0,0.5]){
                    translate([2.54, 2.54, 0]){
                        cylinder(h=1, d=3.2, center=true, $fn=res);
                    }
                    translate([22.86,2.54 , 0]){
                        cylinder(h=1, d=3.2, center=true, $fn=res);
                    }
                    translate([2.54, 29.21, 0]){
                        cylinder(h=1, d=3.2, center=true, $fn=res);
                    }
                    translate([22.86, 29.21, 0]){
                        cylinder(h=1, d=3.2, center=true, $fn=res);
                    }
                }
                
            }
        }
    }
    color("DimGray"){
        translate([12.7, 17.78, 15.0/2+1]){
            cylinder(h=15, d=25.4, center=true, $fn=res);
            translate([0,0,(15.0+20.0)/2]){
                cylinder(h=20, d=20, center=true, $fn=res);
            }
        }
    }
}

module ArduinoStack(){
    difference(){
        color("blue"){
            cube([2.14*25.4*0.5, 2.77*25.4,32]);
        }
        
        translate([53.3/2 - 2.5, 14, 5]){
            cylinder(h=10, d=3.2, center=true, $fn=res);
        }
        translate([53.3/2 - (5.1+2.5), 14+1.3+50.8, 5]){
            cylinder(h=10, d=3.2, center=true, $fn=res);
        }
        translate([53.3/2 - 17.8, 14+1.3+50.8, 5]){
            cylinder(h=10, d=3.2, center=true, $fn=res);
        }
    }
    color("OrangeRed"){
        translate([0,0,32]){
            cube([50.2*0.5, 69.3,4]);
        }
    }
}

module BasePlate(){
    cube([62-wallThickness,85,wallThickness]);
}

module JoyStickCutout(){
    cylinder(h=wallThickness, d=25.4+2*wallThickness, center=true, $fn = res);
}

module Back(){
    rotate([0,90,0]){
        difference(){
            union(){
                cylinder(h=62, d=40, $fn=res);
                translate([0,-18,0]){
                    cube([20,20, 50/2 +2*wallThickness]);
                }
            }
            
            cylinder(h=62-wallThickness-10, d=40-2*wallThickness, $fn=res);
            translate([-25,0,0]){
                cube([50,25,62]);
            }
            translate([0,-18+wallThickness,0]){
                cube([20,20, 50/2 + wallThickness]);
            }
        }
    }
}

module Side(){
    cube([wallThickness, 85, 40]);
}

module Front(){
    difference(){
        cube([62, wallThickness, 40]);
        translate([12.5,wallThickness/2,25.3]){
            rotate([90,0,0]){
                cylinder(h=wallThickness, d=15, center=true, $fn=res);
            }
        }
    }
}

module JoyStickMount(){
    difference(){
        union(){
            cube([25.4, 31.75,15+wallThickness/2]);
            translate([-wallThickness, -wallThickness, 0]){
                cube([25.4+2*wallThickness, 31.75+2*wallThickness,wallThickness]);
            }
        }
        
        translate([2.54, 2.54, (15+wallThickness/2)/2]){
            cylinder(h=15+wallThickness/2, d=3.2, center=true, $fn=res);
        }
        translate([22.86,2.54 , (15+wallThickness/2)/2]){
            cylinder(h=15+wallThickness/2, d=3.2, center=true, $fn=res);
        }
        translate([2.54, 29.21, (15+wallThickness/2)/2]){
            cylinder(h=15+wallThickness/2, d=3.2, center=true, $fn=res);
        }
        translate([22.86, 29.21, (15+wallThickness/2)/2]){
            cylinder(h=15+wallThickness/2, d=3.2, center=true, $fn=res);
        }
    }
}

module LipoBay(){
    difference(){
        cube([50/2 + 2*wallThickness, 85,10+4*wallThickness]);
        translate([0, 0, wallThickness]){
            cube([50/2 +wallThickness, 85-wallThickness,10+4*wallThickness]);
        }
        translate([0,85-wallThickness,wallThickness+2]){
            cube([20,wallThickness,10]);
        }
        translate([50/2-2.54,85-2.54-wallThickness*2,5]){
            cylinder(h=10, d=3.2, center=true, $fn=res);
        }
        translate([50/2-2.54,85-(68-2.54)-wallThickness*2,5]){
            cylinder(h=10, d=3.2, center=true, $fn=res);
        }
    }
    
    translate([0,0,20]){
        rotate([0,90,0]){
            intersection(){
                difference(){
                    cylinder(h=50/2 + 2*wallThickness, d=40, $fn=res);
                    cylinder(h=50/2 + wallThickness, d=40-2*wallThickness, $fn=res);
                }
                translate([wallThickness,-20,0]){
                    cube([20,20,50/2 + 2*wallThickness]);
                }
            }
        }
    }
    
    translate([50/2 + 2*wallThickness, 0, 10+3*wallThickness]){
        difference(){
            cube([10,10,wallThickness]);
            translate([5,5,wallThickness/2]){
                cylinder(h=wallThickness, d=3.2, center=true, $fn=res);
            }
        }
    }
    
    translate([50/2 + 2*wallThickness, 85-10, 10+3*wallThickness]){
        difference(){
            cube([10,10,wallThickness]);
            translate([5,5,wallThickness/2]){
                cylinder(h=wallThickness, d=3.2, center=true, $fn=res);
            }
        }
    }
}

module LipoCharger(){
    difference(){
        cube([50/2,68,10]);
        translate([50/2-2.54,2.54,5]){
            cylinder(h=10, d=3.2, center=true, $fn=res);
        }
        translate([50/2-2.54,68-2.54,5]){
            cylinder(h=10, d=3.2, center=true, $fn=res);
        }
    }
}

module RemoteHalf(){
    if(parts == "all"){
        translate([0,-30,8]){
            ArduinoStack();
        }
        translate([32,0,20]){
            JoyStick();
        };
        
        translate([0,-29+2*wallThickness,-8]){
            color("blue"){
                LipoCharger();
            }
        }
    }
        
    color("LightGrey"){
        if(parts == "all" || parts == "remote" || parts == "top"){
            // Top
            difference(){
                translate([0,-40,44-wallThickness]){
                    BasePlate();
                }
                translate([32+25.4/2,17.78,wallThickness/2+44-wallThickness]){
                    JoyStickCutout();
                }
                translate([0,-30-wallThickness,44-wallThickness]){
                    cube([50.2*0.5+wallThickness, 69.3+wallThickness*2,4]);
                }
            
                translate([62-10-wallThickness+5,-40+5,44-wallThickness/2]){
                    cylinder(h=20, d=3.2, center=true, $fn=res);
                }
                translate([62-10-wallThickness+5,85-10+5-40,44-wallThickness/2]){
                    cylinder(h=wallThickness, d=3.2, center=true, $fn=res);
                }
            }

            translate([0,-40+85, 5-wallThickness/2]){
                Front();
            }
        }
           
        if(parts == "all" || parts == "remote" || parts == "body"){
            // Bottom
            translate([0,-40,5-wallThickness/2]){
                difference(){
                    union(){
                        BasePlate();
                        translate([62-10-wallThickness,0,0]){
                            cube([10,10,40-wallThickness]);
                        }
                        translate([62-10-wallThickness,85-10,0]){
                            cube([10,10,40-wallThickness]);
                        }
                    }
                    translate([50/2 + 2*wallThickness+5,5+wallThickness,wallThickness/2]){
                        cylinder(h=wallThickness, d=3.2, center=true, $fn=res);
                    }
                    translate([50/2 + 2*wallThickness+5,85-10+5+wallThickness,wallThickness/2]){
                        cylinder(h=wallThickness, d=3.2, center=true, $fn=res);
                    }
                    
                    translate([53.3/2 - 2.5, 14+10, wallThickness/2]){
                        cylinder(h=wallThickness, d=3.2, center=true, $fn=res);
                    }
                    translate([53.3/2 - (5.1+2.5), 14+1.3+50.8 +10, wallThickness/2]){
                        cylinder(h=wallThickness, d=3.2, center=true, $fn=res);
                    }
                    translate([53.3/2 - 17.8, 14+1.3+50.8+10, wallThickness/2]){
                        cylinder(h=wallThickness, d=3.2, center=true, $fn=res);
                    }
                    translate([62-wallThickness-5,5,35/2]){
                        cylinder(h=35, d=8, center=true, $fn=res);
                    }
                    translate([62-wallThickness-5,85-10+5,35/2]){
                        cylinder(h=35, d=8, center=true, $fn=res);
                    }
                    translate([62-wallThickness-5,5,20]){
                        cylinder(h=40, d=3.2, center=true, $fn=res);
                    }
                    translate([62-wallThickness-5,85-10+5,20]){
                        cylinder(h=40, d=3.2, center=true, $fn=res);
                    }
                    translate([32,40,0]){
                        translate([2.54, 2.54, wallThickness/2]){
                            cylinder(h=wallThickness, d=8, center=true, $fn=res);
                        }
                        translate([22.86,2.54 , wallThickness/2]){
                            cylinder(h=wallThickness, d=8, center=true, $fn=res);
                        }
                        translate([2.54, 29.21, wallThickness/2]){
                            cylinder(h=wallThickness, d=8, center=true, $fn=res);
                        }
                        translate([22.86, 29.21, wallThickness/2]){
                            cylinder(h=wallThickness, d=8, center=true, $fn=res);
                        }
                    }
                }
            }
               
            translate([0,-40,25-wallThickness/2]){
                Back();
            }
            translate([62-wallThickness,-40,5-wallThickness/2]){
                Side();
            }
            
            translate([32,0,5+wallThickness/2]){
                JoyStickMount();
            }
        }

        if(parts == "all" || parts=="lipo" || parts == "remote"){
            translate([0,-38,-15+wallThickness/2]){
                LipoBay();
            }
        }
    }
}

RemoteHalf();
mirror([1,0,0]){
    RemoteHalf();
}

