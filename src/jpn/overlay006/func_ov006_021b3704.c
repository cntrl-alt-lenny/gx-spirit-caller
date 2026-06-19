/* func_ov006_021b3704: sibling of 021b2668 (family 1). */
struct F021b3804Pool { char pad[8]; int f8; };
extern struct F021b3804Pool data_ov006_0224f0dc;
extern void func_020210c8(void);
extern void func_0200dda8(void);

int func_ov006_021b3704(void) {
    func_020210c8();
    if (data_ov006_0224f0dc.f8 != 0) {
        func_0200dda8();
    }
    return 1;
}
