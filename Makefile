print-%: @echo $* is $($*)
CC=gcc
IDIR=/usr/include/libusb-1.0
CFLAGS=-I$(IDIR) -lusb-1.0
# DEPS = hellomake.h
DEPS = 
SRC = main.c
OBJ = duo
LIBS=$(-lusb-1.0,-L/usr/local/lib)

# %.o: %.c $(DEPS)
#       $(CC) -c -o $@ $< $(CFLAGS)

duo: $(OBJ)
	$(CC) $(SRC) -o $@ $(CFLAGS) $(LIBS)

clean: 
	rm $(OBJ)
