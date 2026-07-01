typedef struct {
    char pad0c[0x0c];
    unsigned int f_c;
    char pad1c[0x1c - 0x10];
    struct {
        unsigned int : 16;
        unsigned int w9 : 9;
        unsigned int : 7;
    } f_1c;
    struct {
        unsigned int : 9;
        unsigned int w9 : 9;
        unsigned int w4 : 4;
        unsigned int : 10;
    } f_20;
    char pad28[0x28 - 0x24];
    unsigned int f_28;
    unsigned int f_2c;
    unsigned int f_30;
} Obj02001ddc;

void func_02001dbc(Obj02001ddc *p, unsigned int a1, unsigned int a2,
                   unsigned int a3, unsigned int a4, unsigned int a5,
                   unsigned int a6) {
    p->f_28 = a1;
    p->f_1c.w9 = a3;
    p->f_c = a4;
    p->f_20.w9 = a4;
    p->f_2c = a2;
    p->f_20.w4 = a5;
    p->f_30 = a6;
}
