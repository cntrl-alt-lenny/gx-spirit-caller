/* func_ov006_021b3964: per-state "audio init" — open the per-state sound bank,
 * program the active channel (low 3 bits of the global mode word) into the three
 * mixer stages, set master volume, bind the wave archive, prime the per-state
 * handle, fire the deferred-start request, then mark the state word ready (=2).
 * Returns 1. 0xa4 audio-init family (ov006_core.h). */
extern void func_0202ada4(void *);
extern void func_0202adc8(int);
extern void func_0202c01c(int);
extern void func_020018b4(int);
extern void func_0200195c(int, void *, int);
extern void func_02001d48(int);
extern void func_ov006_021b65c4(void *);
extern void func_0203737c(int, int, int, int);
extern char data_ov006_0224f134[];
extern char data_ov006_021cf090[];
extern char data_ov006_0224f328[];
extern int  data_ov006_0224f128[];
extern struct { int w0; unsigned chan : 3; } data_02104e6c;
int func_ov006_021b3964(void) {
    func_0202ada4(data_ov006_0224f134);
    func_0202adc8(data_02104e6c.chan);
    func_0202c01c(data_02104e6c.chan);
    func_020018b4(0xa0);
    func_0200195c(4, data_ov006_021cf090, 0x80000);
    func_02001d48(data_02104e6c.chan);
    func_ov006_021b65c4(data_ov006_0224f328);
    func_0203737c(0x24, 1, 0, -1);
    data_ov006_0224f128[0] = 2;
    return 1;
}
