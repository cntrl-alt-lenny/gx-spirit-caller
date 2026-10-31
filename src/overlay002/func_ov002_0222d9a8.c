typedef unsigned short u16;
struct Self { u16 kind; u16 side:1; u16 slot:5; u16 rest:10; };
struct State { char pad[0x5a8]; int phase; };
struct Player { int field; char pad[0x864]; };
extern struct State data_ov002_022ce288;
extern struct Player data_ov002_022cf178[];
extern void func_ov002_021d7970(void *arg0, int arg1, int arg2);
extern int func_ov002_021de408(int a, int b);
extern int func_ov002_02257704(void *self);
int func_ov002_0222d9a8(struct Self *self) {
 switch (data_ov002_022ce288.phase) {
 case 0x80: {
  int side=self->side;
  if (data_ov002_022cf178[side & 1].field==0) return 0x7f;
  func_ov002_021d7970(side,0,0);
  return 0x80;
 }
 case 0x7f: {
  int side=1-self->side;
  if (data_ov002_022cf178[side & 1].field==0) return 0x7e;
  func_ov002_021d7970(side,0,1);
  return 0x7f;
 }
 case 0x7e: {
  int mask=func_ov002_02257704(self) ^ 0xffffffff;
  func_ov002_021de408((int)self,mask ^ (1 << (self->side*16+self->slot)));
  return 0;
 }
 default: return 0;
 }
}

