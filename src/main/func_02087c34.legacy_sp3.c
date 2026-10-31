typedef struct {
    int f_0;
    int f_4;
    unsigned short h_8;
    unsigned short h_a;
} state_4cl_t;
extern void func_0207d1b8(state_4cl_t *p, unsigned short v);
extern void func_0207d12c(char *r0, char *r1);
extern state_4cl_t data_021a4868;
extern state_4cl_t data_021a485c;
extern char data_021a4874[];
extern char data_021a4cb4[];
void func_02087c34(void) {
    int i;
    char *p;
    func_0207d1b8(&data_021a4868, 0x14);
    func_0207d1b8(&data_021a485c, 0x14);
    p = data_021a4874;
    for (i = 0; i < 16; i++, p += 0x44) {
        p[0x2c] = 0;
        p[0x3c] = i;
        func_0207d12c((char *)&data_021a485c, p);
    }
    p = data_021a4cb4;
    for (i = 0; i < 32; i++, p += 0x24) {
        func_0207d1b8((state_4cl_t *)p, 12);
        func_0207d1b8((state_4cl_t *)(p + 12), 0);
        p[0x20] = 0x7f;
        *(int *)(p + 0x18) = 1;
        *(int *)(p + 0x1c) = 0;
    }
}
