struct Ov002Self;
struct Ov002Slot { unsigned int id : 13; char pad[16]; };
struct Ov002Row { char pad[0x30]; struct Ov002Slot slots[11]; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1ac[];
extern char data_ov002_022cf1a4[];
extern unsigned int func_0202b878(int id);
extern int func_ov002_021b8fcc(int a0, int a1);
extern int func_ov002_021c1ef0(struct Ov002Self *, int, int);
extern int func_ov002_021c2084(struct Ov002Self *, int, int, int);
int func_ov002_021e75a8(struct Ov002Self *self, int player, int idx) {
    unsigned int id;
    int row = (player & 1) * 0x868;
    int slot = idx * 20;
    id = ((struct Ov002Row *)(data_ov002_022cf16c + row))->slots[idx].id;
    if (id == 0) return 0;
    if (idx < 5) {
        if (func_ov002_021b8fcc(player, idx) == 0) return 0;
    }
    if (idx == 10) return 0;
    if (func_ov002_021c1ef0(self, player, idx) == 0) return 0;
    if (func_ov002_021c2084(self, player, idx, 1) == 0) return 0;
    if ((*(unsigned int *)(data_ov002_022cf1ac + row + slot) >> 9) & 1) return 0;
    if (*(unsigned short *)(data_ov002_022cf1a4 + row + slot) != 0) {
        return func_0202b878(id) == 0x17;
    }
    return 1;
}






