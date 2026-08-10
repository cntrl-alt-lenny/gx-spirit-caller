/* func_0204c04c: 3 guards on func_020498f0()'s current fields (each a
 * fresh call, never cached -- matches the documented convention in
 * func_0205000c.legacy_sp3.c / func_02050118.legacy_sp3.c), then on
 * success gathers 5 more func_020498f0() pointers, computes a
 * halfword + word lookup, and dispatches to func_0204ead0. Final 2
 * calls clear the guard fields back to 0.
 */

extern char *func_020498f0(void);
extern int func_0204ead0(int a, int b, int c, int d, void *e, int f);

int func_0204c04c(void) {
    int result = 0;
    int local8 = 0;

    if (*(unsigned char *)(func_020498f0() + 0x17) == 0) goto exit;
    if (*(int *)(func_020498f0() + 0x20) == 0) goto exit;

    {
        char *p1 = func_020498f0();
        char *p2 = func_020498f0();
        if (*(int *)(p1 + 0x20) == *(int *)(p2 + 0x200)) goto exit;
    }

    {
        char *p1 = func_020498f0();
        char *p2 = func_020498f0();
        char *p3 = func_020498f0();
        char *p4 = func_020498f0();
        char *p5 = func_020498f0();
        int idx1 = *(unsigned char *)(p5 + 0xd) + 1;
        int idx2 = *(unsigned char *)(p3 + 0xd) + 1;
        unsigned short v1 = *(unsigned short *)(p4 + (idx1 << 1) + 0xa4);
        int v2 = *(int *)(p2 + (idx2 << 2) + 0x24);
        result = func_0204ead0(0xc, *(int *)(p1 + 0x20), v2, v1, &local8, 1);
    }

    *(unsigned char *)(func_020498f0() + 0x17) = 0;
    *(int *)(func_020498f0() + 0x20) = 0;

exit:
    return result;
}
