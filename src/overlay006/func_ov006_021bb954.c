typedef struct {
 int f0, f4, f8, fc, f10, f14, f18, f1c;
 unsigned flag:1;
 unsigned :31;
} Slot;
typedef struct {
 int field_00;
 char pad04[0x3c];
 int field_40, field_44, field_48, field_4c, field_50, field_54, field_58, field_5c;
 char pad60[0x14]; int field_74;
} obj_021bbdc0_t;
extern int func_02037208(int a0, int r1, int r2, int r3);
extern unsigned short func_ov006_021b6d1c(char *p,int sel,int idx,int flag);
extern int func_ov006_021bbdc0(obj_021bbdc0_t *p);
extern int func_ov006_021be4d0(int *obj);
extern int func_ov006_021be558(char *out);
extern int func_ov006_021be598(void *obj);
extern int func_ov006_021bdcdc(char *self);
extern int func_ov006_021bf454(int *obj);
extern int func_ov006_021c1664(void *obj,int value);
extern int func_ov006_021c1678(void *p);
extern int func_ov006_021c6bc0(void *obj,int value);
extern int func_ov006_021c6bd4(void *p);
extern int func_ov006_021c6be8(void *x);
extern int func_ov006_021bd8ac(void *self);
extern void func_ov006_021bc45c(void *self,int a,int b,int c,int d);
extern void func_ov006_021c0c14(void *self);
extern void func_ov006_021be5b8(void *self);
extern void func_ov006_021be6f4(void *self);
extern void func_ov006_021bc0cc(void *self);
extern void func_ov006_021bf844(void *self);
extern char data_ov006_0224f448[],data_ov006_0225de70[],data_ov006_0225cb5c[];
extern int data_021040ac[];
#define F(off) (*(int *)(self + (off)))
int func_ov006_021bb954(char *self) {
 char *base = data_ov006_0224f448;
 Slot *slot = (Slot *)(self + 0xa0) + F(0x50);
 int refresh = 0;
 int result = 0;
 switch(F(0x54)) {
 case 0:
  switch(F(0x40)) {
  case 0: case 3:
   if(F(0x50)==4) {
    func_02037208(0x91,-1,0,1);
    F(0x50)=F(0x5c);
    refresh=1;
    func_ov006_021bbdc0((obj_021bbdc0_t *)self);
    func_ov006_021c0c14(self);
    func_ov006_021bc45c(self,0,1,0,0);
   } else {
    if(func_ov006_021be4d0((int *)self)) func_02037208(0x46,-1,0,1);
    else func_02037208(0x43,-1,0,1);
   }
   break;
  case 1:
   if(func_ov006_021be558(self)) func_02037208(0x46,-1,0,1);
   else func_02037208(0x43,-1,0,1);
   break;
  case 2:
   func_ov006_021be598(self);
   func_02037208(0x46,-1,0,1);
   break;
  default:
   func_02037208(0x42,-1,0,1);
   F(0x44)=0;
   result=1;
   break;
  }
  break;
 case 1:
  func_02037208(0x3a,-1,0,1);
  result=1; F(0x44)=1;
  break;
 case 2:
  func_02037208(0x46,-1,0,1);
  func_ov006_021bdcdc(self);
  refresh=1;
  break;
 case 5:
  func_02037208(0x35,-1,0,1);
  func_ov006_021c6be8(data_ov006_0225de70);
  break;
 case 30:
  func_02037208(0x46,-1,0,1);
  func_ov006_021c6bc0(data_ov006_0225de70, !func_ov006_021c6bd4(data_ov006_0225de70));
  break;
 case 31:
  func_02037208(0x46,-1,0,1);
  func_ov006_021c1664(data_ov006_0225cb5c, !func_ov006_021c1678(data_ov006_0225cb5c));
  break;
 default:
  if(F(0x54)==3 || F(0x54)==4 || (F(0x54)>=7 && F(0x54)<=13)) {
   if(func_ov006_021bd8ac(self)) func_02037208(0x46,-1,0,1);
  } else if(F(0x54)==6) {
   if(F(0x78)) {
    func_02037208(0x3a,-1,0,1);
    F(0x88)=5; F(0x8c)=-1; F(0x90)=-1;
   } else func_02037208(0x43,-1,0,1);
  } else if(F(0x54)>=22 && F(0x54)<=25) {
   int v;
   func_02037208(0x46,-1,0,1);
   v=func_ov006_021b6d1c(base,F(0x50),slot->f8+(F(0x54)-22),slot->flag);
   F(0x88)=2; F(0x8c)=v;
  } else if(F(0x54)>=26 && F(0x54)<=29) {
   int v;
   func_02037208(0x46,-1,0,1);
   v=func_ov006_021b6d1c(base,F(0x50),slot->f8+(F(0x54)-26),slot->flag);
   F(0x88)=3; F(0x8c)=v;
  } else if(F(0x54)>=14 && F(0x54)<=17) {
   int old=F(0x50);
   F(0x50)=F(0x54)-14;
   if(F(0x50)!=old) {
    func_02037208(0x56,-1,0,1);
    refresh=1;
    func_ov006_021bbdc0((obj_021bbdc0_t *)self);
    func_ov006_021c0c14(self);
    if(F(0x40)==5) func_ov006_021bf454((int *)self);
    func_ov006_021bc45c(self,0,1,0,0);
   }
  }
  break;
 }
 if(refresh) {
  func_ov006_021be5b8(self);
  func_ov006_021be6f4(self);
  func_ov006_021bc0cc(self);
  func_ov006_021bf844(self);
  data_021040ac[7]=1;
 }
 return result;
}

