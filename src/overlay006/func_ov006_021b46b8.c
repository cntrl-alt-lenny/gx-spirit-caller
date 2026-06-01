/* func_ov006_021b46b8: per-state "enter" — kick the per-state full-init (arg 0),
 * hand the state struct's +0xc handle to the second subsystem, run the third
 * setup call, then advance the state word to 4. Returns 1. 0x44 enter family,
 * sibling of 021b5390 (ov006_core.h). */
extern void func_ov006_021b43d8(int);
extern void func_ov006_021c19a8(void *, int);
extern void func_ov006_021c9ed4(void *);
extern int  data_ov006_0224f290[];
extern char data_ov006_0225cbb8[];
extern char data_ov006_0225e068[];
int func_ov006_021b46b8(void) {
    func_ov006_021b43d8(0);
    func_ov006_021c19a8(data_ov006_0225cbb8, data_ov006_0224f290[3]);
    func_ov006_021c9ed4(data_ov006_0225e068);
    data_ov006_0224f290[0] = 4;
    return 1;
}
