#Path to diferent folder of the project
Sources = Source
Binaries = bin

#Constant definition
CC = gcc
CFLAGS = -Wall -g
IPATH = -I$(Sources)

#default command
$(Binaries)/test.app: $(Binaries)/Hermes.lib $(Sources)/test.c $(Sources)/lib/Artic42.h
	@$(CC) $(CFLAGS) $(IPATH) $(Sources)/test.c $(Binaries)/Hermes.lib -o $(Binaries)/test.app
	@chmod -v uo+x $(Binaries)/test.app

#creation of other objects
$(Binaries)/Hermes.lib: $(Sources)/Hermes.c $(Sources)/Hermes.h $(Sources)/lib/Artic42.h
	@$(CC) $(CFLAGS) -c $(IPATH) $(Sources)/Hermes.c -o $(Binaries)/Hermes.lib
	@cp $(Binaries)/Hermes.lib Hermes.lib
	@cp $(Sources)/Hermes.h Hermes.h

#Abreviated commands:
test: $(Binaries)/test.app
	@$(Binaries)/test.app

all: $(Binaries)/test.app

clean:
	@rm Hermes.h Hermes.lib
	@rm $(Binaries)/*
	@touch $(Binaries)/keepInGit
