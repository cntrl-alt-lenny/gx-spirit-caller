/* func_ov002_021ca698: bail if the opponent has 021bae7c(0x1480), or if a
 * 021bb068(0x159D) flag is set while arg1 lacks 021bae7c(0x158B); else 1. */
extern int func_ov002_021bae7c(int player, int code, int arg);
extern int func_ov002_021bb068(int code);

int func_ov002_021ca698(int arg0, int arg1) {
    if (func_ov002_021bae7c(1 - arg0, 0x1480, -1) != 0)
        return 0;
    if (func_ov002_021bb068(0x159D) != 0 && func_ov002_021bae7c(arg1, 0x158B, -1) == 0)
        return 0;
    return 1;
}
