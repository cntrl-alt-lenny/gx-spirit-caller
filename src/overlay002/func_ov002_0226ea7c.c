/* func_ov002_0226ea7c: when 021bc618(arg0) and 021c38c4(arg0,arg1) >= 5,
 * report 021bb9b4(arg0, 0x1AA3) positive. */
extern int func_ov002_021bc618(int player);
extern int func_ov002_021c38c4(int player, int arg1);
extern int func_ov002_021bb9b4(int player, int code);

int func_ov002_0226ea7c(int arg0, int arg1) {
    if (func_ov002_021bc618(arg0) != 0 && func_ov002_021c38c4(arg0, arg1) >= 5)
        return func_ov002_021bb9b4(arg0, 0x1AA3) > 0;
    return 0;
}
