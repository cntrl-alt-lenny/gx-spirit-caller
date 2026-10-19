typedef unsigned short u16;
typedef unsigned int u32;
typedef unsigned char u8;
typedef struct { u16 f_0; u16 f_2; } Self02210104;
typedef struct {
 u16 id;
 u16 side:1; u16 slot:5; u16 kind:6; u16 pad2:4;
 u16 pad4:6; u16 value:9; u16 pad4b:1;
} Obj;
typedef struct { u32 lo:13; u32 b:1; u32 mid:8; u32 a:8; u32 hi:2; } Slot;
extern char data_ov002_022cf16c[];
extern int data_ov002_022cd3f4[];
extern int func_ov002_02210104(Self02210104 *self, int unused1);
extern int func_ov002_021bd030(int self);
extern void func_ov002_021d7054(int a, int b);
/* This caller passes three arguments; the thunk ignores its fourth parameter. */
extern int func_ov002_021d5d48();
extern int func_ov002_021d59cc(int arg0, int arg1, int arg2, int arg3, u16 arg4);
extern int func_ov002_021de480(int arg0, int arg1, int arg2, int arg3);
extern void func_ov002_021d479c(u16 a0, u16 a1, u16 a2, u16 a3);
int func_ov002_02219f7c(Obj *self, int arg1) {
 int idx;
 Slot *slot;
 if (self->kind == 2) {
  slot = (Slot *)(data_ov002_022cf16c + (self->side & 1) * 0x868 + 0x30 + self->slot * 0x14);
  if (self->value != slot->a * 2 + slot->b) return 0;
  return func_ov002_02210104((Self02210104 *)self, arg1);
 }
 idx = func_ov002_021bd030(self->side);
 if (idx >= 0) {
  func_ov002_021d7054((u16)((u8)self->side | ((u8)self->slot << 8)), (u16)((u8)data_ov002_022cd3f4[1] | ((u8)idx << 8)));
  func_ov002_021d5d48(self->side, (u16)((u8)data_ov002_022cd3f4[1] | ((u8)idx << 8)), (u16)((u8)data_ov002_022cd3f4[0] | ((u8)data_ov002_022cd3f4[7] << 8)));
  func_ov002_021d59cc(data_ov002_022cd3f4[1], idx, self->id, 0x21, 0);
 } else {
  func_ov002_021de480(self->side, self->slot, 0, self->id);
 }
 func_ov002_021d479c(0x1f, 0, 0, 0);
 return 0;
}

