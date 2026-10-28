typedef unsigned int u32;
typedef unsigned short u16;
typedef unsigned char u8;
struct Self {
 u16 card;
 u16 player:1; u16 rest2:15;
 u16 pad4:2; u16 blocked:1; u16 rest4:13;
 char pad6[14];
 u32 key:9; u32 flag9:1; u32 pad14:4; u32 flag14:1; u32 rest14:17;
};
struct Record { u32 card:13; u32 bit:1; u32 pad:8; u32 value:8; u32 pad2:2; };
extern int func_ov002_021b947c(u32 key);
extern int func_ov002_021bc618(int arg0);
/* Original supplies only r0 to the four-argument thunk. */
extern int func_ov002_021ca2b8();
extern int func_ov002_021c33e4(int a, int b, int c);
extern void *func_ov002_021c93f0(int player, int kind, int extra);
extern void func_ov002_0227ac64(int a, struct Record *b, int c, int d, u32 e);
int func_ov002_02214d74(struct Self *self) {
 int packed;
 int player, kind, extra;
 if (self->blocked) return 0;
 if (func_ov002_021bc618(self->player) != 0) {
  if (func_ov002_021ca2b8(self->player) != 0) {
   packed = func_ov002_021b947c(self->key);
   player = (u8)packed;
   kind = (u8)((u16)packed >> 8);
   extra = (u16)((u32)packed >> 16);
   if (kind == 14) {
    if (func_ov002_021c33e4(self->player, player, extra) != 0) {
     struct Record *record = func_ov002_021c93f0(player, kind, extra);
     func_ov002_0227ac64(self->flag9, record, 1, self->flag14, 0);
    }
   }
  }
 }
 return 0;
}
