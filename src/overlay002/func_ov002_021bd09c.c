/* func_ov002_021bd09c: count how many of 021bcfe4(arg0,i) for i in [5,10)
 * are nonzero; if 021bb068(0x16df) is set, possibly recompute the count
 * via 021bbeac(arg0), then clamp to >=0. */
extern int func_ov002_021bcfe4(int arg0, int arg1);
extern int func_ov002_021bb068(int cmd);
extern int func_ov002_021bbeac(int arg0);

int func_ov002_021bd09c(int arg0) {
    int i;
    int result = 0;
    for (i = 5; i < 10; i++) {
        if (func_ov002_021bcfe4(arg0, i) != 0)
            result++;
    }
    if (func_ov002_021bb068(0x16df) != 0) {
        if (result >= 5 - func_ov002_021bbeac(arg0)) {
            result = 5 - func_ov002_021bbeac(arg0);
        }
        if (result <= 0)
            result = 0;
    }
    return result;
}
