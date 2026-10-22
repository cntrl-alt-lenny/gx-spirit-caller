extern char data_ov004_0220b500[];
extern char data_02104bac[];
extern unsigned int func_02006194(void);
extern unsigned int func_0200617c(void);
extern void func_0200612c(int *, int *);
extern void func_02006110(int *, int *);
extern int func_02037208(int,int,int,int);
extern int func_ov004_021cc74c(int,void *);
extern void func_ov004_021cc014(void);
extern void func_ov004_021cc7bc(int);
extern int func_ov004_021cc2f0(void);
extern int func_ov004_021cc3c0(void);
extern void func_ov000_021abf28(void *,unsigned);
extern unsigned int func_ov000_021abf40(void *);
extern void func_ov000_021abf50(int *,int);
extern void func_ov000_021ac144(void *);
#define F(o) (*(int *)(b+(o)))
typedef struct { char pad[0x158]; int type; } Record;
#define R(n) (((Record *)(b+(n)*32))->type)
typedef struct { unsigned low:16; unsigned high:16; } Pair;
void func_ov004_021cca30(void) {
 char *b=data_ov004_0220b500;
 int i,j;
 int xx,yy,x,y;
 F(0x9c)=0; F(0xa0)=0; F(0xa8)=-1;
 if(F(0x8c)>=0x100) return;
 i=F(0x98);
 F(0x94)=0;
 j=0; if(F(0xa4)>=0) j=F(0xa4); F(0xa4)=j;
 for(;i<32;i++) {
  if(func_ov004_021cc74c(i,0)) {
   int n=F(0x98)>i+1?F(0x98):i+1;
   F(0x98)=n;
   ((Pair *)(b+0x200))->high=n*6;
  }
 }
 for(i=0;i<5;i++) {
  j=(F(0xa4)-8)/48+i;
  func_ov004_021cc74c(j,b+0xb8+(j%5)*32);
 }
 func_ov000_021abf28(b+0x1f8,F(0x98)>=4?1:0);
 if(F(0x8c)!=0) return;
 func_ov000_021ac144(b+0x1f8);
 F(0xa4)=func_ov000_021abf40(b+0x1f8)*8;
 if(func_02006194()!=0 || func_0200617c()!=0) {
  func_0200612c(&x,&y);
  func_02006110(&xx,&yy);
  if(x>=0 && x<236 && yy>=32 && y>=32) {
   int p=F(0xa4)+yy-32;
   int row=p/48;
   int rem=p%48;
   if(rem>=46) F(0x60)=1;
   F(0x90)=row;
   j=row%4;
   if(R(j)==1 || R(j)==6 || (unsigned)R(j)>=4000) {
    F(0xa8)=j;
    if(func_0200617c()!=0) func_ov004_021cc7bc(row);
   }
  }
 } else if(*(unsigned short *)(data_02104bac+0x54)&1) {
  i=F(0x90);
  if(i<0) {
   F(0x9c)=1;
   func_ov004_021cc014();
  } else if(i*48>=F(0xa4) && (i+1)*48<=F(0xa4)+160 && func_ov004_021cc74c(i,0)) {
   i=F(0x90);
   j=i%4;
   F(0xa8)=j;
   if(R(j)==1 || R(j)==6 || (unsigned)R(j)>=4000)
    func_ov004_021cc7bc(i);
  }
 } else {
  int count=0,last=0;
  for(i=0;i<F(0x98);i++) {
   if(func_ov004_021cc74c(i,0)) { last=i; count++; }
  }
  if(count==0) F(0x90)=-1;
  if(*(unsigned short *)(data_02104bac+0x56)&0x40) {
   i=F(0x90);
   if(i==0) F(0x90)=-1;
   else {
    F(0x90)=-1;
    for(j=i-1;j>=0;j--) {
     if(func_ov004_021cc74c(j,0)) {
      int pos=j*48;
      F(0x90)=j;
      if(pos<F(0xa4)) F(0xa4)=pos;
      else if((j+1)*48>F(0xa4)+160) F(0xa4)=pos-112;
      func_ov000_021abf50((int *)(b+0x1f8),F(0xa4)/8);
      func_02037208(56,-1,0,1);
      break;
     }
    }
   }
  } else if(*(unsigned short *)(data_02104bac+0x56)&0x80) {
   for(i=F(0x90)+1;i<F(0x98);i++) {
    if(func_ov004_021cc74c(i,0)) {
     int pos=i*48;
     F(0x90)=i;
     if(pos<F(0xa4)) F(0xa4)=pos;
     else if((i+1)*48>F(0xa4)+160) F(0xa4)=pos-112;
     func_ov000_021abf50((int *)(b+0x1f8),F(0xa4)/8);
     func_02037208(56,-1,0,1);
     break;
    }
   }
  } else if(count==1 && F(0x90)>=0) F(0x90)=last;
 }
 F(0x9c)|=func_ov004_021cc2f0();
 F(0xa0)=func_ov004_021cc3c0();
}



