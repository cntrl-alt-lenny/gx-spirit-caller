extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern int func_ov002_021b9ecc(int a, int b);
extern int func_ov002_021b90a8(int arg0, int arg1);
extern int func_ov002_021ba104(int a, int b, int c);
extern int func_0202e2f8(int unused0);
struct Self { unsigned short f0; unsigned short side:1; };
struct Slot { unsigned int id:13; char pad4[4]; unsigned short status; char pad10[10]; };
struct Table { char pad[0x30]; struct Slot slots[5]; };
int func_ov002_021f0478(struct Self *self, int player, int idx) {
    int row = (player & 1) * 0x868;
    int off = idx * 20;

    int id = ((struct Slot *)((data_ov002_022cf16c + row) + off + 0x30))->id;
    int value = func_ov002_021b9ecc(player, idx);
    int i;
    int count;
    if (id == 0) return 0;
    if (player != self->side) return 0;
    if (idx >= 5) return 0;
    if (*(unsigned short *)(data_ov002_022cf1a4 + row + off) == 0) return 0;
    if (func_ov002_021b90a8(player, idx) == 0) return 0;
    if (func_0202e2f8(id) != 0) return 0;
    count = 0;
    for (i = 0; i <= 4; i++) {
        if (((struct Table *)(data_ov002_022cf16c + row))->slots[i].status != 0) {
            if (func_ov002_021ba104(player, i, value) != 0) count++;
        }
    }
    return count == 3;
}








