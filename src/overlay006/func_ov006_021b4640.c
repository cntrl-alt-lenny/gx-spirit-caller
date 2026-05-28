/* func_ov006_021b4640: sibling of 021b2668 (family 1). */
struct F021b4640Pool { char pad[8]; int f8; };
extern struct F021b4640Pool data_ov006_0224f290;
extern void func_0202111c(void);
extern void func_0200ddc4(void);

int func_ov006_021b4640(void) {
    func_0202111c();
    if (data_ov006_0224f290.f8 != 0) {
        func_0200ddc4();
    }
    return 1;
}
