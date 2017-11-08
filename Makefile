OPENSCADC=openscad
INPUT=main.scad
OUTPUT=main.stl
FLAGS="res=8"
STLVIEWER=meshlab

all: compile view

compile:
	$(OPENSCADC) -o $(OUTPUT) -D $(FLAGS) $(INPUT)

clean:
	rm $(OUTPUT)

view:
	$(STLVIEWER) $(OUTPUT) 

build:
	$(OPENSCADC) -o top.stl -D "parts=\"top\"" $(INPUT) &
	$(OPENSCADC) -o body.stl -D "parts=\"body\"" $(INPUT) &
	$(OPENSCADC) -o lipo.stl -D "parts=\"lipo\"" $(INPUT)
