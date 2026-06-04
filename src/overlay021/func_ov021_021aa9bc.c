/* func_ov021_021aa9bc: clear the subobject's 0x64-byte work area, zero its two
 * cursors (+0x38/+0x3c), then fire the deferred-start request. Returns 1.
 * (ov021_core.h) */
extern void Fill32(int, void *, int);
extern void func_020373cc(int, int, int, int);
extern char data_ov021_0222ced4[];
int func_ov021_021aa9bc(void *o) {
    Fill32(0, data_ov021_0222ced4, 0x64);
    *(int *)((char *)o + 0x38) = 0;
    *(int *)((char *)o + 0x3c) = 0;
    func_020373cc(0x26, 1, 0, -1);
    return 1;
}
