/* func_ov002_02264c6c: if 021b3ecc(player, 11, 0x151E) is clear accept; else
 * run the 021df6d4 / 021e276c follow-ups and reject. */
extern int func_ov002_021b3dec(int player, int kind, int code);
extern void func_ov002_021df5e4(int player, int code);
extern void func_ov002_021e267c(int player, int code, int c, int d);

int func_ov002_02264c6c(int player) {
    if (func_ov002_021b3dec(player, 0xB, 0x151E) == 0)
        return 1;
    func_ov002_021df5e4(player, 0x151E);
    func_ov002_021e267c(player, 0x151E, 5, 0);
    return 0;
}
