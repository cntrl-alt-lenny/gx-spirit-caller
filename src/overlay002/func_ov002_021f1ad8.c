extern int func_ov002_021b9ecc(int player, int kind);
extern int func_0202e234(int who);
extern int func_020310d8(int who);
extern int func_ov002_021b9e00(int player, int kind);

extern char data_ov002_022cf1a4[];
extern char data_ov002_022cf1ac[];

int func_ov002_021f1ad8(void *unused0, int player, int kind)
{
    int who = func_ov002_021b9ecc(player, kind);
    unsigned short v1;
    unsigned int v2;
    int a, b;

    if (who == 0) {
        return 0;
    }

    v1 = *(unsigned short *)(data_ov002_022cf1a4 + (player & 1) * 0x868 + kind * 20);
    if (v1 == 0) {
        return 0;
    }

    v2 = *(unsigned int *)(data_ov002_022cf1ac + (player & 1) * 0x868 + kind * 20);
    if ((v2 >> 6) & 1) {
        return 0;
    }

    if (func_0202e234(who)) {
        if (kind >= 5) {
            return 0;
        }
    }
    if (!func_0202e234(who)) {
        if (kind < 5) {
            return 0;
        }
    }

    a = func_ov002_021b9e00(player, kind);
    b = func_020310d8(who);
    return (a < b) ? 1 : 0;
}
