/* Audio_Init: audio init — bind the wave archive, route the active
 * channel (low 3 bits of the global mode word) through the three mixer stages,
 * clear the capture flag, and mark the state word ready (=2). Returns 1.
 * (ov021_core.h; ov005 audio-init recipe.) */
extern void func_0200197c(int, void *, int);
extern void func_02001d68(int);
extern void func_0202adf8(void *);
extern void func_0202ae1c(int);
extern void func_0202c070(int);
extern char data_ov021_021acec8[];
extern char data_ov021_021ace8c[];
extern char data_021040ac[];
extern int  data_ov021_021ace80[];
extern struct { int w0; unsigned chan : 3; } data_02104f4c;
int Audio_Init(void) {
    func_0200197c(4, data_ov021_021acec8, 0x80000);
    func_02001d68(data_02104f4c.chan);
    func_0202adf8(data_ov021_021ace8c);
    func_0202ae1c(data_02104f4c.chan);
    func_0202c070(data_02104f4c.chan);
    *(int *)(data_021040ac + 0x30) = 0;
    data_ov021_021ace80[0] = 2;
    return 1;
}
