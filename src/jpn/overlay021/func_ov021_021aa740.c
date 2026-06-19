/* func_ov021_021aa740: sibling of ov006_021b2668 (family 1). */
struct F021aa820Pool { char pad[8]; int f8; };
extern struct F021aa820Pool data_ov021_021acda0;
extern void func_020210c8(void);
extern void func_0200dda8(void);

int func_ov021_021aa740(void) {
    func_020210c8();
    if (data_ov021_021acda0.f8 != 0) {
        func_0200dda8();
    }
    return 1;
}
