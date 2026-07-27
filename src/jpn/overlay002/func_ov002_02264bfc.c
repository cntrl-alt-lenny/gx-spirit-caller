/* func_ov002_02264bfc: 3-guard chain (each returning 1 early), then a
 * 2-call finisher returning 0. */
extern int func_ov002_021b3dec(int arg0, int a, int b);
extern int func_ov002_021bbe70(int arg0);
extern void func_ov002_021df5e4(int arg0, int b);
extern void func_ov002_021e267c(int arg0, int b, int c, int d);

int func_ov002_02264bfc(int arg0) {
    if (func_ov002_021b3dec(arg0, 11, 0x151e) == 0)
        goto return_one;
    if (func_ov002_021bbe70(arg0) == 0)
        goto return_one;
    if (func_ov002_021bbe70(1 - arg0) != 0)
        goto return_one;
    func_ov002_021df5e4(arg0, 0x151e);
    func_ov002_021e267c(arg0, 0x151e, 5, 0);
    return 0;
return_one:
    return 1;
}
