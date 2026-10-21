struct Slot { unsigned int id : 13; };
extern char data_ov002_022cf16c[];
struct CountRow { unsigned int count; char padding[0x864]; };
extern struct CountRow data_ov002_022cf17c[];
extern struct CountRow data_ov002_022cf184[];
extern int func_ov002_021ca3f0(int arg0, int arg1);
extern int func_ov002_0223cfec(int player, int id);
extern int func_ov002_0223cf18(int player, int kind, int idx);
extern void func_ov002_02253458(int player, int kind, int idx);
void func_ov002_02252558(unsigned int player, int unused, unsigned int mode) {
    unsigned int side;
    unsigned int offset;
    unsigned int i;
    if (mode == 0) {
        unsigned int count;
        side = player & 1;
        offset = side * 0x868;
        count = data_ov002_022cf184[side].count;
        i = 0;
        if (count > i) {
            struct Slot *slot;
            char *base = offset + data_ov002_022cf16c;
            slot = (struct Slot *)(base + 0x3a0);
            do {
                int id = slot->id;
                if (func_ov002_021ca3f0(player, id) != 0) {
                    if (func_ov002_0223cfec(player, id) != 0)
                        func_ov002_02253458(player, 12, i);
                }
                i++;
                slot++;
            } while (i < *(unsigned int *)(base + 0x18));
        }
    } else {
        unsigned int count;
        side = player & 1;
        offset = side * 0x868;
        count = data_ov002_022cf17c[side].count;
        i = 0;
        if (count > i) {
            char *base = offset + data_ov002_022cf16c;
            do {
                if (func_ov002_0223cf18(player, 13, i) != 0)
                    func_ov002_02253458(player, 13, i);
                i++;
            } while (i < *(unsigned int *)(base + 0x10));
        }
    }
}

