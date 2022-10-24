# galaxy-tool-prinseq-sequence-analysis
Generate summary statistics (both textual and graphical) of sequence data.  

This version no longer includes a PCA plot because no conda package exists  
for the previous implementation (perl Statistics::PCA)

## Installation
### Manual  
Clone this repo in your Galaxy ***Tools*** directory:  
`git clone https://github.com/naturalis/galaxy-tool-prinseq-sequence-analysis`  

Make sure the script is executable:  
`chmod 755 galaxy-tool-prinseq-sequence-analysis/prinseq_analyze.sh`  

Append the file ***tool_conf.xml***:    
`<tool file="/path/to/Tools/galaxy-tool-prinseq-sequence-analysis/prinseq_analyze.xml" />`  

### Ansible
Depending on your setup the [ansible.builtin.git](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/git_module.html) module could be used.  
[Install the tool](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/git_module.html#examples) by including the following in your dedicated ***.yml** file:  

`  - repo: https://github.com/naturalis/galaxy-tool-prinseq-sequence-analysis`  
&ensp;&ensp;`prinseq_analyze.xml`  
&ensp;&ensp;`version: master`  
