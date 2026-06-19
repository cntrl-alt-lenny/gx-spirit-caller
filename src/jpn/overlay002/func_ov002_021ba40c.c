/* func_ov002_021ba40c: query func_ov002_021ba2ac into a local; if it found
 * something, hand the local to func_ov002_021c3674, else return 0. */
extern int func_ov002_021ba2ac(int a, int b, int *out);
extern int func_ov002_021c3674(int a, int *out);
int func_ov002_021ba40c(int arg0) {
    int local;
    int r = func_ov002_021ba2ac(arg0, 0, &local);
    if (r == 0)
        return r;
    return func_ov002_021c3674(arg0, &local);
}
