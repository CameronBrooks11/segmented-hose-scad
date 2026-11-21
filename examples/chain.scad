// A straight chain of segments at a looser fit, built from another file.
use <../segmented_hose.scad>

// A used file's $fn doesn't reach its modules, so set it here.
$fn = 128;

// Segments in the chain
count = 4; // [1:1:12]

// Added to the socket's diameter, mm
clearance = 0.1;

for (i = [0:count - 1])
    translate([0, 0, i * segmented_hose_pitch()])
        segmented_hose_segment(clearance=clearance);
