/* func_ov006_021b5318: sibling of 021b2668 (family 1). */
struct F021b5318Pool { char pad[8]; int f8; };
extern struct F021b5318Pool data_ov006_0224f330;
extern void func_0202111c(void);
extern void func_0200ddc4(void);

int func_ov006_021b5318(void) {
    func_0202111c();
    if (data_ov006_0224f330.f8 != 0) {
        func_0200ddc4();
    }
    return 1;
}
