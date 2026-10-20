typedef unsigned int u32;
struct Obj {
 unsigned short id;
 unsigned short side:1;
 unsigned short pad:5;
 unsigned short kind:6;
 unsigned short rest:4;
};
struct Record { u32 card:13; u32 bit:1; u32 pad:8; u32 value:8; u32 pad2:2; };
struct State { char pad[0x5a8]; int state; int index; };
extern int data_ov002_022be13c[];
extern int data_ov002_022be144[];
extern struct State data_ov002_022ce288;
extern char data_ov002_022cf288[];
extern int func_ov002_021bc618(int arg0);
extern int func_ov002_021ca0d4(int arg0, int arg1);
extern int func_ov002_021ca3f0(int arg0, int arg1);
/* The original supplies no argument to these unused-parameter hubs. */
extern void func_ov002_021e2b3c();
extern void func_ov002_021e2c5c();
extern void func_ov002_0227ac64(int a, struct Record *b, int c, int d, u32 e);
int func_ov002_022158c0(struct Obj *p) {
 int count = 0;
 int *cards = 0;

 if (p->id != 0x12d2) {
  if (p->id == 0x1710) {
   cards = data_ov002_022be13c;
   count = 2;
  }
 } else {
  cards = data_ov002_022be144;
  count = 4;
 }
 switch (data_ov002_022ce288.state) {
 case 0x80:
  if (func_ov002_021bc618(p->side) < count) return 0;
  if (func_ov002_021ca0d4(p->side,p->id) == 0) return 0;
  if (func_ov002_021ca3f0(p->side,cards[0]) == 0) return 0;
  if (p->kind != 0x23) {
   if ((*(u32 *)(data_ov002_022cf288 + (p->side & 1) * 0x868) >> 16) & 1) return 0;
  }
  func_ov002_021e2b3c();
  data_ov002_022ce288.index = 0;
  return 0x7f;
 case 0x7f:
  if (data_ov002_022ce288.index >= count) return 0x7e;
  { struct Record record = {0};
  record.card = cards[data_ov002_022ce288.index];
  record.bit = p->side;
  func_ov002_0227ac64(p->side,&record,1,1,1);
  }
  data_ov002_022ce288.index++;
  return 0x7f;
 case 0x7e:
  func_ov002_021e2c5c();
 }
 return 0;
}


