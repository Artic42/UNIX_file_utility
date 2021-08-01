#Path to different folder of the project
Sources = Source
Binaries = bin

#Constant definition
CC = gcc
CFLAGS = -Wall
DFLAGS = -g $(CFLAGS)
IPATH = -I$(Sources)

#default command
$(Binaries)/test.app: $(Binaries)/Hermes.lib $(Sources)/test.c $(Sources)/lib/Artic42.h
	@$(CC) $(CFLAGS) $(IPATH) $(Sources)/test.c $(Binaries)/Hermes.lib -o $(Binaries)/test.app
	@chmod uo+x $(Binaries)/test.app

$(Binaries)/test_debug.app: $(Binaries)/HermesD.lib $(Sources)/test.c $(Sources)/lib/Artic42.h
	@$(CC) $(DFLAGS) $(IPATH) $(Sources)/test.c $(Binaries)/HermesD.lib -o $(Binaries)/test_debug.app
	@chmod uo+x $(Binaries)/test_debug.app

#creation of other objects
$(Binaries)/Hermes.lib: $(Sources)/Hermes.c $(Sources)/Hermes.h $(Sources)/lib/Artic42.h
	@$(CC) $(CFLAGS) -c $(IPATH) $(Sources)/Hermes.c -o $(Binaries)/Hermes.lib
	@cp $(Binaries)/Hermes.lib Hermes.lib
	@cp $(Sources)/Hermes.h Hermes.h

$(Binaries)/HermesD.lib: $(Sources)/Hermes.c $(Sources)/Hermes.h $(Sources)/lib/Artic42.h
	@$(CC) $(DFLAGS) -c $(IPATH) $(Sources)/Hermes.c -o $(Binaries)/HermesD.lib


#Abbreviated commands:
test: $(Binaries)/test.app
	@$(Binaries)/test.app

all: $(Binaries)/test.app

debug: $(Binaries)/test_debug.app

clean:
	@rm Hermes.h Hermes.lib
	@rm $(Binaries)/*
	@touch $(Binaries)/keepInGit
