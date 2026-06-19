/* func_ov021_021aa434: audio init — bind the wave archive, route the active
 * channel (low 3 bits of the global mode word) through the three mixer stages,
 * clear the capture flag, and mark the state word ready (=2). Returns 1.
 * (ov021_core.h; ov005 audio-init recipe.) */
extern void func_0200195c(int, void *, int);
extern void func_02001d48(int);
extern void func_0202ada4(void *);
extern void func_0202adc8(int);
extern void func_0202c01c(int);
extern char data_ov021_021acde8[];
extern char data_ov021_021acdac[];
extern char data_02103fcc[];
extern int  data_ov021_021acda0[];
extern struct { int w0; unsigned chan : 3; } data_02104e6c;
int func_ov021_021aa434(void) {
    func_0200195c(4, data_ov021_021acde8, 0x80000);
    func_02001d48(data_02104e6c.chan);
    func_0202ada4(data_ov021_021acdac);
    func_0202adc8(data_02104e6c.chan);
    func_0202c01c(data_02104e6c.chan);
    *(int *)(data_02103fcc + 0x30) = 0;
    data_ov021_021acda0[0] = 2;
    return 1;
}
