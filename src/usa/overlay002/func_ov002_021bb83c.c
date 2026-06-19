/* func_ov002_021bb83c: sum func_ov002_021bb718(player, arg0, -1) over both
 * players. */
extern int func_ov002_021bb718(int player, int arg, int c);
int func_ov002_021bb83c(int arg0) {
    return func_ov002_021bb718(0, arg0, -1) + func_ov002_021bb718(1, arg0, -1);
}
