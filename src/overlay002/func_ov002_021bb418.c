/* func_ov002_021bb418: sum the per-player func_ov002_021bb2cc result over both
 * players (0 and 1). */
extern int func_ov002_021bb2cc(int player, int arg);
int func_ov002_021bb418(int arg0) {
    return func_ov002_021bb2cc(0, arg0) + func_ov002_021bb2cc(1, arg0);
}
