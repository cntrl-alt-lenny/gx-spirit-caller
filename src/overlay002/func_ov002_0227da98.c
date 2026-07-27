/* func_ov002_0227da98: two guard queries then a sum-of-two-queries compare. */
extern int func_ov002_021bae7c(int player, int code, int arg);
extern int func_ov002_021c3ae4(int player, int code);
extern int func_ov002_021ba6cc(int player, int code);

int func_ov002_0227da98(int arg0) {
    if (func_ov002_021bae7c(1 - arg0, 0x1256, -1) != 0) return 0;
    if (func_ov002_021bae7c(arg0, 0x144d, -1) != 0) return 2;
    return (func_ov002_021c3ae4(arg0, 0x144d) + func_ov002_021ba6cc(arg0, 0x144d)) <= 0;
}
