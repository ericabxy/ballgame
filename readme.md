Ballgame
========

This is a two-dimensional physics library and a collection of applets demonstrating ball-shaped motion and collision physics. The [LÖVE](https://love2d.org/) 2D game engine is required to run these applets.

Running Ballgame
----------------

After installing LÖVE, you should be able to run the ".love" applets using your preferred method. If you obtained Ballgame from the Git repository or source tarball, its possible to run the game from the command line. You must first copy one of the "*_main.lua" applets and rename it "main.lua". Then you can launch the applet using the following command.

    love .

Building Ballgame
-----------------

Use [GNU Make](https://www.gnu.org/software/make/) to construct the ".love" files.

    make

Clean up after you're done.

    make clean

Lutro Core
----------

The applets also run on the [LibRetro](https://www.libretro.com/) core [Lutro](https://lutro.libretro.com/), but there is no controller interface yet.
