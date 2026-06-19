/* func_ov002_021bb6d0: per-player minimum ignoring zeros — query both players
 * via func_ov002_021bb57c; if either is zero return the other, else the min. */
extern int func_ov002_021bb57c(int player, int arg);
int func_ov002_021bb6d0(int arg0) {
    int a = func_ov002_021bb57c(0, arg0);
    int b = func_ov002_021bb57c(1, arg0);
    if (a == 0)
        return b;
    if (b == 0)
        return a;
    if (a >= b)
        a = b;
    return a;
}
