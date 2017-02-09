# mzml2metfrag

Version: 0.1

## Short Description

Container to convert mzML files to MetFrag parameters used as direct input for MetFragCL.

## Description

Native mzML files cannot be used directly to be processed by MetFrag which requires a conversion. Therefore this container used the Java implemented MetFragParameterExport (https://github.com/c-ruttkies/MetFragParameterExport) to retrieve the MS/MS spectra and additional parameters and convert them to MetFrag conform parameters. These parameters can be used as direct input for the MetFrag command line tool (https://github.com/c-ruttkies/MetFragRelaunched).

## Issues

MetFrag needs information about the precursor adduct types to process the MS/MS data correctly. Currently, there is no CV term available to represent this information in mzML. The MetFragParameterExport tool scans mzML files for user parameters (tag: userParam) to retrive this information, e.g.:
```bash
<userParam name="Precursor_Ion" type="xsd:string" value="[M+H]+"/>
```
Users have to make sure that this information is available in the input mzML files as user parameter until CV terms have been specified. The MetFragParameterExport tool will be enhanced to also read additonal information like the molecular formula which will be used as parameter for the MetFrag processing.

## Functionality

- Preprocessing
  
## Instrument Data Types

- MS

## Tool Authors

- Christoph Ruttkies (IPB-Halle)

## Container Contributors

- [Christoph Ruttkies](https://github.com/c-ruttkies) (IPB-Halle)

## Git Repository

- https://github.com/c-ruttkies/MetFragParameterExport


## Installation 

```bash
docker build -t metfragparameterexport .
```

## Usage Instructions

For direct docker usage:

```bash
docker run -v /data:/data metfragparameterexport MaximumSpectrumLimit=10 InputFile=/data/tiny.mzML OutputFolder=/data/
```
