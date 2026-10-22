typedef struct { char pad[0x14]; unsigned int count; char rest[0x850]; } Side;
extern char data_ov002_022cf180[];
extern Side data_ov002_022cf16c[];
extern void func_ov002_02253458(int player, int kind, int idx);

void func_ov002_0224ee48(int player) {
    unsigned int idx = 0;
    int side = player & 1;
    Side *base;
    if (*(unsigned int *)(data_ov002_022cf180 + side * 0x868) > idx) {
        base = &data_ov002_022cf16c[side];
        do {
            func_ov002_02253458(player, 14, idx);
            idx++;
        } while (idx < base->count);
    }
}
