/* func_ov002_021bb338: sum the per-player func_ov002_021bb1ec result over both
 * players (0 and 1). */
extern int func_ov002_021bb1ec(int player, int arg);
int func_ov002_021bb338(int arg0) {
    return func_ov002_021bb1ec(0, arg0) + func_ov002_021bb1ec(1, arg0);
}
