/* func_ov002_022301c8: guard on func_ov002_0223de48(0,&local); split local
 * (via a 16-bit narrowing) into low/high bytes (a,b); if
 * func_ov002_02257564(ptr,a,b) succeeds, forward to func_ov002_021de8e4.
 * Always returns 0. */
extern int func_ov002_0223de48(void *ptr, int flag, void *outPtr);
extern int func_ov002_02257564(void *ptr, int a, int b);
extern void func_ov002_021de8e4(void *ptr, int a, int b);

int func_ov002_022301c8(void *ptr) {
    unsigned int local;

    if (func_ov002_0223de48(ptr, 0, &local) == 0)
        goto return_zero;

    {
        int a = (int)local & 0xff;
        int b = ((unsigned short)local >> 8) & 0xff;

        if (func_ov002_02257564(ptr, a, b) == 0)
            goto return_zero;

        func_ov002_021de8e4(ptr, a, b);
    }
return_zero:
    return 0;
}
