BALLGAME_SRC = src/ballgame.lua src/ballgame/*.lua
BOUNCE_DEMO = bounce_demo.love
BOUNCE_DEMO_SRC = src/bounce_demo.lua src/bounce_demo/*.lua
HOLE_IN_ONE = hole_in_one.love
HOLE_IN_ONE_SRC = src/hole_in_one.lua src/hole_in_one/*.lua
ONE_POCKET = one_pocket.love
ONE_POCKET_SRC = src/one_pocket.lua src/one_pocket/*.lua
GAMES_DEST = $(HOME)/.local/share/games/love
ZIP = zip
CP = cp
MKDIR = mkdir
INSTALL = install

normal:
	$(MAKE) bounce_demo
	$(MAKE) hole_in_one
	$(MAKE) one_pocket

bounce_demo: main_bounce_demo.lua conf.lua $(BALLGAME_SRC) $(BOUNCE_DEMO_SRC)
	$(CP) main_bounce_demo.lua main.lua
	$(ZIP) $(BOUNCE_DEMO) $(BALLGAME_SRC) $(BOUNCE_DEMO_SRC) conf.lua main.lua

hole_in_one: main_hole_in_one.lua conf.lua $(BALLGAME_SRC) $(HOLE_IN_ONE_SRC)
	$(CP) main_hole_in_one.lua main.lua
	$(ZIP) $(HOLE_IN_ONE) $(BALLGAME_SRC) $(HOLE_IN_ONE_SRC) conf.lua main.lua

one_pocket: main_one_pocket.lua conf.lua $(BALLGAME_SRC) $(ONE_POCKET_SRC)
	$(CP) main_one_pocket.lua main.lua
	$(ZIP) $(ONE_POCKET) $(BALLGAME_SRC) $(ONE_POCKET_SRC) conf.lua main.lua

install:
	$(MKDIR) -p $(GAMES_DEST)
	$(INSTALL) $(BOUNCE_DEMO) $(GAMES_DEST)/
	$(INSTALL) $(HOLE_IN_ONE) $(GAMES_DEST)/
	$(INSTALL) $(ONE_POCKET) $(GAMES_DEST)/

clean:
	$(RM) main.lua
	$(RM) $(BOUNCE_DEMO)
	$(RM) $(HOLE_IN_ONE)
	$(RM) $(ONE_POCKET)
