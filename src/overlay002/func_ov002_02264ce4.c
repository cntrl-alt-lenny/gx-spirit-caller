/* func_ov002_02264ce4: 3-guard chain (each returning 1 early), then a
 * 2-call finisher returning 0. */
extern int func_ov002_021b3ecc(int arg0, int a, int b);
extern int func_ov002_021bbf50(int arg0);
extern void func_ov002_021df6d4(int arg0, int b);
extern void func_ov002_021e276c(int arg0, int b, int c, int d);

int func_ov002_02264ce4(int arg0) {
    if (func_ov002_021b3ecc(arg0, 11, 0x151e) == 0)
        goto return_one;
    if (func_ov002_021bbf50(arg0) == 0)
        goto return_one;
    if (func_ov002_021bbf50(1 - arg0) != 0)
        goto return_one;
    func_ov002_021df6d4(arg0, 0x151e);
    func_ov002_021e276c(arg0, 0x151e, 5, 0);
    return 0;
return_one:
    return 1;
}
