struct CountBlock { unsigned int count; char pad[0x864]; };
extern char data_ov002_022cf16c[];
extern struct CountBlock data_ov002_022cf180[];
extern void func_ov002_02253458(int player, int kind, int idx);
void func_ov002_022493f0(int player) {
    unsigned int i = 0;
    int p = 1 - player;
    char *base;
    if (data_ov002_022cf180[p & 1].count > i) {
        base = data_ov002_022cf16c + (p & 1) * 0x868;
        do {
            func_ov002_02253458(p, 14, i);
            i++;
        } while (i < *(unsigned int *)(base + 0x14));
    }
    i = 0;
    if (data_ov002_022cf180[player & 1].count > i) {
        base = data_ov002_022cf16c + (player & 1) * 0x868;
        do {
            func_ov002_02253458(player, 14, i);
            i++;
        } while (i < *(unsigned int *)(base + 0x14));
    }
}
