typedef unsigned short u16;
struct Node {
 u16 kind;
 u16 owner:1; u16 slot:5; u16 category:6; u16 mode:2; u16 rest:2;
 u16 low:6; u16 index:9; u16 high:1;
};
struct Card { unsigned id:13; unsigned flag:1; unsigned rest:8; unsigned index:8; unsigned end:2; };
struct Entry { struct Card card; char pad[16]; };
struct Player { char pad[48]; struct Entry cards[5]; char tail[2004]; };
extern struct Player data_ov002_022cf16c[];
struct State { char pad[0x5b4]; int step; };
extern struct State data_ov002_022ce288;
extern char data_ov002_022d016c[];
extern int data_ov002_022cd744[];
extern int func_ov002_022536e8(void *self, int arg1, int arg2);
extern int func_ov002_021ae4bc(int self, int idx);
extern void func_ov002_021df62c(int arg0, int arg1, int idx);
extern int func_ov002_021decdc(void *arg0, int arg1, int arg2);
extern void func_ov002_0226b094(int arg0, int arg1);
int func_ov002_021f9434(struct Node *self) {
 switch (data_ov002_022ce288.step) {
 case 0:
  if (self->index != data_ov002_022cf16c[self->owner & 1].cards[self->slot].card.index * 2 + data_ov002_022cf16c[self->owner & 1].cards[self->slot].card.flag) return -1;
  if (data_ov002_022cd744[self->owner] == 1) {
   *(int *)(data_ov002_022d016c + 0xd44) = func_ov002_022536e8((void *)self->owner, self->kind, 0) > 0;
  } else {
   if (func_ov002_022536e8((void *)self->owner, self->kind, 0) == 0)
    func_ov002_021ae4bc(0x142, self->index);
   else func_ov002_021ae4bc(0xec, self->index);
  }
  ++data_ov002_022ce288.step;
  return 0;
 case 1:
  if (*(int *)(data_ov002_022d016c + 0xd44)) {
   func_ov002_021df62c(self->owner, self->slot, self->index);
   func_ov002_021decdc(self, self->owner, self->slot);
  } else {
   func_ov002_0226b094(1-self->owner, 0x10d6);
   ++data_ov002_022ce288.step;
   return 0;
  }
  return 1;
 case 2: return -1;
 }
 return 1;
}
