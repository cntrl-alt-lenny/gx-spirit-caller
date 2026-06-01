/* func_ov006_021b49fc: per-state "audio init" — open the per-state sound bank,
 * program the active channel (low 3 bits of the global mode word) into the three
 * mixer stages, set master volume, bind the wave archive, prime the per-state
 * handle, fire the deferred-start request, then mark the state word ready (=2).
 * Returns 1. 0xa4 audio-init family (ov006_core.h). */
extern void func_0202adf8(void *);
extern void func_0202ae1c(int);
extern void func_0202c070(int);
extern void func_020018d4(int);
extern void func_0200197c(int, void *, int);
extern void func_02001d68(int);
extern void func_ov006_021b6898(void *);
extern void func_020373cc(int, int, int, int);
extern char data_ov006_0224f2f4[];
extern char data_ov006_021cf1b0[];
extern char data_ov006_0224f448[];
extern int  data_ov006_0224f2e8[];
extern struct { int w0; unsigned chan : 3; } data_02104f4c;
int func_ov006_021b49fc(void) {
    func_0202adf8(data_ov006_0224f2f4);
    func_0202ae1c(data_02104f4c.chan);
    func_0202c070(data_02104f4c.chan);
    func_020018d4(0xa0);
    func_0200197c(4, data_ov006_021cf1b0, 0x80000);
    func_02001d68(data_02104f4c.chan);
    func_ov006_021b6898(data_ov006_0224f448);
    func_020373cc(0x24, 1, 0, -1);
    data_ov006_0224f2e8[0] = 2;
    return 1;
}
