/* func_ov002_022650c0: guard on func_ov002_021b4098(player,0xb,0x143d); if
 * true, fire func_ov002_021df6d4(player,0x143d) and
 * func_ov002_021df73c(player, round-to-nearest-10(row value)). Always
 * returns 1. */
extern int func_ov002_021b4098(int a, int b, int c);
extern void func_ov002_021df6d4(int player, int val);
extern char data_ov002_022cf16c[];
extern void func_ov002_021df73c(int player, int val);

int func_ov002_022650c0(int player) {
    if (func_ov002_021b4098(player, 0xb, 0x143d) != 0) {
        func_ov002_021df6d4(player, 0x143d);
        {
            int val = *(int *)(data_ov002_022cf16c + (player & 1) * 0x868);
            func_ov002_021df73c(player, (val + 5) / 10);
        }
    }
    return 1;
}
