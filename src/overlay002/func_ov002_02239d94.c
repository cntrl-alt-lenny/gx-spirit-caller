typedef unsigned short u16;
typedef unsigned char u8;
struct Node0223def4 { char _pad[8]; u16 arr8[5]; u16 f18; };
struct Self {
 u16 f0;
 u16 player:1; u16 index:5; u16 :10;
 u16 :6; u16 serial:9; u16 :1;
 u16 :8; u16 count:8;
};
struct Slot { unsigned int :13; unsigned int flag:1; unsigned int :8; unsigned int serial:8; unsigned int :2; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern int func_ov002_0223def4(struct Node0223def4 *self, int idx);
extern int func_ov002_021b99b4(int player, int id);
extern int func_ov002_021bd030(int self);
extern int func_ov002_021d8414(int arg0, int arg1, int arg2, int arg3, int arg4, int arg5, int arg6);
extern void func_ov002_021d5d58(int a, int b, int c, int d);
int func_ov002_02239d94(struct Self *self) {
 int off = (self->player & 1) * 0x868;
 int idx = self->index * 20;
 struct Slot *slot = (struct Slot *)(data_ov002_022cf16c + off + 0x30 + idx);
 int id, found, dest;
 if (self->serial != slot->serial * 2 + slot->flag) return 0;
 if (*(u16 *)(data_ov002_022cf1a4 + off + idx) == 0) return 0;
 if (self->count != 0) {
  id = func_ov002_0223def4((struct Node0223def4 *)self, 0);
  found = func_ov002_021b99b4(self->player, id);
  dest = func_ov002_021bd030(self->player);
  if (dest < 0) return 0;
  if (found < 0) return 0;
  func_ov002_021d8414(self->player, 14, id, self->player, dest, 1, 0);
  func_ov002_021d5d58(self->player, (u16)((u8)self->player | ((u8)dest << 8)), (u16)((u8)self->player | ((u8)self->index << 8)), 13);
 }
 return 0;
}
