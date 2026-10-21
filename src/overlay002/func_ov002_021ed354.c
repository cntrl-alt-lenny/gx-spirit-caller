typedef unsigned short u16;
struct Ov002Self {
    u16 f0;
    u16 b0 : 1;
    u16 unused1 : 5;
    u16 kind : 6;
    u16 unused2 : 3;
    u16 special : 1;
};
typedef int (*Callback02257888)(void *self, int player, int idx);
extern int func_ov002_021e96a0(struct Ov002Self *self, int player, int idx);
extern int func_ov002_021ba104(int a, int b, int c);
extern int func_ov002_021c23ac(int player, int index);
extern int func_ov002_02257888(void *self, Callback02257888 fn, int target);

int func_ov002_021ed354(struct Ov002Self *self, int player, int idx) {
    if (self->special) return func_ov002_021e96a0(self, player, idx);
    if (self->kind == 0x23) return 1;
    if (player != self->b0) return 0;
    if (idx >= 5) return 0;
    if (func_ov002_021ba104(player, idx, 0x1686) == 0) return 0;
    if (func_ov002_021c23ac(player, idx) == 0) return 0;
    return func_ov002_02257888(self, (Callback02257888)func_ov002_021e96a0, -1) != 0;
}
