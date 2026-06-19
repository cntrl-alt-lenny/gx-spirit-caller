/* func_ov006_021b5290: per-state "enter" — kick the per-state full-init (arg 1),
 * hand the state struct's +0xc handle to the second subsystem, run the third
 * setup call, then advance the state word to 4. Returns 1. 0x44 enter family,
 * sibling of 021b46b8 (ov006_core.h). */
extern void func_ov006_021b4fb0(int);
extern void func_ov006_021c4f78(void *, int);
extern void func_ov006_021c6af4(void *);
extern int  data_ov006_0224f210[];
extern char data_ov006_0225db14[];
extern char data_ov006_0225dd94[];
int func_ov006_021b5290(void) {
    func_ov006_021b4fb0(1);
    func_ov006_021c4f78(data_ov006_0225db14, data_ov006_0224f210[3]);
    func_ov006_021c6af4(data_ov006_0225dd94);
    data_ov006_0224f210[0] = 4;
    return 1;
}
