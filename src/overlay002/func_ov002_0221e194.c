typedef unsigned short u16;
typedef unsigned int u32;
typedef unsigned char u8;
struct Self {
 u16 id;
 u16 player:1; u16 idx:5; u16 pad2:10;
 u16 pad4:6; u16 value:9; u16 top4:1;
 u16 low6:8; u16 count:8;
 u16 entries[1];
};
struct Row { u32 id:13; u32 lo:1; u32 pad:8; u32 hi:8; u32 top:2; };
union Packed { struct { u8 player; u8 idx; } b; u16 raw; };
extern char data_ov002_022cf16c[];
extern int func_ov002_021d90c0(int flag, int arg1, int arg2);
extern void func_ov002_021e276c(void *self, int a, int b, int c);
int func_ov002_0221e194(struct Self *self) {
 int player = self->player;
 int idx = self->idx;
 struct Row *row = (struct Row *)(data_ov002_022cf16c + (player & 1) * 0x868 + 0x30 + idx * 20);
 int mask, i;
 u16 packed;
 if (self->value != row->hi * 2 + row->lo) return 0;
 mask = 0;
 for (i = 0; i < self->count; i++) {
  u16 entry = self->entries[i];
  u8 hi = entry >> 8;
  u8 lo = entry & 0xff;
  if (self->id == 0x1aa9) lo = 1;
  mask |= 1 << (hi + (lo << 4));
 }
 func_ov002_021d90c0(player, idx, mask);
 player = self->player;
 packed = (u8)player | ((u8)self->idx << 8);
 func_ov002_021e276c((void *)player, packed, 6, 0);
 return 0;
}


