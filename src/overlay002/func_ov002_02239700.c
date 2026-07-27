/* func_ov002_02239700: for j in 0..1, k in 0..4, if
 * func_ov002_0225764c(arg0,j,k) is nonzero, ping
 * func_ov002_021d94ac(j,k,2,0x1a90). */
extern int func_ov002_0225764c(void *arg0, int j, int k);
extern void func_ov002_021d94ac(int j, int k, int a, int b);

int func_ov002_02239700(void *arg0) {
    int j, k;
    for (j = 0; j < 2; j++) {
        for (k = 0; k <= 4; k++) {
            if (func_ov002_0225764c(arg0, j, k) != 0) {
                func_ov002_021d94ac(j, k, 2, 0x1a90);
            }
        }
    }
    return 0;
}
