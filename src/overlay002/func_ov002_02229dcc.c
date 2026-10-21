typedef unsigned short u16;
struct Context { u16 f0; u16 bit0:1; u16 rest:15; u16 f4; u16 f6; u16 flags; };
extern char data_ov002_022ce288[];
extern char data_ov002_022cf16c[];
int func_ov002_02229dcc(int player, int kind, int index) {
    struct Context *p = *(struct Context **)(data_ov002_022ce288 + 0x48c);
    if (player == p->bit0 && kind == 0xb) {
        int card = (unsigned)(*(int *)(data_ov002_022cf16c + (player & 1) * 0x868 + index * 4 + 0x120) << 19) >> 19;
        switch (card) {
        case 0x1531: if (!(p->flags & 1)) return 0x800; break;
        case 0x161e: if (!(p->flags & 2)) return 0x800; break;
        case 0x1656: if (!(p->flags & 4)) return 0x800; break;
        case 0x1685: if (!(p->flags & 8)) return 0x800; break;
        case 0x1686: if (!(p->flags & 0x10)) return 0x800; break;
        }
    }
    return 0;
}
