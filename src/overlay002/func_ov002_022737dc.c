typedef unsigned int u32;
struct State {
 u32 side:1; u32 spare:7; u32 id:15; u32 rest:9;
 int pad4; unsigned char count; char pad9[7]; unsigned short first,second;
 int pad14; u32 phase:8; u32 high:24;
};
struct Phase { u32 phase:8; u32 rest:24; };
extern struct State data_ov002_022cd300;
extern struct Phase data_ov002_022cd318;
extern int data_ov002_022cd744[];
extern struct { char pad[0xd70]; int a,b,c; } data_ov002_022d016c;
struct Entry { u32 unused:13; u32 flag:1; u32 unused2:8; u32 value:8; u32 rest:2; char pad[16]; };
union Player { char bytes[0x868]; struct { char pad[0x30]; struct Entry entries[100]; } table; };
extern char data_ov002_022cf16c[];
extern int func_0202b100(int a0);
extern void func_ov002_021ae400(int a, int b);
extern void func_ov002_022592ec(int arg0);
extern int func_ov002_022593f4(void);
extern int func_ov002_022713a8(int player, int a, int b);
extern void func_ov002_02290500(int a, int b, int (*cb)(int,int,int));
extern int func_ov002_0229ade0(int a, int b, int c, int d);
extern void func_ov002_0229ce5c(char *out, int format, int text);
int func_ov002_022737dc(void) {
 char text2[256], text[256];
 int a,b,c;
 struct Entry *entries;
 struct Entry *entry;
 u32 v;
 switch(data_ov002_022cd300.phase) {
 case 0:
  if(data_ov002_022cd744[data_ov002_022cd300.side] == 1)
   func_ov002_02290500(data_ov002_022cd300.side,data_ov002_022cd300.id,func_ov002_022713a8);
  else {
   func_ov002_0229ce5c(text,0xda,func_0202b100(0x13e5));
   func_ov002_0229ce5c(text2,(int)text,func_0202b100(0x13e7));
   func_ov002_021ae400(data_ov002_022cd300.side,(int)text2);
   func_ov002_022592ec((int)func_ov002_022713a8);
  }
  data_ov002_022cd318.phase++;
  return 0;
 case 1:
  if(func_ov002_022593f4() == 0) return -1;
  a=data_ov002_022d016c.a;
  b=data_ov002_022d016c.b;
  c=data_ov002_022d016c.c;
  entries=(struct Entry *)(data_ov002_022cf16c+(a&1)*0x868);
  b=b+c;
  entry=&((struct Entry *)((char *)entries+0x30))[b];
  func_ov002_0229ade0(0x28,a,b,entry->value*2+entry->flag);
  data_ov002_022cd300.count=1;
  data_ov002_022cd300.first=(unsigned char)a|((unsigned char)b<<8);
  data_ov002_022cd318.phase++;
  return 0;
 case 2:
  if(data_ov002_022cd744[data_ov002_022cd300.side] == 1)
   func_ov002_02290500(data_ov002_022cd300.side,data_ov002_022cd300.id,func_ov002_022713a8);
  else {
   func_ov002_021ae400(data_ov002_022cd300.side,4);
   func_ov002_022592ec((int)func_ov002_022713a8);
  }
  data_ov002_022cd318.phase++;
  return 0;
 case 3:
  if(func_ov002_022593f4() != 0) {
   a=data_ov002_022d016c.a;
   b=data_ov002_022d016c.b;
  c=data_ov002_022d016c.c;
  entries=(struct Entry *)(data_ov002_022cf16c+(a&1)*0x868);
  b=b+c;
   entry=&((struct Entry *)((char *)entries+0x30))[b];
   func_ov002_0229ade0(0x28,a,b,entry->value*2+entry->flag);
   data_ov002_022cd300.count=2;
   data_ov002_022cd300.second=(unsigned char)a|((unsigned char)b<<8);
   return 1;
  }
  data_ov002_022cd300.phase=0;
  func_ov002_0229ade0(0x29,0,0,0);
  return 0;
 }
 return 0;
}





