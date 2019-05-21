# galaxy-tool-prinseq-sequence-analysis
Prinseq sequence analysis tool for galaxy (transferred from old galaxy). The original github page can be found here: https://github.com/naturalis/Galaxy-Pipeline
## Getting Started
### Prerequisites
make
```
sudo apt-get install build-essential
```
perl JSON module
```
sudo cpan JSON
```
perl Cairo module
```
sudo apt-get install pkg-config
sudo apt-get install libcairo2-dev libjpeg-dev libgif-dev
sudo cpan Cairo
```
perl Statistics::PCA 
```
sudo cpan Statistics::PCA
```
### Installing
Installing the tool for use in Galaxy
```
cd /home/galaxy/Tools
```
```
git clone https://github.com/naturalis/galaxy-tool-prinseq-sequence-analysis 
```
Add the following line to /home/galaxy/galaxy/config/tool_conf.xml
```
<tool file="/home/galaxy/Tools/galaxy-tool-prinseq-sequence-analysis/prinseq_analyze.xml" />
```
