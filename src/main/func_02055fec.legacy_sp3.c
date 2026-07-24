extern int func_020560a8(void *, int);

int func_02055fec(void **a0) {
    void *inner;

    if (a0 == 0 || (inner = *a0) == 0) {
        return 2;
    }
    if (*(int *)((char *)inner + 0x108) != 0) {
        return 0;
    }
    return func_020560a8(a0, 0);
}
