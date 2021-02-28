#!/usr/bin/env python
# _*_coding:utf-8_*_
import sys
from sys import argv

sys.path.extend(["../../", "../", "./"])
import sys, os
import pandas as pd
import numpy as np
from CKSNAP import *
from DNC import *
from NAC import *
from TNC import *
from RCKmer import *
from kmer import *
from Kmer1234 import *



def read_fasta(file):
    f = open(file)
    docs = f.readlines()
    fasta = []
    for seq in docs:
        if seq.startswith(">"):
            continue
        else:
            fasta.append(seq)

    return np.array(fasta)


def extract_feature(fasta, filePath, uid):

    t1 = CKSNAP(fasta)
    df1 = pd.DataFrame(t1)
    df1.to_csv(filePath+uid+"_CKSNAP.csv", header=False, index=False)

    t2 = Kmer1234(fasta)
    df2 = pd.DataFrame(t2)
    df2.to_csv(filePath+uid+"_Kmer1234.csv", header=False, index=False)

    t3 = Kmer(fasta, 4)
    df3 = pd.DataFrame(t3)
    df3.to_csv(filePath+uid+"_Kmer4.csv", header=False, index=False)


    t4 = NAC(fasta)
    df4 = pd.DataFrame(t4)
    df4.to_csv(filePath+uid+"_NAC.csv", header=False, index=False)

    t5 = RCKmer(fasta)
    df5 = pd.DataFrame(t5)
    df5.to_csv(filePath+uid+"_RCKmer.csv", header=False, index=False)

    t6 = DNC(fasta)
    df6 = pd.DataFrame(t6)
    df6.to_csv(filePath+uid+"_DNC.csv", header=False, index=False)

    t7 = TNC(fasta)
    df7 = pd.DataFrame(t7)
    df7.to_csv(filePath+uid+"_TNC.csv", header=False, index=False)

def generate(uid, folder):
    filePath = folder+uid+"/"
    fasta = read_fasta(filePath+uid+".fasta")
    extract_feature(fasta, filePath, uid)

uid = argv[1]
folder = argv[2]
generate(uid, folder)



