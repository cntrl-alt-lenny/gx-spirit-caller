typedef struct Slot {
    unsigned int id : 13;
    unsigned int rest : 19;
} Slot;
extern unsigned char data_ov002_022cf16c[];
extern unsigned char data_ov002_022cf17c[];
extern unsigned int func_0202b878(int id);
extern void func_ov002_02253458(int player, int kind, int idx);
void func_ov002_0224d794(int player) {
    int side = player & 1;
    unsigned int idx = 0;
    unsigned int count = *(unsigned int *)(data_ov002_022cf17c + side * 0x868);
    if (count > idx) {
        Slot *row = (Slot *)(data_ov002_022cf16c + side * 0x868 + 0x260);
        unsigned char *base = data_ov002_022cf16c + side * 0x868;
        do {
            if (func_0202b878(row->id) == 10) {
                func_ov002_02253458(player, 13, idx);
            }
            idx++;
            row++;
        } while (idx < *(unsigned int *)(base + 0x10));
    }
}

