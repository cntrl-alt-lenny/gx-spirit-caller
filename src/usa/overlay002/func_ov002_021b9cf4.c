/* func_ov002_021b9cf4: min-cost query — walk player arg0/arg1's node list via
 * func_ov002_021b4204, clamping a 0x10000 accumulator through the
 * func_ov002_021b9cc4 callback, and return the resulting u16. */
extern int func_ov002_021b4204(int a, int b, int (*cb)(unsigned short *, int *), int *acc);
extern int func_ov002_021b9cc4(unsigned short *a, int *b);
int func_ov002_021b9cf4(int arg0, int arg1) {
    int buf = 0x10000;
    func_ov002_021b4204(arg0, arg1, func_ov002_021b9cc4, &buf);
    return (unsigned short)buf;
}
