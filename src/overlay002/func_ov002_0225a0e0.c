extern char data_ov002_022d016c[];
extern char data_ov002_022cf16c[];
extern int func_ov002_02259f74(int x);
extern int func_ov002_0225a098(int player);
extern int func_ov002_021b3ecc(int arg0, int arg1, int arg2);
extern int func_ov002_021b4120(int arg0, int arg1, int arg2);
extern int func_ov002_021baca8(int a0, int a1, int a2);
extern int func_ov002_021bb068(int id);
extern int func_ov002_021be2d8(int a0, int a1, int a2);
extern int func_ov002_021be384(int a0, int a1, int a2);
extern int func_ov002_021bf294(int a0, int a1, int a2, int a3, int a4);

int func_ov002_0225a0e0(int player) {
    int i, j;
    int other;
    char *row;
    if (*(int *)(data_ov002_022d016c + 0xcf8) != 3) {
        if (func_ov002_02259f74(player) == 0) return 1;
    }
    if (func_ov002_0225a098(player) != 0) return 1;
    if (func_ov002_021b3ecc(player, 11, 0x15ff) != 0) {
        int result;
        other = 1 - player;
        result = func_ov002_021b4120(other, 11, 0x15ff);
        switch (result) {
        case -1:
        case 1:
            for (i = 0; i < 5; i++) {
                if (func_ov002_021be384(player, i, 1) != 0) {
                    for (j = 0; j <= 4; j++) {
                        if (func_ov002_021bf294(player, i, other, j, 1) != 0) return 0;
                    }
                }
            }
            break;
        case 0:
            break;
        }
    }
    if (func_ov002_021b3ecc(player, 11, 0x1669) != 0 ||
        func_ov002_021b3ecc(player, 11, 0x14a6) != 0 ||
        func_ov002_021bb068(0x1443) != 0) {
        for (i = 0; i < 5; i++) {
            if (func_ov002_021be2d8(player, i, 1) != 0) return 0;
        }
    }
    for (i = 0; i < 5; i++) {
        if (func_ov002_021baca8(player, i, 0x16bf) != 0) {
            if (func_ov002_021be2d8(player, i, 1) != 0) return 0;
        }
    }
    row = data_ov002_022cf16c + (player & 1) * 0x868;
    other = 1 - player;
    for (i = 0; i < 5; i++, row += 0x14) {
        if (func_ov002_021baca8(player, i, 0x1a79) != 0 && *(int *)(row + 0x3c) != 0) {
            if (func_ov002_021be384(player, i, 1) != 0) {
                for (j = 0; j <= 4; j++) {
                    if (func_ov002_021bf294(player, i, other, j, 1) != 0) return 0;
                }
            }
        }
    }
    return 1;
}

