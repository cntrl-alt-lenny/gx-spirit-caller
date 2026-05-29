/* func_0209a9b8: StyleA dispatch -> r=helperA(.., cb, &out); if r return r;
 * tail func_0209b4a4(); return out. cb = func_0209b49c. */
extern void func_0209b49c(void);
extern void func_0209b4a4(void);
extern int func_0209a9f4(int a0, void (*cb)(void), int *out);
int func_0209a9b8(int a0) {
    int out;
    int r = func_0209a9f4(a0, func_0209b49c, &out);
    if (r != 0) return r;
    func_0209b4a4();
    return out;
}
