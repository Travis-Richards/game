# This file is used by Linux (and sometimes Apple) systems
# to automatically compile certain source files from the command line.

.PHONY: all
all: GameApp.class

GameApp.jar: GameApp.class
	jar cf $@ *.class

GameApp.class: GameApp.java \
               Game.class \
               GameView.class

Game.class: Game.java

GameView.class: GameView.java KeyboardController.class

KeyboardController.class: KeyboardController.java

%.class: %.java
	javac $<

.PHONY: clean
clean:
	$(RM) *.class GameApp.jar

.PHONY: docs
docs:
	javadoc *.java