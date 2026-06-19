/* func_ov006_021b45b8: per-state "enter" — kick the per-state full-init (arg 0),
 * hand the state struct's +0xc handle to the second subsystem, run the third
 * setup call, then advance the state word to 4. Returns 1. 0x44 enter family,
 * sibling of 021b5390 (ov006_core.h). */
extern void func_ov006_021b42d8(int);
extern void func_ov006_021c189c(void *, int);
extern void func_ov006_021c9dc8(void *);
extern int  data_ov006_0224f170[];
extern char data_ov006_0225ca98[];
extern char data_ov006_0225df48[];
int func_ov006_021b45b8(void) {
    func_ov006_021b42d8(0);
    func_ov006_021c189c(data_ov006_0225ca98, data_ov006_0224f170[3]);
    func_ov006_021c9dc8(data_ov006_0225df48);
    data_ov006_0224f170[0] = 4;
    return 1;
}
