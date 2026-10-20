typedef unsigned int u32;
struct State {
 u32 side:1; u32 spare:7; u32 id:15; u32 rest:9;
 char pad[0x14]; u32 phase:8; u32 high:24;
};
struct Phase { u32 phase:8; u32 rest:24; };
extern struct State data_ov002_022cd300;
extern struct Phase data_ov002_022cd318;
extern int data_ov002_022cd744[];
extern struct { char pad[0xd70]; int a,b,c; } data_ov002_022d016c;
extern char data_ov002_022cf16c[];
extern void func_ov002_021ae400(int a,int b);
extern int func_ov002_021c3b60(int player,int arg1);
extern void func_ov002_021d7c1c(void *a,void *b,void *c);
extern int func_ov002_021dec2c(int p,int slot,int q,unsigned short v);
/* These callers leave the unused argument unspecified. */
extern void func_ov002_021e2b3c();
extern void func_ov002_021e2c5c();
extern void func_ov002_022592ec(int arg0);
extern int func_ov002_022593f4(void);
extern int func_ov002_02270ca8(int player,int a,int b);
extern void func_ov002_02290500(int a,int b,int (*cb)(int,int,int));
int func_ov002_0227309c(void) {
 switch(data_ov002_022cd300.phase) {
 case 0:
  if(data_ov002_022cd744[data_ov002_022cd300.side] == 1)
   func_ov002_02290500(data_ov002_022cd300.side,data_ov002_022cd300.id,func_ov002_02270ca8);
  else {
   func_ov002_021ae400(data_ov002_022cd300.side,0x3a);
   func_ov002_022592ec((int)func_ov002_02270ca8);
  }
  data_ov002_022cd318.phase++;
  return 0;
 case 1: {
  int c,b,a,index;
  if(func_ov002_022593f4() == 0) return -1;
  a=data_ov002_022d016c.a;
  b=data_ov002_022d016c.b;
  c=data_ov002_022d016c.c;
  index=func_ov002_021c3b60(data_ov002_022cd300.side,0x15a3);
  func_ov002_021e2b3c();
  func_ov002_021dec2c(a,b+c,0,0);
  func_ov002_021d7c1c(data_ov002_022cd300.side,data_ov002_022cf16c+(data_ov002_022cd300.side & 1)*0x868+0x120+index*4,0);
  func_ov002_021e2c5c();
  data_ov002_022cd318.phase++;
  return 0;
 }
 case 2: return 1;
 }
 return 0;
}


