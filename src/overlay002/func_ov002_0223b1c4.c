extern int data_ov002_022d016c[];
extern int func_ov002_0225764c(int arg0, int arg1, int arg2);
extern void func_ov002_021d93e0(int a, int b, int c);

int func_ov002_0223b1c4(int arg0) {
    int player;
    int i;
    for (i = 0; i < 2; i++) {
        player = data_ov002_022d016c[0xcec / 4] ^ i;
        if (func_ov002_0225764c(arg0, player, 10)) {
            func_ov002_021d93e0(player, 10, 2);
        }
    }
    return 0;
}

