/* func_ov006_021b3da8: sibling of 021b2668 (family 1). */
struct F021b3da8Pool { char pad[8]; int f8; };
extern struct F021b3da8Pool data_ov006_0224f248;
extern void func_0202111c(void);
extern void func_0200ddc4(void);

int func_ov006_021b3da8(void) {
    func_0202111c();
    if (data_ov006_0224f248.f8 != 0) {
        func_0200ddc4();
    }
    return 1;
}
