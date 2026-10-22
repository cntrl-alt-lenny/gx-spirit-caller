typedef unsigned int u32;
struct State {
 u32 side:1; u32 spare:7; u32 id:15; u32 rest:9;
 int pad4; unsigned char count; char pad9; unsigned short list[3];
 char pad10[8]; u32 phase:8; u32 high:24;
};
struct Phase { u32 phase:8; u32 rest:24; };
extern struct State data_ov002_022cd300;
extern struct Phase data_ov002_022cd318;
extern int data_ov002_022cd744[];
extern int data_ov002_022c8604[];
extern unsigned short data_ov002_022cd30a[];
extern struct { char pad[0xd60]; int result; char pad2[12]; int a,b; } data_ov002_022d016c;
extern int func_0202b100(int a0);
extern void func_ov002_021ae400(int a, int b);
extern int func_ov002_021b947c(int id);
extern void func_ov002_021d7a64(int a, int b, int c);
extern int func_ov002_021deb84(int arg0, int arg1);
extern void func_ov002_022592ec(int arg0);
extern int func_ov002_022593f4(void);
extern int func_ov002_02270fcc(int player, int a, int b);
extern void func_ov002_02290500(int a, int b, int (*cb)(int,int,int));
/* This caller leaves the dispatcher's fourth argument unspecified. */
extern int func_ov002_0229ade0();
extern void func_ov002_0229ce5c(char *out, int format, int text);
int func_ov002_0227352c(void) {
 char text[256];
 switch(data_ov002_022cd300.phase) {
 case 0:
  if(data_ov002_022cd744[data_ov002_022cd300.side] == 1)
   func_ov002_02290500(data_ov002_022cd300.side,data_ov002_022cd300.id,func_ov002_02270fcc);
  else {
   func_ov002_0229ce5c(text,0xd3,func_0202b100(data_ov002_022c8604[data_ov002_022cd300.count]));
   func_ov002_021ae400(data_ov002_022cd300.side,(int)text);
   func_ov002_022592ec((int)func_ov002_02270fcc);
  }
  data_ov002_022cd318.phase++;
  return 0;
 case 1:
  if(func_ov002_022593f4() != 0) {
   data_ov002_022cd30a[data_ov002_022cd300.count] = data_ov002_022d016c.result;
   func_ov002_0229ade0(0x28,data_ov002_022d016c.a,data_ov002_022d016c.b);
   if(++data_ov002_022cd300.count < 3) { data_ov002_022cd318.phase--; return 0; }
   data_ov002_022cd318.phase++;
   return 0;
  }
  data_ov002_022cd318.phase--;
  return 0;
 case 2: {
  int i;
  int mask = 0;
  for(i=0;i<data_ov002_022cd300.count;i++) {
   int pair = func_ov002_021b947c(data_ov002_022cd300.list[i]);
   unsigned char slot = (unsigned short)pair >> 8;
   if(slot <= 10) mask |= 1 << (slot + ((unsigned char)pair << 4));
   else func_ov002_021d7a64((unsigned char)pair,(unsigned short)((unsigned int)pair >> 16),0);
  }
  func_ov002_021deb84(data_ov002_022cd300.side,mask);
  data_ov002_022cd318.phase++;
  return 0;
 }
 case 3:
  data_ov002_022cd300.count=0;
  return 1;
 }
 return 0;
}

