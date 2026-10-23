typedef unsigned int u32;
extern char data_ov002_022cd73c[], data_ov002_022d016c[];
extern char data_ov002_022cf16c[], data_ov002_022cf178[], data_ov002_022cf17c[], data_ov002_022cf1a8[], data_ov002_022cf1ac[], data_ov002_022cf270[];
extern int func_ov002_021b9ecc(int,int);
extern int func_ov002_021bd710(int,int);
extern int func_ov002_021bae7c(int,int,int);
extern void func_ov002_021c4c9c(int,int,int*);
extern int func_ov002_021c1ad0(int,int);
extern int func_ov002_021c1d4c(int,int);
/* This caller reads r0: the existing void definition loses the result. */
extern int func_ov002_021b314c(int,int,int);
extern int func_ov002_021b30ac(int,int,int);
extern int func_ov002_021bbb1c(int,int,int);
extern int func_ov002_021bb9b4(int,int);
extern int func_ov002_021bb264(int,int,int);
extern int func_ov002_021bb068(int);
extern int func_ov002_021b4120(int,int,int);
extern int func_ov002_021b3ecc(int,int,int);
extern int func_ov002_021b3fd8(int,int,int,int);
extern int func_ov002_021b4054(int,int,int,int);
extern int func_ov002_021bbeac(int);
extern int func_ov002_021c0258(int);
extern int func_ov002_021bff50(int,int);
extern int func_ov002_021bba5c(int,int,int);
extern int func_ov002_021b4098(int,int,int);
extern int func_ov002_021bbbc0(int,int,int);
extern int func_ov002_021bcd80(int,int);
struct Slot { unsigned id:13; unsigned bit13:1; unsigned rest:8; unsigned kind:8; unsigned tail:2; };
#define FLAGS (*(u32 *)(flags + idx))
#define BLOCKED (((FLAGS >> 16)&1) || ((FLAGS >> 17)&1) || ((FLAGS >> 18)&1))
#define FAIL { goto cannot_use; }
int func_ov002_021be4a0(int a,int b,int mode) {
 int id,off,idx,face,kind,level,attack,m1,m2,other,b1,b2,c2;
 char *flags;
 int card[11];
 id=func_ov002_021b9ecc(a,b);
 idx=b*20; off=(a&1)*0x868;
 flags=data_ov002_022cf1ac+off;
 face=!((FLAGS>>6)&1);
 if ((FLAGS>>24)&1) FAIL;
 if (func_ov002_021bd710(a,b)) {
  if (a==*(int *)(data_ov002_022cd73c+4)) *(int *)(data_ov002_022d016c+0xd80)=0x10;
  return 0;
 }
 if (func_ov002_021bae7c(a,0x1a79,-1)) {
  if(id!=0x1a79 || *(int *)(data_ov002_022cf1a8+off+idx)==0) {
   int i; char *p=data_ov002_022cf16c+off;
   for(i=0;i<=4;i++,p+=20) {
    if(i!=b && func_ov002_021b9ecc(a,i)==0x1a79 && *(int *)(p+0x3c)!=0) FAIL;
   }
  }
 }
 func_ov002_021c4c9c(a,b,card);
 kind=card[1]; level=card[4]; attack=card[5];
 m1=func_ov002_021c1ad0(a,b); m2=func_ov002_021c1d4c(a,b);
 if(func_ov002_021b314c(a,b,0x149d)) FAIL;
 if(func_ov002_021b314c(a,b,0x13f3)) FAIL;
 if(func_ov002_021b314c(a,b,0x1842)) FAIL;
 if(func_ov002_021b314c(a,b,0x1103)) FAIL;
 if(func_ov002_021b314c(a,b,0x1243)) FAIL;
 if(func_ov002_021b314c(a,b,0x14b2)) FAIL;
 c2=m2&2;
 if(c2<=0 && func_ov002_021bbb1c(1-a,0x1766,attack)) FAIL;
 b1=m1&1;
 if(b1<=0 && func_ov002_021bb9b4(a,0x1400)) FAIL;
 b2=m1&2;
 if(b2<=0 && func_ov002_021bb9b4(1-a,0x1400)) FAIL;
 if(func_ov002_021bb264(0x14a1,a,m1) && BLOCKED) FAIL;
 if(level>=4 && func_ov002_021bb264(0x140e,a,m2)) FAIL;
 if(func_ov002_021bb068(0x1469)) {
  int v=func_ov002_021b4120(a,11,0x1469);
  if(v>=0 && v!=((struct Slot *)(data_ov002_022cf16c+off+0x30+idx))->kind*2+((struct Slot *)(data_ov002_022cf16c+off+0x30+idx))->bit13) FAIL;
 }
 if(func_ov002_021b30ac(a,b,0x1280)) FAIL;
 if(func_ov002_021b30ac(a,b,0x128a)) FAIL;
 if(func_ov002_021b30ac(a,b,0x1743)) FAIL;
 if(func_ov002_021bb068(0x1284)-(id==0x1284)>0) FAIL;
 other=1-a;
 if(func_ov002_021bae7c(other,0x1865,-1) && BLOCKED) FAIL;
 if(func_ov002_021b3ecc(a,b,0x1944)) FAIL;
 if(func_ov002_021b3ecc(a,b,0x1208)) FAIL;
 if(func_ov002_021b3ecc(a,b,0x15ed)) FAIL;
 if(func_ov002_021b3ecc(a,b,0x156a)) FAIL;
 if(func_ov002_021b3ecc(a,b,0x1900)) FAIL;
 if(func_ov002_021b3ecc(a,b,0x14f7)) FAIL;
 if(func_ov002_021b3ecc(a,b,0x1a7b)) FAIL;
 if(func_ov002_021b3ecc(a,b,0x1af4)) FAIL;
 if(func_ov002_021b3ecc(a,b,0x1af5)) FAIL;
 if(func_ov002_021b3fd8(a,b,0x1819,0)) FAIL;
 if(func_ov002_021b3fd8(a,b,0x1890,1)) FAIL;
 if(func_ov002_021b3ecc(a,11,0x15ff) && !func_ov002_021b3ecc(a,b,0x15ff)) FAIL;
 if(func_ov002_021b3ecc(a,11,0x195b)) {
  struct Slot *slot=(struct Slot *)(data_ov002_022cf16c+off+0x30);
  if(((struct Slot *)((char *)slot+idx))->kind*2+((struct Slot *)((char *)slot+idx))->bit13!=func_ov002_021b4120(a,11,0x195b)) FAIL;
 }
 if(func_ov002_021b4054(a,11,0x1a02,2)) FAIL;
 if(b1<=0 && func_ov002_021b3ecc(a,11,0x1a0d)) FAIL;
 switch(id) {
 case 0xfa6: case 0xfa7:
  if(!func_ov002_021b3ecc(a,b,0x175b) && func_ov002_021b3ecc(a,11,0x175b)) FAIL;
  if(func_ov002_021b3ecc(a,11,0x15e0) == 0) break;
  FAIL;
 case 0xff8:
  if(func_ov002_021b3ecc(a,11,0x17f6) == 0) break;
  FAIL;
 case 0x127d: case 0x127e: case 0x127f: case 0x12a5: case 0x1563: case 0x1564: case 0x1565: case 0x1566:
  if(face && BLOCKED) FAIL;
  break;
 case 0x1622:
  if(face) {
   if(func_ov002_021bbeac(a)>1) FAIL;
   if(*(int *)(data_ov002_022cf178+off) == 0) break;
   FAIL;
  }
  break;
 case 0x1636: case 0x1639:
  if(id==((struct Slot *)(data_ov002_022cf16c+off+0x30+idx))->id) FAIL;
  break;
 case 0x16c9: case 0x16cb: case 0x19c8:
  if(func_ov002_021b3ecc(a,b,0xfb6) == 0) break;
  FAIL;
 case 0x161b:
  if(face && BLOCKED) FAIL;
  break;
 case 0x17c7: case 0x17c8:
  if(face && (((FLAGS>>16)&1) || ((FLAGS>>18)&1))) FAIL;
  break;
 }
 if(!func_ov002_021c0258(other) && !func_ov002_021bff50(a,b)) FAIL;
 if(mode) {
  if(b2<=0 && func_ov002_021bb9b4(other,0x1102)) FAIL;
  if(kind!=7 && func_ov002_021b314c(a,b,0x130e)) FAIL;
  if(attack>=0x5dc && func_ov002_021bb264(0x134a,a,m1)) FAIL;
  if(kind==10 && b2<=0 && func_ov002_021bae7c(other,0x12e0,-1)) FAIL;
  if(func_ov002_021b3ecc(a,b,0x12d1)) FAIL;
  if(func_ov002_021bb264(0x14d1,a,m1) && BLOCKED) {
   if(kind==*(int *)(data_ov002_022cf270+off)) FAIL;
   if(kind==*(int *)(data_ov002_022cf270+(other&1)*0x868)) FAIL;
  }
  if((m2&1)<=0 && func_ov002_021bba5c(a,0x1358,kind)) FAIL;
  if(c2<=0 && func_ov002_021bba5c(other,0x1358,kind)) FAIL;
  if(c2<=0 && func_ov002_021bae7c(other,0x1a19,-1)) {
   int i;
   for(i=1;i<=6;i++) {
    if((card[3]&(1<<i)) && func_ov002_021bba5c(other,0x1a19,i)) FAIL;
   }
  }
  if(attack>=0x76c && func_ov002_021bb068(0x1523)) FAIL;
  if(func_ov002_021b3ecc(a,b,0x182c)) FAIL;
  if(func_ov002_021b3ecc(a,11,0x1886)) FAIL;
  if(func_ov002_021b4098(a,11,0x172d)) FAIL;
  switch(id) {
  case 0x1441: if(face == 0) break; FAIL;
  case 0x14db: if(!face) break; if(func_ov002_021bbbc0(a,1,b) != 0) break; FAIL;
  case 0x1813: case 0x1815: case 0x195a: FAIL;
  case 0x1aa0: if(func_ov002_021b3ecc(a,b,0xfb6) != 0) FAIL; break;
  }
 }
 if(mode) {
  int cost=0;
  if(face) {
   switch(id) {
   case 0x11cd: case 0x18a4: cost=1000; break;
   case 0x127d: case 0x127e: case 0x127f: case 0x12a5: cost=500; break;
   case 0x128f: case 0x12a0:
    if(!func_ov002_021bcd80(a,(unsigned short)((unsigned char)a|((unsigned char)b<<8)))) return 0;
    break;
   }
  }
  if(b2<=0) {
   int count=func_ov002_021bae7c(other,0x131d,-1);
   if(*(u32 *)(data_ov002_022cf17c+off)<count) FAIL;
  }
  {
   int v=func_ov002_021bb264(0x1320,a,m1);
   int threshold=v*500+cost;
   if(*(int *)(data_ov002_022cf16c+off)<=threshold) FAIL;
  }
 }
 return 1;
cannot_use:
 if (a == *(int *)(data_ov002_022cd73c+4)) *(int *)(data_ov002_022d016c+0xd80)=0x13;
 return 0;
}







