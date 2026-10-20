extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern char data_ov002_022cf1a2[];
struct Self { unsigned short f0; unsigned short side:1; };
struct Slot { unsigned int id:13; char pad[16]; };
struct Table { char pad[0x30]; struct Slot slots[5]; };
int func_ov002_021f058c(struct Self *self, int player, int idx) {
    int row;
    int off;
    if (player != self->side) return 0;
    if (idx >= 5) return 0;
    row = (player & 1) * 0x868;
    off = idx * 20;
    if (((struct Table *)(data_ov002_022cf16c + row))->slots[idx].id == 0) return 0;
    if (*(unsigned short *)(data_ov002_022cf1a4 + row + off) != 0) {
        if (*(unsigned short *)(data_ov002_022cf1a2 + row + off) != 0) return 0;
    }
    return 1;
}
