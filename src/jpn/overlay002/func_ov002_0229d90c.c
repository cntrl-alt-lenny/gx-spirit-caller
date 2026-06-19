/* func_ov002_0229d90c: route arg1 around the self->unkA8 boundary (an 8-wide
 * gap) into 0229d890. */
extern void func_ov002_0229d780(void *self, int idx, int arg);

int func_ov002_0229d90c(void *self, int arg1) {
    int n = *(int *)((char *)self + 0xA8);
    if (arg1 < n) {
        func_ov002_0229d780(self, arg1, 0);
        return 1;
    }
    if (arg1 < n + 8)
        return 0;
    func_ov002_0229d780(self, arg1 - 7, 0);
    return 1;
}
