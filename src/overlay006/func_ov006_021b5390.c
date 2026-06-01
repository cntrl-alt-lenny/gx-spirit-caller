/* func_ov006_021b5390: per-state "enter" — kick the per-state full-init (arg 1),
 * hand the state struct's +0xc handle to the second subsystem, run the third
 * setup call, then advance the state word to 4. Returns 1. 0x44 enter family,
 * sibling of 021b46b8 (ov006_core.h). */
extern void func_ov006_021b50b0(int);
extern void func_ov006_021c5084(void *, int);
extern void func_ov006_021c6c00(void *);
extern int  data_ov006_0224f330[];
extern char data_ov006_0225dc34[];
extern char data_ov006_0225deb4[];
int func_ov006_021b5390(void) {
    func_ov006_021b50b0(1);
    func_ov006_021c5084(data_ov006_0225dc34, data_ov006_0224f330[3]);
    func_ov006_021c6c00(data_ov006_0225deb4);
    data_ov006_0224f330[0] = 4;
    return 1;
}
