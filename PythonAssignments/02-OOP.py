# -*- coding: utf-8 -*-
"""
Created on Mon Dec  7 14:10:12 2020
@author: 生信1801_任梓睿_2018317220104
"""
#定义分子类
class Molecule:
    def __init__(self):
        self.element = set()    #初始化element为空集
        self.weight = None      #初始化weight为None
    def show_element(self):     
        print(self.element)
    def show_weight(self):
        print(self.weight)

#定义氨基酸类
class AminoAcid(Molecule):
    def __init__(self):
        Molecule.__init__(self)     #继承Molecule类
        self.composition = {'C':0,'H':0,'O':0,'N':0,'S':0}
    def calc_mw(self):
        elemass= {'C':12,'H':1,'O':16,'N':14,'S':32}
        totalmass=0
        for key in self.composition.keys():
            totalmass += self.composition[key]*elemass[key]
        self.weight = totalmass
    def show_weight(self):      #重载show_weight方法
        self.calc_mw()
        Molecule.show_weight(self)
    def show_element(self): #重载show_element方法
        for key in self.composition.keys():
            if self.composition[key]!=0:
                self.element.add(key)
        Molecule.show_element(self)
    
class Leucine(AminoAcid): #定义亮氨酸类
    def __init__(self):
        AminoAcid.__init__(self)    #继承AminoAcid类
        self.composition = {'C':6,'H':13,'O':2,'N':1,'S':0}
    def show_composition(self):
        print(self.composition)
    def is_isoform(self,other):     #判断同分异构
        iso=True
        for key in self.composition.keys():
            if self.composition[key]==other.composition[key]:
                iso=True
            else:
                iso=False
                break
        return iso
             
class IsoLeucine(AminoAcid): #定义异亮氨酸类
    def __init__(self):
        AminoAcid.__init__(self)
        self.composition = {'C':6,'H':13,'O':2,'N':1,'S':0}
    def show_composition(self):
        print(self.composition)

class Cysteine(AminoAcid):  #定义半胱氨酸类
    def __init__(self):
        AminoAcid.__init__(self)
        self.composition = {'C':3,'H':7,'O':2,'N':1,'S':1}
    def show_composition(self):
        print(self.composition)
        
leu,iso,cys=Leucine(),IsoLeucine(),Cysteine()
for aa in [leu,iso,cys]:    #通过for循环调用三个氨基酸实例的方法
    aa.show_weight()
    aa.show_element()
    aa.show_composition()
print(leu.is_isoform(iso))  #判断同分异构体并输出布尔值
print(leu.is_isoform(cys))