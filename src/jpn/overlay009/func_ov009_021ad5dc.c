/* func_ov009_021ad5dc: per-frame step for the pair of sub-objects. Steps the
 * state machine (021ab910 on 021adc54) and poller (021ab32c on 021adc00),
 * runs the fixed pre/post update calls, programs the master-bright register
 * 0x4000540 = data_02103cc0 | (data_020c3d68 << 1), and returns 1 only when
 * BOTH sub-steps reported done. (ov009_core.h) */
extern int func_ov009_021ab830(void *);
extern int func_ov009_021ab24c(void *);
extern void func_020210c8(void);
extern void func_0200dda8(void);
extern void func_ov009_021ab918(void *);
extern void func_ov009_021ab294(void *);
extern void func_02021104(void);
extern void func_0200e9a8(void);
extern char data_020c3d68[];
extern char data_02103cc0[];
extern char data_ov009_021adb74[];
extern char data_ov009_021adb20[];
int func_ov009_021ad5dc(void) {
    int a = func_ov009_021ab830(data_ov009_021adb74);
    int b = func_ov009_021ab24c(data_ov009_021adb20);
    func_020210c8();
    func_0200dda8();
    func_ov009_021ab918(data_ov009_021adb74);
    func_ov009_021ab294(data_ov009_021adb20);
    func_02021104();
    func_0200e9a8();
    *(int *)0x4000540 = (*(int *)data_020c3d68 << 1) | *(int *)data_02103cc0;
    return a != 0 && b != 0;
}
