/* func_02063c90: thunk — pass `(a->u16_c, b->u16_c)` to func_02064480. */

extern int func_02064480(unsigned int a, unsigned int b);

int func_02063c90(void *a, void *b) {
    unsigned int va = *(unsigned short *)((char *)a + 0xc);
    unsigned int vb = *(unsigned short *)((char *)b + 0xc);
    return func_02064480(va, vb);
}
