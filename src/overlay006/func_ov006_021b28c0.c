typedef struct {
    char _pad[0x50];
    int f50;
    int f54;
} T0225cbb8_021b28c0;

typedef struct {
    int f0;
    char _pad4[0xc];
    int f10;
    int f14;
} T021cf140_021b28c0;

extern T0225cbb8_021b28c0 data_ov006_0225cbb8;
extern char data_ov006_0225e068;
extern T021cf140_021b28c0 data_ov006_021cf140;

extern void func_ov006_021c9ef4(void *x);
extern void func_ov006_021c19e4(void *x);
extern void func_ov006_021b2620(void);

int func_ov006_021b28c0(void) {
    int sel;
    unsigned int val;
    sel = data_ov006_0225cbb8.f50;
    val = data_ov006_0225cbb8.f54;
    func_ov006_021c9ef4(&data_ov006_0225e068);
    func_ov006_021c19e4(&data_ov006_0225cbb8);
    func_ov006_021b2620();
    switch (sel) {
    case 1:
        data_ov006_021cf140.f0 = 8;
        break;
    case 2:
        data_ov006_021cf140.f14 = val;
        data_ov006_021cf140.f0 = 0xb;
        break;
    case 3:
        data_ov006_021cf140.f10 = (unsigned short)(val >> 16);
        data_ov006_021cf140.f14 = (unsigned short)val;
        data_ov006_021cf140.f0 = 0xe;
        break;
    case 0:
    default:
        data_ov006_021cf140.f0 = 2;
        break;
    }
    return 1;
}
