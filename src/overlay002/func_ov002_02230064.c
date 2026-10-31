typedef unsigned short u16;
struct Node { u16 id; u16 owner:1; u16 slot:5; u16 rest:10; u16 low:6; u16 value:9; u16 high:1; };
struct Card { unsigned id:13; unsigned flag:1; unsigned pad:8; unsigned value:8; unsigned rest:2; };
struct Entry { struct Card card; char pad[16]; };
struct Player { char pad[48]; struct Entry cards[5]; char tail[2004]; };
struct Counter { u16 value; char pad[18]; };
struct Counts { struct Counter slots[5]; char tail[2052]; };
extern char data_ov002_022ce288[];
extern struct Player data_ov002_022cf16c[];
extern struct Counts data_ov002_022cf1a4[];
extern char data_ov002_022d0e6c[];
extern char data_ov002_022d016c[];
extern int func_ov002_021c92ec(int a, int b, int unused, int d);
extern int func_ov002_021d59cc(int a, int b, int c, int d, unsigned short e);
extern int func_ov002_021d90c0(int a, int b, int c);
extern void func_ov002_0226b0f0(int a, int b, int c, int d);
int func_ov002_02230064(struct Node *self) {
 switch (*(int *)(data_ov002_022ce288 + 0x5a8)) {
 case 0x80:
  if (self->value != data_ov002_022cf16c[self->owner & 1].cards[self->slot].card.value * 2 + data_ov002_022cf16c[self->owner & 1].cards[self->slot].card.flag) return 0;
  if (data_ov002_022cf1a4[self->owner & 1].slots[self->slot].value == 0) return 0;
  func_ov002_0226b0f0(self->owner, self->id, 1, (1 << func_ov002_021c92ec(self->owner,self->slot,data_ov002_022cf1a4[self->owner & 1].slots[self->slot].value,self->slot * 20)) ^ 0xff);
  return 0x7f;
 case 0x7f:
  func_ov002_021d90c0(self->owner,self->slot,*(u16 *)(data_ov002_022d0e6c + 0xb2));
  func_ov002_021d59cc(self->owner,self->slot,self->id,3,(u16)*(int *)(data_ov002_022d016c + 0xce8));
  return 0;
 }
 return 0;
}
