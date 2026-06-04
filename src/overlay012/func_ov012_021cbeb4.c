/* func_ov012_021cbeb4: bring the overlay's graphics up. Resets the core
 * (func_020058b4 / func_ov000_021aae70 / func_ov012_021ca340), hands two banks
 * (data_ov012_021cc6a0[0x190] / [0x524]) to the VRAM mapper, then installs the
 * four cell transfers (func_0201ef3c) for the e8/ec/f0/bc surfaces and powers
 * the two engines (func_02005c60 1 & 2). (ov012_core.h) */
extern void func_020058b4(void);
extern void func_ov000_021aae70(void);
extern void func_ov012_021ca340(void);
extern void func_ov000_021b3810_unk(int);
extern void func_ov000_021aaec4(void *);
extern void func_0201ef3c(int, void *, void *);
extern void func_0202c1ac(void);
extern void func_02005c60(int);
extern char data_ov012_021cc6a0[];
extern char data_ov012_021cc86c[];
extern char data_ov012_021cc7a0[];
extern char data_ov012_021cc7f4[];
extern char data_ov012_021cc7c8[];
extern char data_ov012_021cc7fc[];
extern char data_ov012_021cc7d4[];
extern char data_ov012_021cc804[];
extern char data_ov012_021cc764[];
extern char data_ov012_021cc780[];
void func_ov012_021cbeb4(void) {
    func_020058b4();
    func_ov000_021aae70();
    func_ov012_021ca340();
    func_ov000_021b3810_unk(*(int *)(data_ov012_021cc6a0 + 0x190));
    func_ov000_021b3810_unk(*(int *)(data_ov012_021cc6a0 + 0x524));
    func_ov000_021aaec4(data_ov012_021cc86c);
    func_0201ef3c(*(int *)(data_ov012_021cc6a0 + 0xe8), data_ov012_021cc7a0, data_ov012_021cc7f4);
    func_0201ef3c(*(int *)(data_ov012_021cc6a0 + 0xec), data_ov012_021cc7c8, data_ov012_021cc7fc);
    func_0201ef3c(*(int *)(data_ov012_021cc6a0 + 0xf0), data_ov012_021cc7d4, data_ov012_021cc804);
    func_0201ef3c(*(int *)(data_ov012_021cc6a0 + 0xbc), data_ov012_021cc764, data_ov012_021cc780);
    func_0202c1ac();
    func_02005c60(1);
    func_02005c60(2);
}
