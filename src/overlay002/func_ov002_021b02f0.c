/* func_ov002_021b02f0: guard chain — requires func_ov002_021bae7c(arg0, 0x1468, -1)
 * nonzero, then three func_ov002_021bac38 lookups (0x1497/0x1498/0x1499) each
 * non-negative, final result is func_ov002_021bac38(arg0, 0x149a) >= 0. */
extern int func_ov002_021bae7c(int player, int code, int arg);
extern int func_ov002_021bac38(int a, int b);

int func_ov002_021b02f0(int arg0) {
    if (func_ov002_021bae7c(arg0, 0x1468, -1) == 0)
        return 0;
    if (func_ov002_021bac38(arg0, 0x1497) < 0)
        return 0;
    if (func_ov002_021bac38(arg0, 0x1498) < 0)
        return 0;
    if (func_ov002_021bac38(arg0, 0x1499) < 0)
        return 0;
    return func_ov002_021bac38(arg0, 0x149a) >= 0;
}
