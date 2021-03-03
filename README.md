# gTruthToPascalVOC
This code handles object detection annotation (boxlabel), and converts matlab's annotation format (gTruth) into pascalVOC's xml file format.

## How to use
----
1. Load the gTruth file into the workspace (just double click on the mat file)
  -Refers to the gTruth file exported using matlab imageLabeler.
2. run Matlab2VOC.m
3. Xml files will be created in the Matlab2VOC.m file path

## Attention
* Because it is based on Linux, Windows needs to modify the separator.
* This code was created by modifying the file in the link below.
  -https://kr.mathworks.com/matlabcentral/fileexchange/68747-convert-matlab-labellingsession-to-voc-format
