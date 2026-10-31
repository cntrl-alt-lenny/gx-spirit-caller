struct S0203eefc_A0 {
    unsigned char pad[0xd0d];
    unsigned char f_d0d;
    unsigned char pad_d0e[5];
    unsigned char f_d13;
};
extern unsigned int func_0203c888(void);
extern void *func_0203c900(int sel);
extern int func_0207b5f8(void);
extern int func_0203f030(void *a0);
extern int func_0203efa0(char *self);
extern int func_0203ef68(void);
extern int func_0203eefc(struct S0203eefc_A0 *a0);
extern int func_0203eee0(unsigned char *p);
extern int func_0203ee94(void);
extern void func_02043250(void);
extern void func_020432d0(void);

unsigned int func_0203f094(void) {
    unsigned int state = func_0203c888();
    void *obj = func_0203c900(0x10);
    if (func_0207b5f8() == 9) {
        switch (state) {
        case 10: state = func_0203f030(obj); break;
        case 12: state = func_0203efa0(obj); break;
        case 13: state = func_0203ef68(); break;
        case 14: state = func_0203eefc(obj); break;
        case 15: state = func_0203eee0(obj); break;
        case 11: state = func_0203ee94(); break;
        }
    } else {
        switch (state) {
        case 15: state = func_0203eee0(obj); break;
        case 11: state = func_0203ee94(); break;
        case 14:
            func_02043250();
            func_020432d0();
        default:
            *((unsigned char *)obj + (((struct S0203eefc_A0 *)obj)->f_d13 << 2) + 0x444) = 2;
            state = 11;
            break;
        }
    }
    return state;
}
