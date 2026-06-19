/* func_ov006_021b4c40: sibling of 021b2668 (family 1). */
struct F021b4d40Pool { char pad[8]; int f8; };
extern struct F021b4d40Pool data_ov006_0224f1c8;
extern void func_020210c8(void);
extern void func_0200dda8(void);

int func_ov006_021b4c40(void) {
    func_020210c8();
    if (data_ov006_0224f1c8.f8 != 0) {
        func_0200dda8();
    }
    return 1;
}
