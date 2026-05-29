/* func_0209af48: StyleA dispatch -> r=helperA(.., cb, &out); if r return r;
 * tail func_0209b4a4(); return out. cb = func_0209b49c. */
extern void func_0209b49c(void);
extern void func_0209b4a4(void);
extern int func_0209af84(int a0, int a1, void (*cb)(void), int *out);
int func_0209af48(int a0, int a1) {
    int out;
    int r = func_0209af84(a0, a1, func_0209b49c, &out);
    if (r != 0) return r;
    func_0209b4a4();
    return out;
}
