extern int func_ov002_021b9dec(int player, int kind);
extern int func_0202e1e0(int who);
extern int func_02031084(int who);
extern int func_ov002_021b9d20(int player, int kind);

extern char data_ov002_022cf0c4[];
extern char data_ov002_022cf0cc[];

int func_ov002_021f19e8(void *unused0, int player, int kind)
{
    int who = func_ov002_021b9dec(player, kind);
    unsigned short v1;
    unsigned int v2;
    int a, b;

    if (who == 0) {
        return 0;
    }

    v1 = *(unsigned short *)(data_ov002_022cf0c4 + (player & 1) * 0x868 + kind * 20);
    if (v1 == 0) {
        return 0;
    }

    v2 = *(unsigned int *)(data_ov002_022cf0cc + (player & 1) * 0x868 + kind * 20);
    if ((v2 >> 6) & 1) {
        return 0;
    }

    if (func_0202e1e0(who)) {
        if (kind >= 5) {
            return 0;
        }
    }
    if (!func_0202e1e0(who)) {
        if (kind < 5) {
            return 0;
        }
    }

    a = func_ov002_021b9d20(player, kind);
    b = func_02031084(who);
    return (a < b) ? 1 : 0;
}
