/* func_ov021_021aa820: sibling of ov006_021b2668 (family 1). */
struct F021aa820Pool { char pad[8]; int f8; };
extern struct F021aa820Pool data_ov021_021ace80;
extern void func_0202111c(void);
extern void func_0200ddc4(void);

int func_ov021_021aa820(void) {
    func_0202111c();
    if (data_ov021_021ace80.f8 != 0) {
        func_0200ddc4();
    }
    return 1;
}
