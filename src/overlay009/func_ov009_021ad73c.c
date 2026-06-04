/* func_ov009_021ad73c: scene-exit teardown. Tears down both sub-objects
 * (021adc54 / 021adc00), runs the seven fixed shutdown calls, blanks both
 * engines' master brightness via func_0208c884(reg, -0x10), then either kicks
 * the deferred-exit task (func_020071a4) when data_021040ac[0x24] is set —
 * returning 0 — or reports func_02000ef8's idle state. (ov009_core.h) */
extern void func_ov009_021ab8c8(void *);
extern void func_ov009_021ab324(void *);
extern void func_020210b8(void);
extern void func_0200ad90(void);
extern void func_0202c1ac(void);
extern void func_0202af40(void);
extern void func_02001ba4(void);
extern void func_02006918(void);
extern void func_0208c884(int, int);
extern int func_02000ef8(void);
extern void func_020071a4(int, int, void *);
extern void func_ov009_021aa4a0(void);
extern char data_021040ac[];
extern char data_ov009_021adc54[];
extern char data_ov009_021adc00[];
int func_ov009_021ad73c(void) {
    func_ov009_021ab8c8(data_ov009_021adc54);
    func_ov009_021ab324(data_ov009_021adc00);
    func_020210b8();
    func_0200ad90();
    func_0202c1ac();
    func_0202af40();
    func_02001ba4();
    func_02006918();
    func_0208c884(0x400006c, -0x10);
    func_0208c884(0x400106c, -0x10);
    if (*(int *)(data_021040ac + 0x24) != 0) {
        func_020071a4(0x15, 0x15 - 0x16, func_ov009_021aa4a0);
        return 0;
    }
    return func_02000ef8() == 0;
}
