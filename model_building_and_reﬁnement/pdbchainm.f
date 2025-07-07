       program prepare PDB chain
C      Buyong Ma, SJTU
C      2005

        IMPLICIT REAL*8 (a-h,o-z)
        character gene*80
        character atom*20,chain*2,coor*28,ending*24
        character resAA(42)   
        character typeCa*6,typeAA*3,typeCh
        real*8 HA(42),H(42),NC(42),CA(42),CB(42),CC(42)
        real*8 eHA(42),eH(42),eNC(42),eCA(42),eCB(42),eCC(42)
        real*8 dHA(42),dH(42),dNC(42),dCA(42),dCB(42),dCC(42)
        real*8 Ntot,CAtot,CBtot,Ctot,tot

        integer resn
C       real*8  X(9000),Y(9000),Z(9000)

 
10      Format(A20,A2,I4,A28,A24)
C20      Format(A10,A20)
20      Format(A3)
25      Format(A80)
30      Format(4I8)
35      Format(A20)

	open (unit=10,file='pdbinput.pdb',status='UNKNOWN')
	open (unit=20,file='pdbout.pdb',status='UNKNOWN')


CATOM   7508  CD  ILE P 503      35.283  12.873 -14.990  0.00  0.00
C1234567890223456789022345678903234567890423456789052345678906234567890


    	read(10,25) gene
    	read(10,25) gene
    	write(20,25) gene

C  monomer abeta42 chain
        do 90 i=0,0
        do 80 j=1,627

    	read(10,10) atom,chain,resn,coor,ending
           resn=resn+i*42
     

     	write(20,10) atom,' P',resn,coor,ending

80      continue
90      continue
    	write(20,20) 'END'








1000    stop
        end

