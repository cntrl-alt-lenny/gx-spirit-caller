/* func_ov002_02222fc0: guard on func_ov002_0223de48(0,0); split the u16
 * from func_ov002_0223dda4(ptr,0) into low/high bytes (a,b); if
 * func_ov002_02257564(ptr,a,b) succeeds, fire func_ov002_021d93bc with the
 * halfword at *ptr. Always returns 0. */
extern int func_ov002_0223de48(void *ptr, int a, int b);
extern unsigned short func_ov002_0223dda4(void *node, int idx);
extern int func_ov002_02257564(void *ptr, int a, int b);
extern void func_ov002_021d93bc(int a, int b, int c, unsigned short id);

int func_ov002_02222fc0(void *ptr) {
    if (func_ov002_0223de48(ptr, 0, 0) == 0)
        goto return_zero;

    {
        unsigned int packed = func_ov002_0223dda4(ptr, 0);
        int a = packed & 0xff;
        int b = ((unsigned short)packed >> 8) & 0xff;

        if (func_ov002_02257564(ptr, a, b) == 0)
            goto return_zero;

        func_ov002_021d93bc(a, b, 1, *(unsigned short *)ptr);
    }
return_zero:
    return 0;
}
