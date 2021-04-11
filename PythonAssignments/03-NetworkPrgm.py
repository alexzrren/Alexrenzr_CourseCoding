# -*- coding: utf-8 -*-
"""
Created on Mon Dec 14 15:30:04 2020
@author: Alex Ren
@desc: Protein Sequence is from Ensembl Plants (aegilops tauschii)
"""
from urllib.request import urlopen
from urllib.parse import urlencode
import time

seqs = []
with open ('ProSeq.fa') as fasta: #read the fasta file
    for line in fasta:
        if line.startswith('>'):
            seqid = line.strip()
        else:
            seq = line
            seqs.append([seqid, seq]) #save the id and sequence into a list
output = ''
output += 'ProID\t\tFoldingRate\n'
url="http://ibi.hzau.edu.cn/FDserver/cido.php"
for seq in seqs:
    inputs = {'textarea': seq[1], 'radiobutton': 'Unknown',
          'ButtonRatePred': 'Predict Folding Rate'}
    params = bytes(urlencode(inputs),encoding='utf-8')
    f = urlopen(url, params)
    result = str(f.read())
    rate=result.split('rate:')[1][:-6] #get the text after the word 'rate' and then remove the .<br>' after it
    f.close()
    output += (seq[0][1:]+'\t\t'+rate+'\n')
    time.sleep(3) #sleep 3 seconds
with open ('ProFoldingRate.txt', 'w') as outfile: #write to file
    outfile.write(output)
print('SUCCESS!')