extern int func_ov002_021baca8(int player, int idx, int arg1);
extern int func_ov002_021de480(int a, int b, int c, int d);
extern int data_ov002_022cf178[];

int func_ov002_02267d14(int player) {
    int i;
    if (*(unsigned int *)((char *)data_ov002_022cf178 + (player & 1) * 0x868) <= 4) {
        for (i = 5; i < 10; i++) {
            if (func_ov002_021baca8(player, i, 0x1540) != 0) {
                func_ov002_021de480(player, i, 0, 0);
                return 0;
            }
        }
    }
    return 1;
}
