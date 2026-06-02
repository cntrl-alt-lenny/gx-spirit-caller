/* func_ov000_021add24: (a2>>1) - (a1 * 021ac7dc(a0) >> 2). */
extern int func_ov000_021ac7dc(int a);
int func_ov000_021add24(int a0, int a1, int a2) {
    return (a2 >> 1) - (a1 * func_ov000_021ac7dc(a0) >> 2);
}
