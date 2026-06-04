/* func_ov009_021ad6bc: per-frame step for the pair of sub-objects. Steps the
 * state machine (021ab910 on 021adc54) and poller (021ab32c on 021adc00),
 * runs the fixed pre/post update calls, programs the master-bright register
 * 0x4000540 = data_02103da0 | (data_020c3e48 << 1), and returns 1 only when
 * BOTH sub-steps reported done. (ov009_core.h) */
extern int func_ov009_021ab910(void *);
extern int func_ov009_021ab32c(void *);
extern void func_0202111c(void);
extern void func_0200ddc4(void);
extern void func_ov009_021ab9f8(void *);
extern void func_ov009_021ab374(void *);
extern void func_02021158(void);
extern void func_0200e9c4(void);
extern char data_020c3e48[];
extern char data_02103da0[];
extern char data_ov009_021adc54[];
extern char data_ov009_021adc00[];
int func_ov009_021ad6bc(void) {
    int a = func_ov009_021ab910(data_ov009_021adc54);
    int b = func_ov009_021ab32c(data_ov009_021adc00);
    func_0202111c();
    func_0200ddc4();
    func_ov009_021ab9f8(data_ov009_021adc54);
    func_ov009_021ab374(data_ov009_021adc00);
    func_02021158();
    func_0200e9c4();
    *(int *)0x4000540 = (*(int *)data_020c3e48 << 1) | *(int *)data_02103da0;
    return a != 0 && b != 0;
}
