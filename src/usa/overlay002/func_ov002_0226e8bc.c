/* func_ov002_0226e8bc: accept when 021bc618(arg0), 021c38c4(arg0,arg1) >= 5,
 * and 021c3008(arg0, 0x197F) all hold. */
extern int func_ov002_021bc538(int player);
extern int func_ov002_021c37e4(int player, int arg1);
extern int func_ov002_021c2f28(int player, int code);

int func_ov002_0226e8bc(int arg0, int arg1) {
    if (func_ov002_021bc538(arg0) != 0 && func_ov002_021c37e4(arg0, arg1) >= 5
        && func_ov002_021c2f28(arg0, 0x197F) != 0)
        return 1;
    return 0;
}
