/* func_ov023_021b2280: init a resource via func_0202adf8, notify two
 * subsystems with a bitfield extracted from data_02104f4c.field_4
 * (func_0202ae1c takes it; func_0202c070's own body ignores its
 * argument, but the call site recomputes the same value right before
 * calling it -- pass it explicitly to reproduce that), clear a small
 * buffer via func_020945f4, then arm it via func_ov005_021ad018.
 * Always returns 1.
 */

extern void func_0202adf8(void *a0);
extern void func_0202ae1c(int mode);
extern void func_0202c070(int unused);
extern void func_020945f4(void *p, int z, int n);
extern int func_ov005_021ad018(void *a, int b);

extern char data_ov023_021b23a8[];
extern struct {
    char _pad4[4];
    unsigned int mode : 3;
} data_02104f4c;
extern char data_02105989[];

int func_ov023_021b2280(void) {
    func_0202adf8(data_ov023_021b23a8);
    func_0202ae1c(data_02104f4c.mode);
    func_0202c070(data_02104f4c.mode);
    func_020945f4(data_02105989, 0, 0x14);
    func_ov005_021ad018(data_02105989, 4);
    return 1;
}
