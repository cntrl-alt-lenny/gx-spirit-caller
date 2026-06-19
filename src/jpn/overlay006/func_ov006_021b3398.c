/* func_ov006_021b3398: per-state "audio init" (channel-gated) — open the per-
 * state sound bank, program the active channel (low 3 bits of the global mode
 * word) into the two mixer stages, pick the master-volume path by whether the
 * channel is live, bind the wave archive, route the channel, prime the per-state
 * handle, fire the deferred-start request, then mark the state word ready (=2).
 * Returns 1. 0xc4 audio-init family (branch variant of the 0xa4; ov006_core.h). */
extern void func_0202ada4(void *);
extern void func_0202adc8(int);
extern void func_0202c01c(int);
extern void func_020018b4(int);
extern void func_02001af8(int);
extern void func_0200195c(int, void *, int);
extern void func_02001d48(int);
extern void func_ov006_021b6408(void *);
extern void func_0203737c(int, int, int, int);
extern char data_ov006_0224f0ec[];
extern char data_ov006_021cf090[];
extern char data_ov006_0224f328[];
extern int  data_ov006_0224f0dc[];
extern struct { int w0; unsigned chan : 3; } data_02104e6c;
int func_ov006_021b3398(void) {
    func_0202ada4(data_ov006_0224f0ec);
    func_0202adc8(data_02104e6c.chan);
    func_0202c01c(data_02104e6c.chan);
    if (data_02104e6c.chan == 0)
        func_020018b4(0xa0);
    else
        func_02001af8(0xa2);
    func_0200195c(4, data_ov006_021cf090, 0x80000);
    func_02001d48(data_02104e6c.chan);
    func_ov006_021b6408(data_ov006_0224f328);
    func_0203737c(0x24, 1, 0, -1);
    data_ov006_0224f0dc[0] = 2;
    return 1;
}
