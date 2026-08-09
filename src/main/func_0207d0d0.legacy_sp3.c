extern void func_0207d18c(void);

void func_0207d0d0(char *r0, char *r1) {
    unsigned short off;
    char *oldHead;

    if (*(int *)r0 == 0) {
        func_0207d18c();
        return;
    }

    off = *(unsigned short *)(r0 + 0xa);
    *(int *)(r1 + off) = 0;
    *(int *)(r1 + off + 4) = *(int *)r0;

    off = *(unsigned short *)(r0 + 0xa);
    oldHead = *(char **)r0;
    *(int *)(oldHead + off) = (int)r1;

    *(int *)r0 = (int)r1;

    *(unsigned short *)(r0 + 0x8) += 1;
}
