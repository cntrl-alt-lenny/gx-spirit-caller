/* func_ov002_0227d9a8: two guard queries then a sum-of-two-queries compare. */
extern int func_ov002_021bad9c(int player, int code, int arg);
extern int func_ov002_021c3a04(int player, int code);
extern int func_ov002_021ba5ec(int player, int code);

int func_ov002_0227d9a8(int arg0) {
    if (func_ov002_021bad9c(1 - arg0, 0x1256, -1) != 0) return 0;
    if (func_ov002_021bad9c(arg0, 0x144d, -1) != 0) return 2;
    return (func_ov002_021c3a04(arg0, 0x144d) + func_ov002_021ba5ec(arg0, 0x144d)) <= 0;
}
