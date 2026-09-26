rotate(-90, [1, 0, 0]) {
    translate([0, 0, -2/16])
    difference() {
        cube([12/16, 12/16, 12/16], center = true);
        cube([14/16, 14/16, 2/16], center = true);
    }
    cube([10/16, 10/16, 6/16], center = true);

    translate([0, 0, 5/16])
    cube([6/16, 6/16, 2/16], center = true);
    
    translate([1.5/16, 1.5/16, 0])
    cube([1/16, 1/16, 16/16], center = true);
    
    translate([-1.5/16, -1.5/16, 0])
    cube([1/16, 1/16, 16/16], center = true);
    
    translate([1.5/16, -1.5/16, 0])
    cube([1/16, 1/16, 16/16], center = true);
}