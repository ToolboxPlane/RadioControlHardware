OPENSCADC=openscad
INPUT=main.scad
OUTPUT=main.stl
FLAGS="res=64"
STLVIEWER=meshlab

all: compile view

compile:
	$(OPENSCADC) -o $(OUTPUT) -D $(FLAGS) $(INPUT)

clean:
	rm $(OUTPUT)

view:
	$(STLVIEWER) $(OUTPUT) & 
