/* func_ov002_02264fd8: guard on func_ov002_021b3fb8(player,0xb,0x143d); if
 * true, fire func_ov002_021df5e4(player,0x143d) and
 * func_ov002_021df64c(player, round-to-nearest-10(row value)). Always
 * returns 1. */
extern int func_ov002_021b3fb8(int a, int b, int c);
extern void func_ov002_021df5e4(int player, int val);
extern char data_ov002_022cf08c[];
extern void func_ov002_021df64c(int player, int val);

int func_ov002_02264fd8(int player) {
    if (func_ov002_021b3fb8(player, 0xb, 0x143d) != 0) {
        func_ov002_021df5e4(player, 0x143d);
        {
            int val = *(int *)(data_ov002_022cf08c + (player & 1) * 0x868);
            func_ov002_021df64c(player, (val + 5) / 10);
        }
    }
    return 1;
}
