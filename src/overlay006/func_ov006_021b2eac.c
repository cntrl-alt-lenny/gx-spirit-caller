/* func_ov006_021b2eac: per-state "audio init" (channel-gated) — open the per-
 * state sound bank, program the active channel (low 3 bits of the global mode
 * word) into the two mixer stages, pick the master-volume path by whether the
 * channel is live, bind the wave archive, route the channel, prime the per-state
 * handle, fire the deferred-start request, then mark the state word ready (=2).
 * Returns 1. 0xc4 audio-init family (branch variant of the 0xa4; ov006_core.h). */
extern void func_0202adf8(void *);
extern void func_0202ae1c(int);
extern void func_0202c070(int);
extern void func_020018d4(int);
extern void func_02001b18(int);
extern void func_0200197c(int, void *, int);
extern void func_02001d68(int);
extern void func_ov006_021b6364(void *);
extern void func_020373cc(int, int, int, int);
extern char data_ov006_0224f1c0[];
extern char data_ov006_021cf1b0[];
extern char data_ov006_0224f448[];
extern int  data_ov006_0224f1b0[];
extern struct { int w0; unsigned chan : 3; } data_02104f4c;
int func_ov006_021b2eac(void) {
    func_0202adf8(data_ov006_0224f1c0);
    func_0202ae1c(data_02104f4c.chan);
    func_0202c070(data_02104f4c.chan);
    if (data_02104f4c.chan == 0)
        func_020018d4(0xa0);
    else
        func_02001b18(0xa2);
    func_0200197c(4, data_ov006_021cf1b0, 0x80000);
    func_02001d68(data_02104f4c.chan);
    func_ov006_021b6364(data_ov006_0224f448);
    func_020373cc(0x24, 1, 0, -1);
    data_ov006_0224f1b0[0] = 2;
    return 1;
}
