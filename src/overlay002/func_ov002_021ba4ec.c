/* func_ov002_021ba4ec: query func_ov002_021ba38c into a local; if it found
 * something, hand the local to func_ov002_021c3754, else return 0. */
extern int func_ov002_021ba38c(int a, int b, int *out);
extern int func_ov002_021c3754(int a, int *out);
int func_ov002_021ba4ec(int arg0) {
    int local;
    int r = func_ov002_021ba38c(arg0, 0, &local);
    if (r == 0)
        return r;
    return func_ov002_021c3754(arg0, &local);
}
