extern int func_ov002_021ca3f0(int arg0, int arg1);
extern void func_ov002_02253458(int player, int kind, int idx);
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf184[];
typedef struct { unsigned int id:13; unsigned int rest:19; } Slot;
void func_ov002_0224b49c(int player, int id) {
    int other;
    unsigned int idx;
    char *base;
    Slot *row;
    switch (id) {
    case 0x1507: other = 0x1508; break;
    case 0x1508: other = 0x1507; break;
    }
    idx = 0;
    if (*(unsigned int *)(data_ov002_022cf184 + (player & 1) * 0x868) > idx) {
        row = (Slot *)(data_ov002_022cf16c + (player & 1) * 0x868 + 0x3a0);
        base = data_ov002_022cf16c + (player & 1) * 0x868;
        do {
            if (row->id == other) {
                if (func_ov002_021ca3f0(player, other) != 0) {
                    func_ov002_02253458(player, 12, idx);
                }
            }
            idx++;
            row++;
        } while (idx < *(unsigned int *)(base + 0x18));
    }
}



