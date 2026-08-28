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

extern T0225cbb8_021b28c0 data_ov006_0225ca98;
extern char data_ov006_0225df48;
extern T021cf140_021b28c0 data_ov006_021cf020;

extern void func_ov006_021c9de8(void *x);
extern void func_ov006_021c18d8(void *x);
extern void func_ov006_021b2520(void);

int func_ov006_021b27c0(void) {
    int sel;
    unsigned int val;
    sel = data_ov006_0225ca98.f50;
    val = data_ov006_0225ca98.f54;
    func_ov006_021c9de8(&data_ov006_0225df48);
    func_ov006_021c18d8(&data_ov006_0225ca98);
    func_ov006_021b2520();
    switch (sel) {
    case 1:
        data_ov006_021cf020.f0 = 8;
        break;
    case 2:
        data_ov006_021cf020.f14 = val;
        data_ov006_021cf020.f0 = 0xb;
        break;
    case 3:
        data_ov006_021cf020.f10 = (unsigned short)(val >> 16);
        data_ov006_021cf020.f14 = (unsigned short)val;
        data_ov006_021cf020.f0 = 0xe;
        break;
    case 0:
    default:
        data_ov006_021cf020.f0 = 2;
        break;
    }
    return 1;
}
