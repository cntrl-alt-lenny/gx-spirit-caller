/* func_ov012_021cbdd4: bring the overlay's graphics up. Resets the core
 * (func_02005898 / func_ov000_021aad90 / func_ov012_021ca260), hands two banks
 * (data_ov012_021cc5c0[0x190] / [0x524]) to the VRAM mapper, then installs the
 * four cell transfers (func_0201eee8) for the e8/ec/f0/bc surfaces and powers
 * the two engines (func_02005c44 1 & 2). (ov012_core.h) */
extern void func_02005898(void);
extern void func_ov000_021aad90(void);
extern void func_ov012_021ca260(void);
extern void func_ov000_021b3724_unk(int);
extern void func_ov000_021aade4(void *);
extern void func_0201eee8(int, void *, void *);
extern void func_0202c158(void);
extern void func_02005c44(int);
extern char data_ov012_021cc5c0[];
extern char data_ov012_021cc78c[];
extern char data_ov012_021cc6c0[];
extern char data_ov012_021cc714[];
extern char data_ov012_021cc6e8[];
extern char data_ov012_021cc71c[];
extern char data_ov012_021cc6f4[];
extern char data_ov012_021cc724[];
extern char data_ov012_021cc684[];
extern char data_ov012_021cc6a0[];
void func_ov012_021cbdd4(void) {
    func_02005898();
    func_ov000_021aad90();
    func_ov012_021ca260();
    func_ov000_021b3724_unk(*(int *)(data_ov012_021cc5c0 + 0x190));
    func_ov000_021b3724_unk(*(int *)(data_ov012_021cc5c0 + 0x524));
    func_ov000_021aade4(data_ov012_021cc78c);
    func_0201eee8(*(int *)(data_ov012_021cc5c0 + 0xe8), data_ov012_021cc6c0, data_ov012_021cc714);
    func_0201eee8(*(int *)(data_ov012_021cc5c0 + 0xec), data_ov012_021cc6e8, data_ov012_021cc71c);
    func_0201eee8(*(int *)(data_ov012_021cc5c0 + 0xf0), data_ov012_021cc6f4, data_ov012_021cc724);
    func_0201eee8(*(int *)(data_ov012_021cc5c0 + 0xbc), data_ov012_021cc684, data_ov012_021cc6a0);
    func_0202c158();
    func_02005c44(1);
    func_02005c44(2);
}
