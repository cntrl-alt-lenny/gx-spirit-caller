typedef struct Slot {
    unsigned int id : 13;
    unsigned int rest : 19;
} Slot;
extern unsigned char data_ov002_022cf16c[];
extern unsigned char data_ov002_022cf180[];
extern int func_0202e234(int x);
extern int func_0202b950(int unused0);
extern int func_ov002_021b9128(int a, int b);
extern void func_ov002_02253458(int player, int kind, int idx);
void func_ov002_0224d660(int player) {
    int side = player & 1;
    unsigned int idx = 0;
    unsigned int count = *(unsigned int *)(data_ov002_022cf180 + side * 0x868);
    if (count > idx) {
        int id;
        Slot *row = (Slot *)(data_ov002_022cf16c + side * 0x868 + 0x418);
        unsigned char *base = data_ov002_022cf16c + side * 0x868;
        do {
            id = row->id;
            if (func_0202e234(id) != 0 && func_0202b950(id) <= 0x5dc && func_ov002_021b9128(id, 3) != 0) {
                func_ov002_02253458(player, 14, idx);
            }
            idx++;
            row++;
        } while (idx < *(unsigned int *)(base + 0x14));
    }
}

