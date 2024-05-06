# Makefile for Dungeon.
# Note: as of this date (Sept 1998), the Gnu fortran compiler will not
# compile Dungeon, because of some unimplemented intrinsic functions
# which are needed.  The free f2c compiler from 
#
# 	http://netlib.bell-labs.com/netlib/f2c/
#
# compiles the sources quite competently.  It should also be available
# in most Linux and *BSD distributions.

FC = f2c
FFLAGS = -A -C -Nn802
CFLAGS = -O

.f.c:
	$(FC) $(FFLAGS) $<

all:	dungeon textcnv

dungeon: actors.c ballop.c clockr.c demons.c dgame.c dmain.c dso.c \
	dsub.c dverb1.c dverb2.c gdt.c machdep.c nobjs.c np.c np2.c \
	objcts.c rooms.c sverbs.c verbs.c villns.c gettim.C \
	actors.o ballop.o clockr.o demons.o dgame.o dmain.o dso.o \
	dsub.o dverb1.o dverb2.o gdt.o machdep.o nobjs.o np.o np2.o \
	objcts.o rooms.o sverbs.o verbs.o villns.o gettim.o libdungeon.a
	$(CC) -s -o dungeon dmain.o np2.o -L. -ldungeon -lf2c -lm

# Static version, not normally compiled.
dungeon.s: actors.c ballop.c clockr.c demons.c dgame.c dmain.c dso.c \
        dsub.c dverb1.c dverb2.c gdt.c machdep.c nobjs.c np.c np2.c \
        objcts.c rooms.c sverbs.c verbs.c villns.c gettim.C \
        actors.o ballop.o clockr.o demons.o dgame.o dmain.o dso.o \
        dsub.o dverb1.o dverb2.o gdt.o machdep.o nobjs.o np.o np2.o \
        objcts.o rooms.o sverbs.o verbs.o villns.o gettim.o libdungeon.a
	$(CC) -s -static -o dungeon.s dmain.o np2.o -L. -ldungeon -lf2c -lm

textcnv: textcnv.c textcnv.o
	$(CC) -o textcnv textcnv.o -lf2c

# The gettim.C function enables Dungeon to keep track of the elapsed
# time in the game.  The uppercase suffix normally indicates a C++
# program, so it is overridden.  That way, "make clean" will not remove
# the one C program which must be kept.

gettim.o: gettim.C
	$(CC) -O -x c -c gettim.C

libdungeon.a:
	\rm -f libdungeon.a
	\ar rcuv libdungeon.a *.o
	\ar d libdungeon.a dmain.o np2.o
	-\ranlib libdungeon.a

clean:
	-\rm -f *.c *.o textcnv libdungeon.a dungeon dungeon.s
