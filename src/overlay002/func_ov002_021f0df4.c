struct slot { unsigned int id : 13; unsigned int rest : 19; char pad[16]; };
struct bank { char pad[0x30]; struct slot slots[1]; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern char data_ov002_022cf1ac[];
extern unsigned int func_0202b878(int id);
extern unsigned int func_0202b8c0(int id);
extern int func_ov002_021b8fcc(int a0, int a1);
int func_ov002_021f0df4(void *self, int player, int idx) {
    int offset = (player & 1) * 0x868;
    int row = idx * 20;
    unsigned int id = ((struct bank *)(data_ov002_022cf16c + offset))->slots[idx].id;
    if (idx < 5) {
        if (func_ov002_021b8fcc(player, idx) == 0)
            return 0;
    }
    if (func_0202b878(id) != 0x17)
        return 0;
    if (*(unsigned short *)(data_ov002_022cf1a4 + offset + row) == 0)
        return 0;
    if (func_0202b8c0(id) != 4)
        return 0;
    return ((*(unsigned int *)(data_ov002_022cf1ac + offset + row) >> 9) & 1) == 0;
}





