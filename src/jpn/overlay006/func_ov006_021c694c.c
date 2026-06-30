extern char data_020fb760[];
extern int  func_02021174(void *);
extern void func_02021278(void);
extern void func_02021428(void);
extern void func_02022228(int a, void *p);
extern void func_0202c8f4(int a, int b);
extern void func_0202c96c(int a);
extern int  func_ov006_021c6a28(void *p, int a, int b);

struct Ov006Obj694c {
    int  f_0, f_4, f_8;
    char pad_c[0x14 - 0xc];
    int  f_14;
    char pad18[0x18 - 0x18];
    int  f_18;
};

int func_ov006_021c694c(struct Ov006Obj694c *obj, int arg1) {
    obj->f_8 = arg1;
    obj->f_14 = 1;
    if (obj->f_8 != 0) {
        volatile unsigned short *reg = (volatile unsigned short *)0x0400000c;
        reg[0] = reg[0] & ~3;
        reg[0] = (reg[0] & 0x43) | 0xe00;
        reg[1] = reg[1] & ~3;
        reg[1] = (reg[1] & 0x43) | 0xf00;
        if (obj->f_0 == 0) {
            obj->f_0 = func_02021174(data_020fb760);
            func_02021428();
            func_ov006_021c6a28(obj, obj->f_4, 1);
        }
        func_02022228(0x29, &obj->f_18);
        func_0202c8f4(2, 3);
    } else if (obj->f_0 != 0) {
        func_02021278();
        obj->f_0 = 0;
    }
    func_0202c96c(obj->f_8);
    return 1;
}
