/* func_0207e6e0: `p->f_14 += (int)p` — add base pointer to field. */

void func_0207e6e0(void *p) {
    *(int *)((char *)p + 0x14) += (int)p;
}
