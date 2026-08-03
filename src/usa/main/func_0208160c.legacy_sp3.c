/* func_0208160c: advance an in/out cursor (x, passed by value+pointer to
 * func_02081708) by a per-step increment, optionally biasing the position
 * argument via func_0207ff10 depending on two flag bits (0x800 / 0x400),
 * accumulating a running total (a2) each pass. */
extern int func_0207ff10(char **a, int b, int c, int d);
extern void func_02081708(void *a0, int a1, int a2, int a3, int a4, int *a5);

struct S020816f4 {
    int pad0;
    char **field_4;
    int field_8;
    int field_c;
};

void func_0208160c(struct S020816f4 *a0, int a1, int a2, int a3, int a4, int flags, int x0) {
    char step = (*a0->field_4)[1];
    int inc = a0->field_c + step;
    int x = x0;
    if (x == 0) {
        return;
    }
    do {
        int r1 = a1;
        if (flags & 0x800) {
            int t = func_0207ff10(a0->field_4, a0->field_8, x, 0);
            r1 = a1 + (a3 - t);
        } else if (flags & 0x400) {
            int half = (a3 + 1) / 2;
            int t = func_0207ff10(a0->field_4, a0->field_8, x, 0);
            r1 = a1 + (half - (t + 1) / 2);
        }
        func_02081708(a0, r1, a2, a4, x, &x);
        a2 += inc;
    } while (x != 0);
}
