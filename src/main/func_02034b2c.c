typedef struct {
    char _pad_00[0x12];
    unsigned short field_12;
    char _pad_14[0x1c];
    int field_30;
    char _pad_34[0x1c];
    void *field_50;
} data_0219b2e0_t;

extern data_0219b2e0_t data_0219b2e0;
extern int data_0219b36c;
extern int data_0219b384;
extern int data_0219b490;
extern int data_0219d088;

extern void func_02036590(void *addr, int val);
extern void func_020378c8(int a, int b);
extern void func_020871ac(void);
extern void func_020379ec(void);
extern void func_020379c4(int);
extern void func_02088e6c(void);
extern int func_02088d7c(void);
extern void func_02088d8c(void);
extern void func_02089920(void *);
extern void func_02091b5c(void *);
extern void func_02092748(void *);
extern void func_020927b8(void *);
extern void func_0207d4d0(void *);

void func_02034b2c(void) {
    func_02036590((void *)0x08f00004, 0);
    func_020378c8(-1, 0);
    func_020871ac();
    func_020379ec();
    func_020379c4(0);
    func_02088e6c();
    func_020927b8(&data_0219b36c);
    func_02091b5c(&data_0219d088);
    func_02092748(&data_0219b36c);
    func_020927b8(&data_0219b384);
    func_02091b5c(&data_0219b490);
    func_02092748(&data_0219b384);
    while (func_02088d7c() != 0) {
    }
    func_02088d8c();
    data_0219b2e0.field_12 = 0;
    func_0207d4d0(data_0219b2e0.field_50);
    func_02089920((void *)data_0219b2e0.field_30);
}
