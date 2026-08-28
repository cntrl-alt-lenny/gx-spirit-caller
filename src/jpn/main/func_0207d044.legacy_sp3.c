extern void func_0207d0a4(void);

void func_0207d044(char *r0, char *r1) {
    unsigned short off;
    char *oldTail;

    if (*(int *)r0 == 0) {
        func_0207d0a4();
        return;
    }

    off = *(unsigned short *)(r0 + 0xa);
    oldTail = *(char **)(r0 + 0x4);
    *(int *)(r1 + off) = (int)oldTail;
    *(int *)(r1 + off + 4) = 0;

    off = *(unsigned short *)(r0 + 0xa);
    oldTail = *(char **)(r0 + 0x4);
    *(int *)(oldTail + off + 4) = (int)r1;

    *(int *)(r0 + 4) = (int)r1;

    *(unsigned short *)(r0 + 0x8) += 1;
}
