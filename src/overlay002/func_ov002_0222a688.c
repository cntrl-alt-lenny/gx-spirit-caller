typedef unsigned short u16;
typedef unsigned int u32;
struct Node { u16 id; u16 player:1; u16 pad:13; u16 other:1; u16 top:1; u16 pad4:6; u16 field:9; u16 top4:1; };
struct Record { u32 card:13; u32 bit:1; u32 pad:8; u32 value:8; u32 pad2:2; };
extern char data_ov002_022cf16c[];
extern int func_ov002_021b947c(u32 key);
extern int func_ov002_021bc618(int arg0);
extern int func_ov002_021c3608(int a, int b, int c);
/* Original caller supplies only r0 to this four-parameter thunk. */
extern int func_ov002_021ca2b8();
extern int func_ov002_021ca5bc(int arg0);
extern void func_ov002_021d81d4(u32 arg0, u32 arg1);
extern void func_ov002_0227ac64(int a, struct Record *b, int c, int d, u32 e);
int func_ov002_0222a688(struct Node *self) {
 int player = self->player ^ self->other;
 int packed = func_ov002_021b947c(self->field);
 int side = (unsigned char)packed;
 int index = (u16)((u32)packed >> 16);
 if (func_ov002_021ca2b8(player) == 0) return 0;
 if ((unsigned char)((u16)packed >> 8) == 15 && func_ov002_021c3608(player, side, index) != 0) {
  if (func_ov002_021bc618(player) != 0) {
   u16 id = self->id;
   int mode = 2;
   if (id == 0x16be) mode = 0;
   func_ov002_0227ac64(player, (struct Record *)(data_ov002_022cf16c + (side & 1) * 0x868 + 0x5d0) + index, 1, mode, (u32)id << 16);
  } else {
   if (func_ov002_021ca5bc(self->field) != 0) func_ov002_021d81d4(side, self->field);
  }
 }
 return 0;
}


