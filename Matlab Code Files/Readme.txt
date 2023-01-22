EVALUATION OF CATASTROPHIC INDICATORS FOR STABILITY ASSESSMENT
------------------------------------------------------------------------------

To evaluate each Indicator, separate .m files are there for every Indicator.

STEP-1
Either paste all these .m files in the MATTRANS folder or make these files add to path.

STEP-2
 Run respective .m files for evaluating Indicators
 - For Indicator based on Coherency run IBO_Coherency.m file
 - For Indicator based on Transient Energy Conversion run IBO_TEC.m file
 - For Indicator based on Dot Products (CSA) run CSA_Indicator.m file
 - For Indicator based on Wide Area Severity Index (WASI) run WASI_Indicator.m file
 - For Indicator based on Inter-area Stability Prediction Index (ISPI) run ISGA_Indicator.m file
 - For obtaining Generator Outputs run Gen_Output.m file

STEP-3
 After running the .m file, Program will ask for test system on which Stability Analysis has to be done. For example if the Analysis of Indicator is to be done on IEEE 10 bus system then provide 10 as input to the program.

STEP-4
 Following the test system, program will ask yor contingency details.
	- Fault Initiation Time
	- Fault Clearance Time
	- Faulted Bus
	- Fault cleared by tripping which line or line contingency

STEP-5
 Program will generate output*

* After these steps respective indicator will provide the Indicator curve as well as Performance Index.