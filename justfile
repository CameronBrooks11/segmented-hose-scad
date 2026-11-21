default:
    @just --list

# Render hose segments: size, how two fit together, and the refusals
test:
    python3 tests/test_segmented_hose.py

# Everything CI runs, bar the tests
check: fmt-check

# Format the .scad sources with topiary (.topiary/languages.ncl)
fmt:
    git ls-files -z '*.scad' | xargs -0 -r topiary format

# Check the .scad sources are formatted, without changing them
fmt-check:
    git ls-files -z '*.scad' | xargs -0 -r -n1 topiary format --check

# Render the README picture into assets/
images:
    @mkdir -p assets
    openscad --camera=0,0,20,70,0,30,110 --imgsize=600,600 --colorscheme=Tomorrow -D segments=3 -o assets/three-segments.png segmented_hose.scad
