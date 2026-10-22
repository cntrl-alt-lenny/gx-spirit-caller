typedef unsigned int u32;
struct State {
 u32 player:1; u32 pad0:7; u32 card:15; u32 pad1:9;
 u32 pad4; unsigned char count; char pad9[7]; unsigned short limit; char pad12[6];
 u32 phase:8; u32 amount:8; u32 flag:8; u32 pad18:8;
};
struct Phase { u32 phase:8; u32 count:8; u32 rest:16; };
struct Global { char pad[0xd44]; unsigned int limit; char pad2[0x28]; int a,b,c; };
extern struct State data_ov002_022cd300;
extern struct Phase data_ov002_022cd318;
extern struct Global data_ov002_022d016c;
extern int data_ov002_022cd744[];
extern char *func_0202b7ec(int idx);
extern char *func_0202b830(int idx);
extern unsigned int func_0202b878(int id);
extern unsigned int func_0202b890(int id);
extern void func_ov002_021ae400(int a,int b);
extern void func_ov002_021af9d0(int player,int phase,int card,int arg);
extern u32 *func_ov002_021b004c(int id);
extern int func_ov002_021b3ecc(int arg0,int arg1,int arg2);
extern void func_ov002_021d8128(int arg0,void *arg1,int arg2);
extern int func_ov002_021de5d4(int a,int b,int c);
/* The original leaves the unused parameter unspecified. */
extern void func_ov002_021e2b3c();
extern void func_ov002_021e2c5c();
extern void func_ov002_02259324(int arg0);
extern int func_ov002_022593f4(void);
extern int func_ov002_0226e46c(int value);
extern int func_ov002_02271278(int player,int a,int b);
extern void func_ov002_02290500(int player,int card,int (*cb)(int,int,int));
extern void func_ov002_0229ce5c(char *dst,int fmt,const char *str);
extern void func_ov002_0229cf10(char *dst,const char *fmt,int val);
int func_ov002_02273d74(void) {
 char out[256];
 char tmp[256];
 char *text;
 int amount;
 switch(data_ov002_022cd300.phase) {
 case 0:
  func_ov002_021e2b3c();
 case 4:
  amount=func_ov002_0226e46c(data_ov002_022cd300.card);
  switch(data_ov002_022cd300.card) {
  case 0x1466: case 0x18b4: case 0x19ca:
   text=func_0202b7ec(func_0202b878(data_ov002_022cd300.card)); break;
  case 0x16c9: case 0x16cb: case 0x16e4:
   text=func_0202b830(data_ov002_022cd300.flag ? 2:1); break;
  default:
   text=func_0202b830(func_0202b890(data_ov002_022cd300.card)); break;
  }
  data_ov002_022cd300.amount=amount;
  if(func_ov002_021b3ecc(data_ov002_022cd300.player,11,0x14a0)) {
   if(amount>=2) {
    func_ov002_0229ce5c(tmp,0xd6,text);
    func_ov002_0229cf10(out,tmp,amount);
   } else func_ov002_0229ce5c(out,0xd8,text);
   data_ov002_022cd300.phase=5;
  } else {
   if(amount>=2) {
    func_ov002_0229ce5c(tmp,0xd7,text);
    func_ov002_0229cf10(out,tmp,amount);
   } else func_ov002_0229ce5c(out,0xd9,text);
   data_ov002_022cd300.phase=1;
  }
  if(data_ov002_022cd744[data_ov002_022cd300.player]==0)
   func_ov002_021ae400(data_ov002_022cd300.player,(int)out);
  return 0;
 case 1:
  switch(data_ov002_022cd300.card) {
  case 0x18b4:
   func_ov002_021af9d0(data_ov002_022cd300.player,0x47,data_ov002_022cd300.card,data_ov002_022cd300.flag);
   break;
  default:
   func_ov002_021af9d0(data_ov002_022cd300.player,(data_ov002_022cd300.amount<0x20 ? data_ov002_022cd300.amount:0x20)+6,data_ov002_022cd300.card,data_ov002_022cd300.flag);
  }
  data_ov002_022cd318.phase++;
  data_ov002_022cd300.amount=0;
  return 0;
 case 2:
  data_ov002_022cd318.count++;
  if(data_ov002_022d016c.limit>=data_ov002_022cd300.amount) {
   func_ov002_021d8128(data_ov002_022cd300.player,func_ov002_021b004c(data_ov002_022cd300.amount),0);
   return 0;
  }
  else data_ov002_022cd318.phase++;
  return 0;
 case 3:
  switch(data_ov002_022cd300.card) {
  case 0x16c9: case 0x16cb: case 0x16e4:
   if(data_ov002_022cd300.flag++==0) {
    data_ov002_022cd300.phase=4; return 0;
   }
   break;
  case 0x18b4: data_ov002_022cd300.limit=data_ov002_022d016c.limit; break;
  }
  func_ov002_021e2c5c();
  data_ov002_022cd300.count=0;
  return 1;
 case 5:
  if(data_ov002_022cd744[data_ov002_022cd300.player]==1)
   func_ov002_02290500(data_ov002_022cd300.player,data_ov002_022cd300.card,func_ov002_02271278);
  else func_ov002_02259324((int)func_ov002_02271278);
  data_ov002_022cd318.phase++;
  return 0;
 case 6:
  if(func_ov002_022593f4()) {
   func_ov002_021de5d4(data_ov002_022d016c.a,data_ov002_022d016c.b+data_ov002_022d016c.c,0);
   data_ov002_022cd318.count--;
   if(data_ov002_022cd300.amount==0) {
    data_ov002_022cd300.phase=3; return 0;
   }
  }
  data_ov002_022cd318.phase--;
  return 0;
 }
 return 0;
}


