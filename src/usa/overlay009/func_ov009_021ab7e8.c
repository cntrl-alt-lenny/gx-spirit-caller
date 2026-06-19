/* func_ov009_021ab7e8: tear down one entry. If its live flag (o[0x10]) is set,
 * commit the pending transform via func_0201eee8(o[0x4], &o[0xc], &o[0x10]) and
 * clear the flag pair; then release the handle at o[0x2c] if present. Returns 1.
 * (ov009_core.h) */
extern void func_0201eee8(int, void *, void *);
extern void func_02021278(void);
int func_ov009_021ab7e8(int *o) {
    if (o[4] != 0) {
        func_0201eee8(o[1], &o[3], &o[4]);
        o[5] = 0;
        o[4] = 0;
    }
    if (o[11] != 0)
        func_02021278();
    return 1;
}
