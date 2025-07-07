       program Fit ssNMR experiment
C      Buyong Ma,SJTU
C      2005

        IMPLICIT REAL*8 (a-h,o-z)
        character gene*80
        character star*9 
        character resAn(42)   
        character resAA(42)   
        character typeCa*6,typeAA*3,typeCh
        real*8 HA(42),H(42),NC(42),CA(42),CB(42),CC(42)
        real*8 eHA(42),eH(42),eNC(42),eCA(42),eCB(42),eCC(42)
        real*8 dHA(42),dH(42),dNC(42),dCA(42),dCB(42),dCC(42)
        real*8 Ntot,CAtot,CBtot,Ctot,tot

        integer resn(42)
C       real*8  X(9000),Y(9000),Z(9000)

 

10      Format(A4,A5,f8.4,f7.4,f9.4,f8.4,f8.4,f9.4)
C20      Format(A10,A20)
20      Format(A20)
25      Format(4A8)
30      Format(4I8)
35      Format(A20)
40      Format(f10.8)



        open (unit=10,file='out',status='UNKNOWN')
        open (unit=20,file='dif.out',status='UNKNOWN')
        open (unit=30,file='exp.in',status='UNKNOWN')
        open (unit=40,file='rmsd',status='UNKNOWN')



    	read(10,*) gene
    	read(10,*) gene

        do 90 i=1,42
        
C    	read(10,10) resAA(i),HA(i),H(i),
    	read(10,*) resAn(i),resAA(i),CA(i),CB(i),
     *             CC(i),NC(i),H(i),HA(i)
    	read(30,*) eNC(i),eCA(i),eCB(i),eCC(i)
C       write(*,*) 'ecc',ecc(i)
     
        dHa(i) = 0
        dH(i) = 0
        dNC(i) = 0
        dCA(i) = 0
        dCB(i) = 0
        dCC(i) = 0

c       eHa(i) = 0
c       eH(i) = 0
c       eNC(i) = 0
c       eCA(i) = 0
c       eCB(i) = 0
c       eCC(i) = 0

C    	write(20,10) resAA(i),HA(i),H(i),NC(i),CA(i),CB(i),CC(i)
C     	write(20,10) resAA(i),eHA(i),eH(i),
C     *           eNC(i),eCA(i),eCB(i),eCC(i)

90      continue

        Ntot=0
        CAtot=0
        CBtot=0
        CCtot=0
        tot=0


        do 200 i=1,42
       
        dNC(i) = abs(NC(i)-eNC(i))
        dCA(i) = abs(CA(i)-eCA(i))
        dCB(i) = abs(CB(i)-eCB(i))
        dCC(i) = abs(CC(i)-eCC(i))
      
        if (eNC(i).eq.0) dNC(i) = 0.0
        if (eCA(i).eq.0) dCA(i) = 0.0
        if (eCB(i).eq.0) dCB(i) = 0.0
        if (eCC(i).eq.0) dCC(i) = 0.0

        Ntot=Ntot + dNC(i)**2
        CAtot=CAtot+ dCA(i)**2
        CBtot=CBtot+ dCB(i)**2
        CCtot=CCtot+ dCC(i)**2

        write(20,10) resAn(i),resAA(i),NC(i),CA(i),CB(i),CC(i)
C       write(*,*) resAn(i),resAA(i),HA(i),H(i),NC(i),CA(i),CB(i),CC(i)
        write(20,10) resAn(i),resAA(i),eHA(i),eH(i),
     *           eNC(i),eCA(i),eCB(i),eCC(i)

        write(20,10) resAn(i),resAA(i),dHA(i),dH(i),
     *          dNC(i),dCA(i),dCB(i),dCC(i)


200      continue

        do 300 i=1,42

        write(*,10) resAA(i),dHA(i),dH(i),
     *          dNC(i),dCA(i),dCB(i),dCC(i)
300      continue


         write(20,*)
         write(*,*)
         write(20,*) '  tot  ','  Ntot  ','  CAtot  ',
     *   '  CBtot  ','  CCtot  '
         write(*,*) '  tot  ','  Ntot  ','  CAtot  ',
     *   '  CBtot  ','  CCtot  '

         Ntot=sqrt(Ntot/41.0)
         CAtot=sqrt(CAtot/41.0)
         CBtot=sqrt(CBtot/35.0)
         CCtot=sqrt(CCtot/41.0)
         tot=(Ntot+CAtot+CBtot+CCtot)/4.0
         write(20,*) tot,Ntot,CAtot,CBtot,CCtot
         write(*,*) tot,Ntot,CAtot,CBtot,CCtot
         write(40,40) tot

1000    stop
        end

