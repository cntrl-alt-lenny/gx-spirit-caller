/* func_02063c1c: thunk — pass `(a->u16_c, b->u16_c)` to func_0206440c. */

extern int func_0206440c(unsigned int a, unsigned int b);

int func_02063c1c(void *a, void *b) {
    unsigned int va = *(unsigned short *)((char *)a + 0xc);
    unsigned int vb = *(unsigned short *)((char *)b + 0xc);
    return func_0206440c(va, vb);
}
