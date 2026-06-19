/* func_ov021_021aa8dc: clear the subobject's 0x64-byte work area, zero its two
 * cursors (+0x38/+0x3c), then fire the deferred-start request. Returns 1.
 * (ov021_core.h) */
extern void Fill32(int, void *, int);
extern void func_0203737c(int, int, int, int);
extern char data_ov021_0222cdf4[];
int func_ov021_021aa8dc(void *o) {
    Fill32(0, data_ov021_0222cdf4, 0x64);
    *(int *)((char *)o + 0x38) = 0;
    *(int *)((char *)o + 0x3c) = 0;
    func_0203737c(0x26, 1, 0, -1);
    return 1;
}
