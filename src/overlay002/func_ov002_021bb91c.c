/* func_ov002_021bb91c: sum func_ov002_021bb7f8(player, arg0, -1) over both
 * players. */
extern int func_ov002_021bb7f8(int player, int arg, int c);
int func_ov002_021bb91c(int arg0) {
    return func_ov002_021bb7f8(0, arg0, -1) + func_ov002_021bb7f8(1, arg0, -1);
}
