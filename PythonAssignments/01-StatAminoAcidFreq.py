#Assignment01--Statistics of Amino Acids
# -*- coding: utf-8 -*-
"""
Created on Wed Nov 25 11:05:06 2020
@author: 生信1801任梓睿
"""

AAstr = 'MNAPERQPQPDGGDAPGHEPGGSPQDELDFSILFDYEYLNPNEEEPNAHKVASPPSGPAYPDDVLDYGLKPYSPLASLSGEPPGRFGEPDRVGPQKFLSAAKPAGASGLSPRIEITPSHELIQAVGPLRMRDAGLLVEQPPLAGVAASPRFTLPVPGFEGYREPLCLSPASSGSSASFISDTFSPYTSPCVSPNNGGPDDLCPQFQNIPAHYSPRTSPIMSPRTSLAEDSCLGRHSPVPRPASRSSSPGAKRRHSCAEALVALPPGASPQRSRSPSPQPSSHVAPQDHGSPAGYPPVAGSAVIMDALNSLATDSPCGIPPKMWKTSP'
count={}
frq={}
output=''#准备输出到文件的字符串
for i in set(AAstr): #set去重，并循环迭代所有氨基酸存入上面两个字典
    output+=(i+'\t')
    count[i]=AAstr.count(i) #用字符串的count方法计数
    frq[i]=count[i]/len(AAstr) #除以总数获得频率
output+='\n'
for aacount in list(count.values()):#循环遍历氨基酸计数字典值的列表
    output+=(str(aacount)+'\t')
output+='\n'
for aafrq in list(frq.values()):#循环遍历氨基酸频率字典值的列表
    output+=(str(aafrq)+'\t')
output+='\n'
fname=r'D:/frq.txt'
with open(fname,'wt') as f:#打开文件并一次性写入
    f.write(output) 
print("done!")