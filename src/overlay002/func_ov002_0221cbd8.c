typedef unsigned short u16;
typedef unsigned char u8;
struct Self { u16 id; u16 side:1, rest:15; u16 pad:2, blocked:1, rest4:13; u16 gap[2]; u16 card, value, count; };
struct Row { unsigned id:13, flag:1, rest:8, value:8, tail:2; char pad[16]; };
typedef struct { unsigned int field0:13, pad13:1, bit14:1, pad15:17; } S021b9ba0;
struct node; struct Node;
struct State { char pad[0x5a8]; int state, count; };
struct Global { char pad[0xd44]; int flag; };
extern struct State data_ov002_022ce288;
extern struct Global data_ov002_022d016c;
extern char data_ov002_022cf16c[];
extern int data_ov002_022cdc88[];
extern int data_ov002_022cd744[];
extern u16 func_ov002_0223de94(struct node *, int);
extern int func_ov002_0223df38(struct Node *, int, int *);
extern int func_ov002_0225764c(int, int, int);
extern int func_ov002_021de9d4(int, int, int);
extern int func_ov002_021b9ba0(S021b9ba0 *);
extern int func_ov002_0223b468(int);
extern int func_ov002_0225368c(int, int, int);
extern int func_ov002_0223bcb4(int, int, int *);
extern int func_ov002_021bb068(int);
extern int func_ov002_021bae7c(int, int, int);
extern int func_ov002_021b99b4(int, int);
extern int func_ov002_021c33e4(int, int, int);
/* This caller supplies only r0 to the four-parameter forwarding thunk. */
extern int func_ov002_021ca2b8();
extern int func_ov002_021bc618(int);
extern int func_ov002_021ae484(int);
extern void func_ov002_021e2b3c(int);
extern int func_ov002_0227adb8(int, int, int, int);
/* The original caller supplies no arguments to this unused-argument function. */
extern void func_ov002_021e2c5c();
int func_ov002_0221cbd8(struct Self *self) {
 int lo, hi;
 int raw = func_ov002_0223de94((struct node *)self, 0);
 lo = (u8)raw;
 hi = (u8)((u16)raw >> 8);
 if (self->blocked) return 0;
 switch (data_ov002_022ce288.state) {
 case 0x80: {
  struct Row *row;
  int required;
  if (!func_ov002_0223df38((struct Node *)self,0,0)) return 0;
  if (!func_ov002_0225764c((int)self,lo,hi)) return 0;
  row = (struct Row *)(data_ov002_022cf16c + (lo & 1)*0x868 + 0x30);
  self->card = row[hi].id;
  self->value = row[hi].value * 2 + row[hi].flag;
  func_ov002_021de9d4((int)self,lo,hi);
  if (!func_ov002_021b9ba0((S021b9ba0 *)&row[hi])) return 0;
  required = func_ov002_0223b468(self->card);
  self->count = func_ov002_0225368c(self->side,self->id,self->value);
  if (self->count < required) return 0;
  if (!func_ov002_0223bcb4(self->card,self->count,data_ov002_022cdc88)) return 0;
  if (func_ov002_021bb068(0x159d)) {
   if (!func_ov002_021bae7c(self->side,0x158b,-1)) return 0;
  }
  return 0x7f;
 }
 case 0x7f: {
  int i;
  int count = self->count;
  struct Row *p;
  i=0;
  if (count > 0) {
  p = (struct Row *)data_ov002_022cdc88;
  do {
   int slot = func_ov002_021b99b4(self->side,p->value*2+p->flag);
   if (!func_ov002_021c33e4(self->side,self->side,slot)) return 0;
   i++;
   p=(struct Row *)((char *)p+4);
  } while (i<count);
  }
  if (!func_ov002_021ca2b8(self->side)) return 0;
  if (func_ov002_021bc618(self->side)<count) return 0;
  if (data_ov002_022cd744[self->side]==1) data_ov002_022d016c.flag=1;
  else func_ov002_021ae484(0x59);
  return 0x7d;
 }
 case 0x7d:
  if (!data_ov002_022d016c.flag) return 0;
  data_ov002_022ce288.count=0;
  func_ov002_021e2b3c(0);
  return 0x7c;
 case 0x7c: {
  int count=self->count;
  func_ov002_0227adb8(self->side,(int)&data_ov002_022cdc88[data_ov002_022ce288.count],1,0);
  data_ov002_022ce288.count++;
  return data_ov002_022ce288.count<count ? 0x7c : 0x7b;
 }
 case 0x7b: func_ov002_021e2c5c(); return 0;
 default: return 0;
 }
}


