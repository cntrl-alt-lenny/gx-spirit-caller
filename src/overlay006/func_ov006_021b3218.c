/* func_ov006_021b3218: sibling of 021b2668 (family 1). */
struct F021b3218Pool { char pad[8]; int f8; };
extern struct F021b3218Pool data_ov006_0224f1b0;
extern void func_0202111c(void);
extern void func_0200ddc4(void);

int func_ov006_021b3218(void) {
    func_0202111c();
    if (data_ov006_0224f1b0.f8 != 0) {
        func_0200ddc4();
    }
    return 1;
}
