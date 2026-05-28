/* func_ov006_021b596c: sibling of 021b2668 (family 1). */
struct F021b596cPool { char pad[8]; int f8; };
extern struct F021b596cPool data_ov006_0224f38c;
extern void func_0202111c(void);
extern void func_0200ddc4(void);

int func_ov006_021b596c(void) {
    func_0202111c();
    if (data_ov006_0224f38c.f8 != 0) {
        func_0200ddc4();
    }
    return 1;
}
