typedef struct {
    int f_0;
    int f_4;
    unsigned short h_8;
    unsigned short h_a;
} state_4cl_t;
extern void func_0207d1b8(state_4cl_t *p, unsigned short v);
extern void func_0207d12c(char *r0, char *r1);
typedef struct {
    char pad0[0x2c];
    unsigned char f_2c;
    char pad1[0xf];
    unsigned char f_3c;
    char pad2[7];
} Entry;
typedef struct {
    state_4cl_t list0;
    state_4cl_t list1;
    int f_18;
    int f_1c;
    unsigned char f_20;
    char pad[3];
} Group;
extern state_4cl_t data_021a4868;
extern state_4cl_t data_021a485c;
extern Entry data_021a4874[];
extern Group data_021a4cb4[];
void func_02087c34(void) {
    int i;
    Entry *p;
    Group *g;
    func_0207d1b8(&data_021a4868, 0x14);
    func_0207d1b8(&data_021a485c, 0x14);
    p = data_021a4874;
    for (i = 0; i < 0x10; i++, p++) {
        p->f_2c = 0;
        p->f_3c = i;
        func_0207d12c((char *)&data_021a485c, (char *)p);
    }
    g = data_021a4cb4;
    for (i = 0; i < 0x20; i++, g++) {
        func_0207d1b8(&g->list0, 0xc);
        func_0207d1b8(&g->list1, 0);
        g->f_20 = 0x7f;
        g->f_18 = 1;
        g->f_1c = 0;
    }
}

