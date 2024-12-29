BALLPHYS_SOURCE = src/ballphys.lua src/ballphys/*.lua
BOUNCE_DEMO_SOURCE = src/bounce_demo.lua src/bounce_demo/*.lua
HOLE_IN_ONE_SOURCE = src/hole_in_one.lua src/hole_in_one/*.lua
ZIP = zip

normal: main.lua conf.lua
	$(MAKE) bounce_demo

bounce_demo: main.lua conf.lua $(BALLPHYS_SOURCE) $(BOUNCE_DEMO_SOURCE)
	$(ZIP) BounceDemo.love $(BALLPHYS_SOURCE) $(BOUNCE_DEMO_SOURCE) conf.lua main.lua

hole_in_one: main.lua conf.lua $(BALLPHYS_SOURCE) $(HOLE_IN_ONE_SOURCE)
	$(ZIP) HoleInOne.love $(BALLPHYS_SOURCE) $(HOLE_IN_ONE_SOURCE) conf.lua main.lua

clean:
	$(RM) BounceDemo.love
	$(RM) HoleInOne.love
