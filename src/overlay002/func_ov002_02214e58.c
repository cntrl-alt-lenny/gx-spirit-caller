typedef unsigned short u16;
typedef unsigned char u8;
struct Slot { u16 side:1; u16 kind:4; u16 number:9; u16 state:2; };
struct Node { u16 id; u16 side:1; u16 row:5; u16 rest:10; u16 pad4:6; u16 number:9; u16 rest4:1; struct { u16 lo:8; u16 hi:8; } count; struct Slot slots[5]; u16 start; };
struct Row { unsigned id:13; unsigned bit13:1; unsigned pad:8; unsigned field:8; unsigned rest:2; char tail[16]; };
struct Player { char prefix[48]; struct Row rows[5]; char tail[2004]; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern int func_ov002_0223df38(struct Node *self, int idx, int *out);
extern void func_ov002_021c4c9c(int side, int row, int *out);
extern int func_ov002_021d90c0(int flag, int arg1, int arg2);
int func_ov002_02214e58(struct Node *self) {
 int pair;
 int info[11];
 int off = (self->side & 1) * 0x868;
 int rowoff = self->row * 20;
 struct Row *entry = (struct Row *)(data_ov002_022cf16c + off + 0x30 + rowoff);
 if (self->number != entry->field * 2 + entry->bit13) return 0;
 if (*(u16 *)(data_ov002_022cf1a4 + off + rowoff) == 0) return 0;
 if (func_ov002_0223df38(self, 0, &pair)) {
  int side = (u8)pair;
  int row = (u8)((u16)pair >> 8);
  int offset = (side & 1) * 0x868;
  if (((struct Row *)((int)(data_ov002_022cf16c + offset) + row * 20 + 0x30))->id && *(u16 *)(data_ov002_022cf1a4 + offset + row * 20)) {
   int a, b;
   func_ov002_021c4c9c(side, row, info);
   a = info[8];
   if (a > 0xffff) a = 0xffff;
   b = info[7];
   if (b > 0xffff) b = 0xffff;
   func_ov002_021d90c0(self->side, self->row, (u16)b | ((u16)a << 16));
  }
 }
 return 0;
}

