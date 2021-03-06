This directory contains all the matlab code, and associated .mex files for the BCI framework used in the BCI Practical course.
This system has been tested to work on Mac, Windows or Linux, and works with any Matlab version >R14.

An overview of the included directories is:
  dataAcq -- code for data acquisition, i.e. interfacing to recording hardware, based on the field-trip buffer specification <http://fieldtrip.fcdonders.nl/development/realtime>.
				 Also scripts (.bat for windows, .sh for Linux/Mac) for starting the executables
  dataAcq/buffer -- mex files for MATLAB access to fieldtrip buffer data storage
  dataAcq/buffer/glnx86 -- linux executable binaries for hardware access
  dataAcq/buffer/glnxa86 -- 64-bit linux executable binaries for hardware access
  dataAcq/buffer/maci   -- (intel) Mac OS executable binaries for hardware access
  dataAcq/buffer/maci64 -- 64-bit (intel) Mac OS executable binaries for hardware access
  dataAcq/buffer/win32  -- windows executable binaries for hardware access
  dataAcq/buffer/c      -- buffer client driver code in C
  dataAcq/buffer/csharp -- buffer client driver code in C#
  dataAcq/buffer/python -- buffer client driver code in Python
  dataAcq/buffer/java   -- buffer client driver code in java

  signalProc -- code for pre-processing EEG data, training classifiers, and applying the trained classifiers on-line for the ERP and ERSP based BCIs

  stimulus -- utility functions for generating correctly randomised stimulus sequences

  utilties -- various utility functions for BCI use, in particular for loading cap position layout files, setting up paths, option parsing etc.

  classifiers -- code for the linear logistic regression classifier, and associated utility functions for e.g. cross-validation, performance estimation etc.

  plotting -- various plotting utility functions, e.g. plotting topographic head outlines, plotting 3-d data (multi-plots), zooming multi-plots
  
  games -- Example BCI system for playing 3 simple games (Snake, Sokoban and Pacman) using and visual evoked response (ERP) type BCI

  offline -- Example scripts for process saved BCI data offline, i.e. analysing data loaded from file

  example -- Example clients for the major supported programming languages; Matlab, java, Python, C#, C

  tutorial -- Tutorial arranged in lectures 1 through 5 about how BCIs work, 
              the structure and components of a BCI and how to build a standard BCI with the buffer_bci framework
				 
  imaginedMovement -- Example BCI system for controlling a cursor using an imagined movement (ERSP) type BCI

  matrixSpeller -- Example BCI system for spelling characters using a visual matrix-speller (p300) type BCI

  matrixSpellerPTB -- Example BCI system for spelling characters using a visual matrix-speller (p300) type BCI.  This version uses PsychToolBox to improve the timing of the visual stimulus rendering.
    N.B. to use this you will need to set the PTB path correctly in utilities/initPTBPaths.m

  cursorControl -- Example BCI system for controlling a cursor in 2-d using
                             visual evoked response (ERP) type BCI

  evokedDemo -- Example system for visualizing responses evoked by visual
                            stimulus, both transient and steady state, and
                            attention related (p300 type) changes.

  inducedDemo -- Example system for visualizing induced responses.


Installation
------------

Copy these directories somewhere on your local harddrive.

Note: if MATLAB/Octave is not found automatically then modify the path in the file utilities/findMatlab.bat (windows) or utilities/findMatlab.sh (Linux/MacOSX)

QuickStart
----------

Read the readme.txt file in either of the games, imaginedMovement, or matrixSpeller directories for instructions on how to startup and run those demos.

To run the games demo:

1) Start the data Acquisation system.

 If you have *no* EEG hardware, but just want to test:
  1.1) start a buffer by running: dataAcq/startBuffer.bat or buffer/startBuffer.sh
  1.2) start a *simulated* data source by running: dataAcq/startSignalProxy.bat or .sh

 If you have EEG hardware connected then depending on the hardware:
  TMSi Mobita
  		 1.1) start a buffer by running: dataAcq/startBuffer.bat or buffer/startBuffer.sh
       1.2) start the hardware driver by running: dataAcq/startMobita.bat or dataAcq/startMobita.sh
   Emotiv Epoc:
	    1.1) start the hardware driver *only* by running: dataAcq/startEmotiv.bat or dataAcq/startEmotiv.sh
   Biosemi Active 2:
       1.1) start the hardware driver *only* by running: dataAcq/startBiosemi.bat or dataAcq/startBiosemi.sh

2) Start the Matlab based signal processing process by running: games/startSigProcBuffer.bat or .sh

3) Start the Matlab based experiment control & stimulus presentation system by running : games/runGame.bat or runGame.sh

4) Type in the subject name to the experiment control window, and then run through each of the experiment phases: 

   Practice -- practice the task to be used in the BCI.  Green arrows indicate target locations you should attend to by counting the white and red arrow 'flashes'

   Calibration -- get calibration data by attending as instructed for ~90seconds

   Classifier Training -- train a classifier using the calibration data.  3 windows will pop-up showing: Per-class ERPs, per-class AUCs, and cross-validated classification performance.

5) Select the game you would like to play!
