typedef unsigned short u16;
struct Self { u16 id; u16 side:1; u16 rest:15; u16 pad; u16 low:8; u16 kind:8; };
extern int func_0202f46c(int x);
extern int func_ov002_021b9ecc(int a, int b);
extern int func_ov002_021ba104(int a, int b, int c);
extern int func_ov002_021c23ac(int a, int b);
int func_ov002_021ed4c0(struct Self *self, int player, int idx) {
    if (self->side != player) return 0;
    if (idx >= 5) return 0;
    if (func_ov002_021c23ac(player, idx) == 0) return 0;
    switch (self->id) {
    case 0x146f: return func_ov002_021ba104(player, idx, 0x147a);
    case 0x18a3:
        switch (self->kind) {
        case 0: return func_ov002_021ba104(player, idx, 0x189e);
        case 1: return func_ov002_021ba104(player, idx, 0x18a0);
        case 2: return func_ov002_021ba104(player, idx, 0x189f);
        }
        break;
    case 0x1907: return func_ov002_021ba104(player, idx, 0x18aa);
    case 0x1a9a: return func_0202f46c(func_ov002_021b9ecc(player, idx));
    }
    return 0;
}
