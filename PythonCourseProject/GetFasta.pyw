# -*- coding: utf-8 -*-
"""
Created on Wed Dec 30 00:45:59 2020
@author: Zirui Ren 任梓睿 - bioinfo1801
@dependencise: tkinter, matplotlib, biopython, pillow, webbrowser
"""
import tkinter as tk
import tkinter.messagebox
import os
from Bio import Entrez
from Bio import SeqIO
from PIL import Image, ImageTk
import matplotlib.pyplot as plt
import webbrowser


#定义GUI类
class GUI_1():
    def __init__(self,root):
        self.root = root
           
    #定义窗口初始化函数，定位窗口元素
    def set_init_window(self):
        self.root.title("GetFasta ver2.0")
        self.root.geometry('870x825')
        
        self.input_sign_label = tk.Label(self.root, text="Accession No.")
        self.input_sign_label.grid(row=0, column=0,pady=10)
        
        self.get_button = tk.Button(self.root, text="Get", width=10,command=self.getseqbtn)
        self.get_button.grid(row=0, column=2,pady=10)
        
        self.input_data_Entry = tk.Entry(self.root, width=27)
        self.input_data_Entry.grid(row=0, column=1,pady=10)
        
        self.desc_label = tk.Label(self.root, text='Info')
        self.desc_label.grid(row=1, column=1)
        
        self.desc_Text = tk.Text(self.root, width=80, height=6)
        self.desc_Text.grid(row=2,column=0,columnspan=3,rowspan=3, padx=15)
        
        self.seq_label = tk.Label(self.root, text='Sequence')
        self.seq_label.grid(row=5, column=1)
        
        self.seq_Text = tk.Text(self.root, width=80, height=45)
        self.seq_Text.grid(row=6,column=0,columnspan=3,rowspan=45, padx=15)
        
        self.analyze_button = tk.Button(self.root, text="Analyze", width=15,command=self.analyze)
        self.analyze_button.grid(row=53, column=2, pady=15,padx=40)
        
        self.save_button = tk.Button(self.root, text="Save FASTA", width=15,command=self.fastasave)
        self.save_button.grid(row=53, column=0, pady=15,padx=40)
        
        self.per_sign_label = tk.Label(self.root, text="Nucleotiede Percentage:")
        self.per_sign_label.grid(row=0, column=3,rowspan=2)
        
        self.pera_sign_label = tk.Label(self.root, text="A%:")
        self.pera_sign_label.grid(row=2, column=3)
        self.pera_data_Entry = tk.Entry(self.root, width=9)
        self.pera_data_Entry.grid(row=2, column=4, padx=10)        
        
        self.pert_sign_label = tk.Label(self.root, text="T%:")
        self.pert_sign_label.grid(row=3, column=3)
        self.pert_data_Entry = tk.Entry(self.root, width=9)
        self.pert_data_Entry.grid(row=3, column=4, padx=10)        
        
        self.perc_sign_label = tk.Label(self.root, text="C%:")
        self.perc_sign_label.grid(row=4, column=3)
        self.perc_data_Entry = tk.Entry(self.root, width=9)
        self.perc_data_Entry.grid(row=4, column=4, padx=10)        
        
        self.perg_sign_label = tk.Label(self.root, text="G%:")
        self.perg_sign_label.grid(row=5, column=3)
        self.perg_data_Entry = tk.Entry(self.root, width=9)
        self.perg_data_Entry.grid(row=5, column=4, padx=10)        
        
        self.perat_sign_label = tk.Label(self.root, text="AT%:")
        self.perat_sign_label.grid(row=7, column=3)
        self.perat_data_Entry = tk.Entry(self.root, width=9)
        self.perat_data_Entry.grid(row=7, column=4, padx=10)        
        
        self.pergc_sign_label = tk.Label(self.root, text="GC%:")
        self.pergc_sign_label.grid(row=9, column=3)
        self.pergc_data_Entry = tk.Entry(self.root, width=9)
        self.pergc_data_Entry.grid(row=9, column=4, padx=10)
        
        self.length_label = tk.Label(self.root, text="Length:")
        self.length_label.grid(row=11, column=3)
        self.length_data_Entry = tk.Entry(self.root, width=9)
        self.length_data_Entry.grid(row=11, column=4, padx=10)   

        self.figure_label = tk.Label(self.root, text='Percentage Figure:')
        self.figure_label.grid(row=23, column=3)
        
        self.figure_default()
        
        self.source_label = tk.Label(self.root, text='Data Source:')
        self.source_label.grid(row=35, column=3)
        
        self.icon_open = Image.open('ncbi-ico.png')
        self.icon_png = ImageTk.PhotoImage(self.icon_open)
        self.icon_button = tk.Label(image = self.icon_png)
        self.icon_button.grid(row=36,column=3,columnspan=2)
        self.icon_button.bind("<Button-1>",self.open_ncbi)
        
        self.notice_label = tk.Label(self.root, text='(Click image above to open in browser)')
        self.notice_label.grid(row=37, column=3,columnspan=2)

        self.help_button = tk.Button(self.root, text="Help", width=15, command=self.printhelp)
        self.help_button.grid(row=43, column=3, columnspan=2, pady=5)

        self.copyright_sign_label = tk.Label(self.root, text="Author:Zirui Ren - Bioinfo1801\nStuID:2018317220104 ver2.0")
        self.copyright_sign_label.grid(row=53, column=3,columnspan=2)

    
    #biopython获取序列的核心函数，成功运行会返回一个句柄
    def getseqcore(self,inputname):
        if inputname == '':
            tk.messagebox.showerror(title = 'ERROR', message='Please input an accession ID') #输入为空报错
            return 0
        Entrez.email = "1131061444@qq.com"
        try:
            f_hd = Entrez.efetch(db="nucleotide",id=[inputname],rettype='fasta') 
            return f_hd
        except:
            tk.messagebox.showerror(title = 'ERROR',message='Input ID not found!') #无法获取序列报错
            self.input_data_Entry.delete(0,'end')
            return 0
    
    #定义点击Get按钮的函数
    def getseqbtn(self):
        inputname = self.input_data_Entry.get().strip().replace("\n","")
        self.desc_Text.delete(0.0,'end')
        self.seq_Text.delete(0.0,'end')   
        self.analyze_clear()
        self.figure_default()
        f_hd = self.getseqcore(inputname)
        if not f_hd:
            return 0
        seq = SeqIO.read(f_hd,'fasta')
        desc = '\n'.join(str(seq).split('\n')[:-1])
        self.desc_Text.insert(0.0,desc)
        self.seq_Text.insert(0.0,seq.seq)
    
    #定义清除analyze结果函数
    def analyze_clear(self):
        self.pera_data_Entry.delete(0,'end')
        self.pert_data_Entry.delete(0,'end')
        self.perc_data_Entry.delete(0,'end')
        self.perg_data_Entry.delete(0,'end')
        self.pergc_data_Entry.delete(0,'end')
        self.perat_data_Entry.delete(0,'end')
        self.length_data_Entry.delete(0,'end')
    
    #定义分析函数，包括序列组成分析和显示Pie figure
    def analyze(self):
        seq = self.seq_Text.get(1.0,'end').strip().replace('\n','')
        self.analyze_clear()
        if seq == '':
            tk.messagebox.showerror(title = 'ERROR',message='Please input sequence\nOR get sequence by ID')
            return 0
        count={}
        frq={}
        for i in set(seq):
            count[i]=seq.count(i)
            frq[i]=count[i]/len(seq)*100
        self.pera_data_Entry.insert(0,str(frq['A'])[0:5])
        self.pert_data_Entry.insert(0,str(frq['T'])[0:5])
        self.perc_data_Entry.insert(0,str(frq['C'])[0:5])
        self.perg_data_Entry.insert(0,str(frq['G'])[0:5])
        self.pergc_data_Entry.insert(0,str(frq['G']+frq['C'])[0:5])
        self.perat_data_Entry.insert(0,str(frq['A']+frq['T'])[0:5])
        self.length_data_Entry.insert(0,str(len(seq)))
        self.drawfig(count)
        self.figure_refresh()
        
    #将输入的ID获取到的FASTA序列保存到文件，文件名为ID，
    def fastasave(self):
        inputname = self.input_data_Entry.get().strip().replace("\n","")
        f_hd = self.getseqcore(inputname)
        if not f_hd:
            return 0
        seq = SeqIO.read(f_hd,'fasta')
        try:
            SeqIO.write(seq, inputname+'.fasta', 'fasta')
        except:
            tk.messagebox.showerror(title = 'ERROR',message='Unable to save fasta file!') #写入失败报错
            return 0
        else:
            tk.messagebox.showinfo(title = 'Success',message=inputname+'.fasta  successfully saved to\n'+os.getcwd()) #成功保存回显保存路径信息
        
    #定义图像刷新函数，用于analyze分析绘图之后替换default图片
    def figure_refresh(self):
        self.img_open = Image.open('result.png')
        self.img_png = ImageTk.PhotoImage(self.img_open)
        self.label_img = tk.Label(image = self.img_png)
        self.label_img.grid(row=24,column=3,columnspan=2)
        os.remove('result.png')
        
    #定义默认图像函数，用于没有图片的时候显示EMPTY占位图片
    def figure_default(self):
        self.img_open = Image.open('default.png')
        self.img_png = ImageTk.PhotoImage(self.img_open)
        self.label_img = tk.Label(image = self.img_png)
        self.label_img.grid(row=24,column=3,columnspan=2)
        
    #用matplotlib函数绘制Pie Figure并存储供图像显示函数调用
    def drawfig(self, count):
        label = list(count.keys())
        data = list(count.values())
        plt.figure(figsize=(2.45,1.60))
        plt.pie(data, labels=label, autopct="%1.2f%%", shadow=False)
        plt.axis("equal")
        plt.savefig('result.png')
        
    #定义打开浏览器函数，用于用户点击NCBI图片打开NCBI官网查询更多信息
    def open_ncbi(self,event):
        webbrowser.open("https://www.ncbi.nlm.nih.gov/", new=0)

    def printhelp(self):
        with open('README.txt', 'r', encoding='utf-8') as f_rdm:
            rdm = f_rdm.read()
        tk.messagebox.showinfo(title='README', message=rdm)


#定义GUI初始化函数
def gui_start():
    init_window = tk.Tk()
    init_window.resizable(0,0)
    gui = GUI_1(init_window)
    gui.set_init_window()
    init_window.mainloop()

if __name__ == '__main__':
    gui_start()