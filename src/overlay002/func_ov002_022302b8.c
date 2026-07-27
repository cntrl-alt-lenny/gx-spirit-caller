/* func_ov002_022302b8: guard on func_ov002_0223df38(0,&local); split local
 * (via a 16-bit narrowing) into low/high bytes (a,b); if
 * func_ov002_0225764c(ptr,a,b) succeeds, forward to func_ov002_021de9d4.
 * Always returns 0. */
extern int func_ov002_0223df38(void *ptr, int flag, void *outPtr);
extern int func_ov002_0225764c(void *ptr, int a, int b);
extern void func_ov002_021de9d4(void *ptr, int a, int b);

int func_ov002_022302b8(void *ptr) {
    unsigned int local;

    if (func_ov002_0223df38(ptr, 0, &local) == 0)
        goto return_zero;

    {
        int a = (int)local & 0xff;
        int b = ((unsigned short)local >> 8) & 0xff;

        if (func_ov002_0225764c(ptr, a, b) == 0)
            goto return_zero;

        func_ov002_021de9d4(ptr, a, b);
    }
return_zero:
    return 0;
}
