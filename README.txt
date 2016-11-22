Title:			BaseHarvest README.txt info
Project:		LANDIS-II Landscape Change Model
Project Component:	Extension-Base-Harvest
Repository:		https://github.com/LANDIS-II-Foundation/Extension-Base-Harvest
Author:			LANDIS-II Foundation
Revision Date:		21 Nov 2016


Welcome to Extension-Base-Harvet! This README.txt file provides the following info:

	1) the basic relationship between 'the science' (various biological, geological, geochemical,
climatological, ecological, spatial, and landscape ecological mechanisms) and 'the model' (LANDIS-II)

	2) the basic programming process for modifying Extension-Base-Harvest

	3) the basic testing of the freshly (re)built Extension-Base-Harvest .dll


#####################
Science and the Model
######################

LANDIS-II uses sets of linked .dll and .exe files to produce science-based output. The .dll and .exe files 
(collectively known as 'assemblies') are constructed by compiling sets of .cs files using the .NET Framework. 
The .cs files are written in the programming language, C# and may contain both code and data. The .NET Framework 
provides the runtime environment and libraries needed for executing a C# program; C# code cannot be independently 
executed without the help of the .NET Framework because it is so-called 'managed code'.  The science behind LANDIS-II 
resides in the C# code and the data contained in the .cs files, the so-called source code.

Integrated development environments (IDEs) are used to assist in compiling .cs files into assemblies. Visual Studio
and MonoDevelop are two useful IDEs for the C# programming language.  To help with C# programming tasks, which must compile 
sets of .cs files, Visual Studio creates 'container' files called 'projects' and 'solutions'. A project is a collection of 
source files that the C# compiler combines to produce a single output — typically either a library (.dll) or an executable 
program (.exe). A Visual Studio solution file is designated with a .csproj extension. A solution is a set of one or more 
.csproj files and has a .sln extension.


The process of building 'the science' into 'the model' is done via an Extension (like Extension-Base-Harvest).
The process looks like this:

a set of .cs files is created that translate the science behind the extension to algorithms and script
  ==> a .csproj file is created that link the .cs files together within an IDE
    ==> the .cs files are modified, as needed, to reflect updated science or to create a new extension 
      ==> the IDE takes the set of modified .cs files and 'builds' an assembly (.dll or .exe file)
        ==> the newly-built .dll files constitute 'the extension' and are packaged into a Windows-based installer 
          ==>  LANDIS-II users install the newly-built .dll files into the C:\Program Files\LANDIS-II\v6\bin\extensions directory


#################################
building the Extension-Base-Harvest
.dll from source code
#################################

NB. It is recommended that you use Git for version control and change tracking.
This means cloning the Extension-Base-Harvest reposotory to your local machine.
Help with Git functionality can be found in the ProGit Manual; freely available
as a .pdf (https://git-scm.com/book/)

NB. Should you want the LANDiS-II Foundation to consider your changes for inclsuion in
the LANDIS-II Foundation's main GitHub repository (https://github.com/LANDIS-II-Foundation/)
you will need to submit a Pull request.

NB. Visual Studio will mark references to the .dlls as "unresolved" until the solution is actually (re)built.
Once freshly (re)built, Visual Studio will automatically download the required .dlls and put them in the
correct folder (.../src/libs/). The .dlls for (re)building Extension-Base-Harvest are downloaded, as the latest versions, 
from https://github.com/LANDIS-II-Foundation/Support-Library-Dlls.


The following uses a Windows/Git command-line interface and Visual Studio (VS); some outputs are given.
A very straighforward Windows/Git interface is "git BASH" (https://git-for-windows.github.io/)


===== STEP1. Clone and .git track the repository ============================================

	a. clone the Extension-Base-Harvest repo 

$ git clone https://github.com/bmarron18/Extension-Base-Harvest.git
Cloning into 'Extension-Base-Harvest'...
remote: Counting objects: 429, done.
remote: Compressing objects: 100% (17/17), done.
remote: Total 429 (delta 6), reused 0 (delta 0), pack-reused 410
Receiving objects: 100% (429/429), 2.54 MiB | 1.09 MiB/s, done.
Resolving deltas: 100% (263/263), done.



==== STEP2. Setup Visual Studio and load the project =====================================

	a. open VS and load "base-harvest.csproj"

	b. select the 'Solution Explorer' tab
Solution 'base harvest' (1 project)
  C# base-harvest
    Prperties
    References
    EventsLog.cs
    InputParametersParser.cs
    MetadataHandler.cs
    packages.config
    PlugIn.cs
    SummaryLog.cs

	b1. note that VS has added three (3) directories to the .git-tracked folder
containing the cloned repo. Git does NOT track the \bin folder:

\.vs
\bin
\obj

	c. change the VS Reference path to ensure the solution builds correctly.
	c1. select the 'Solution Explorer' tab ==> double-click on Properties (wrench icon)
	c2. a new window opens; note that the tab, 'Reference Paths' (on the left-hand side) reports, "(Not set)"
	c3. click on the 'Reference Paths' tab; paste in the PATH TO THE GIT-TRACKED REPO ON YOUR MACHINE in the field
	    under "folder:"; and add the new path as an option by using the "Add folder" button
	c4. two reference paths should now be listed:
"C:\Users\<you>\<your-path-to-the-local-repo>\Extension-Base-Harvest\src\libs\"
"C:\Users\bmarr\Desktop\BaseHarvest_testRepo\Extension-Base-Harvest\src\libs\"

	c5. delete the "C:\Users\bmarr\Desktop\BaseHarvest_testRepo\Extension-Base-Harvest\src\libs\" path 
	    and Save

	e. Under tab "File", Save as a solution file (.sln)



===== STEP3. (Re)build the project ================================================================

	a. Under the "Build" tab, select "Build base-harvest"
	a1. Three (3) new files are created by the build:
Landis.Extension.BaseHarvest-3.0.dll
Landis.Extension.BaseHarvest-3.0.pdb
Landis.Library.Metadata.dll.VisualState.xml





################
testing the 
(re)built extension
##################

==== STEP1. Switch out the .dll files =============================================== 

	a. remove Landis.Extension.BaseHarvest-3.0.dll from C:\Program Files\LANDIS-II\v6\bin\extensions>

	b. paste in freshly (re)built Landis.Extension.BaseHarvest-3.0.dll



===== STEP2. Perform a test run ======================================================

	a. run the Base Harvest example provided with the installed Extension_Base-Harvest from the Landis Foundation site
	   (http://www.landis-ii.org/extensions 
	a1. if successful, the newly-built .dll will have added new output: a "Metadata" folder
	a2. the "Metadata" folder houses another folder ("Base Harvest") within which are various .xml files
Directory of C:\Program Files\LANDIS-II\v6\examples\Base Harvest
08/03/2015  10:18             1,099 age-only-succession-dynamic-inputs.txt
08/03/2015  10:18               259 age-only-succession.txt
08/03/2015  10:18             2,289 BaseHarvest-v1.2-Sample-Input.TXT
08/03/2015  10:18             9,929 ecoregions.gis
08/03/2015  10:18               202 ecoregions.txt
11/13/2016  15:35    <DIR>          harvest
11/13/2016  15:35             7,007 harvest-event-test-log.csv
08/03/2015  10:18             9,929 initial-communities.gis
08/03/2015  10:18             1,162 initial-communities.txt
11/13/2016  15:35             2,950 Landis-log.txt
08/03/2015  10:18            10,240 management.gis
11/13/2016  15:35    <DIR>          Metadata
08/03/2015  10:18               918 scenario.txt
08/03/2015  10:18               132 SimpleBatchFile.bat
08/03/2015  10:18             1,915 species.txt
08/03/2015  10:18            10,240 stand.gis