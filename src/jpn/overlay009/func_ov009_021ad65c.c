/* func_ov009_021ad65c: scene-exit teardown. Tears down both sub-objects
 * (021adc54 / 021adc00), runs the seven fixed shutdown calls, blanks both
 * engines' master brightness via func_0208c79c(reg, -0x10), then either kicks
 * the deferred-exit task (func_02007188) when data_02103fcc[0x24] is set —
 * returning 0 — or reports func_02000ef8's idle state. (ov009_core.h) */
extern void func_ov009_021ab7e8(void *);
extern void func_ov009_021ab244(void *);
extern void func_02021064(void);
extern void func_0200ad74(void);
extern void func_0202c158(void);
extern void func_0202aeec(void);
extern void func_02001b84(void);
extern void func_020068fc(void);
extern void func_0208c79c(int, int);
extern int func_02000ef8(void);
extern void func_02007188(int, int, void *);
extern void func_ov009_021aa3c0(void);
extern char data_02103fcc[];
extern char data_ov009_021adb74[];
extern char data_ov009_021adb20[];
int func_ov009_021ad65c(void) {
    func_ov009_021ab7e8(data_ov009_021adb74);
    func_ov009_021ab244(data_ov009_021adb20);
    func_02021064();
    func_0200ad74();
    func_0202c158();
    func_0202aeec();
    func_02001b84();
    func_020068fc();
    func_0208c79c(0x400006c, -0x10);
    func_0208c79c(0x400106c, -0x10);
    if (*(int *)(data_02103fcc + 0x24) != 0) {
        func_02007188(0x15, 0x15 - 0x16, func_ov009_021aa3c0);
        return 0;
    }
    return func_02000ef8() == 0;
}
