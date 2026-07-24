void func_0208541c(char *r0, int r1, int r2) {
    char *lr = r0 + *(int *)(r0 + 0x8);
    int idx1 = *(unsigned short *)(lr + 0xa);
    char *ip = lr + 4;
    int idx2 = *(unsigned short *)(ip + idx1);
    char *e = ip + idx1 + idx2 * r1;
    char *t = lr + *(int *)(e + 4);
    unsigned int v = *(unsigned int *)(t + 0xc);

    v = (v & ~0xc0) | (r2 << 6);
    *(unsigned int *)(t + 0xc) = v;
}
