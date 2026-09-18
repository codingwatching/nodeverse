rotate(-90, [1, 0, 0])
rotate(90, [0, 0, 1])
translate([-1, 0, 0]) {
    translate([8/16, 0, -4/16])
    cube([32/16, 16/16, 8/16], center = true);
    translate([-4/16, 0, -3/16])
    cube([4/16, 12/16, 10/16], center = true);
}
