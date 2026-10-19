extern int func_ov002_021c38c4(int player, int slot);
extern int func_ov002_0226eb5c(int player, int slot, int mode, int arg);
extern char data_ov002_022d0250[];
struct SmallSlot { unsigned short id:13; unsigned short rest:3; };
int func_ov002_0227d8c4(int player, int slot, int flag) {
    int id = ((struct SmallSlot *)(data_ov002_022d0250 + slot * 4))->id;
    int count = func_ov002_021c38c4(player, slot);
    int mask;
    switch (id) {
    case 0x1386: case 0x1387: case 0x1388:
    case 0x16ec: case 0x1725: case 0x1729:
    case 0x1985: case 0x1986: case 0x1b2e: case 0x1b2f:
        return 3;
    }
    if (count <= 4) return 0;
    if (flag) mask = 0x40; else mask = 0x10;
    if (mask & func_ov002_0226eb5c(player, slot, 2, 0))
        return id == 0x1864;
    if (count <= 6) return 1;
    return 2;
}
