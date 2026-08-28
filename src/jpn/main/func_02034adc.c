typedef struct {
    char _pad_00[0x12];
    unsigned short field_12;
    char _pad_14[0x1c];
    int field_30;
    char _pad_34[0x1c];
    void *field_50;
} data_0219b2e0_t;

extern data_0219b2e0_t data_0219b200;
extern int data_0219b28c;
extern int data_0219b2a4;
extern int data_0219b3b0;
extern int data_0219cfa8;

extern void func_02036540(void *addr, int val);
extern void func_02037878(int a, int b);
extern void func_020870c4(void);
extern void func_0203799c(void);
extern void func_02037974(int);
extern void func_02088d84(void);
extern int func_02088c94(void);
extern void func_02088ca4(void);
extern void func_02089838(void *);
extern void func_02091a74(void *);
extern void func_02092660(void *);
extern void func_020926d0(void *);
extern void func_0207d3e8(void *);

void func_02034adc(void) {
    func_02036540((void *)0x08f00004, 0);
    func_02037878(-1, 0);
    func_020870c4();
    func_0203799c();
    func_02037974(0);
    func_02088d84();
    func_020926d0(&data_0219b28c);
    func_02091a74(&data_0219cfa8);
    func_02092660(&data_0219b28c);
    func_020926d0(&data_0219b2a4);
    func_02091a74(&data_0219b3b0);
    func_02092660(&data_0219b2a4);
    while (func_02088c94() != 0) {
    }
    func_02088ca4();
    data_0219b200.field_12 = 0;
    func_0207d3e8(data_0219b200.field_50);
    func_02089838((void *)data_0219b200.field_30);
}
