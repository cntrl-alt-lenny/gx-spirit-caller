typedef struct {
    int cmd;
    int a;
    int b;
} Ov006Msg;

extern char data_ov006_0224f448[];
extern char data_ov006_0225e068[];
extern void Copy32(const void *src, void *dst, int n);
extern int func_ov006_021be0b0(char *self, int from, int to);
extern int func_ov006_021bcb94(char *self, int a, int b);
extern int func_ov006_021bf01c(char *self);
extern int func_ov006_021bf2a4(char *self);
extern int func_02037208(int a, int b, int c, int d);
extern int func_ov006_021b8e4c(char *p, int a, int b, int c);
extern int func_ov006_021bd700(char *self, int sel, int v);
typedef struct {
    int field_00;
    unsigned char _pad_04[0x3c];
    int field_40;
    unsigned char _pad_44[0xc];
    int field_50;
    unsigned char _pad_54[8];
    int field_5c;
    unsigned char _pad_60[0x14];
    int field_74;
} obj_021bbdc0_t;
extern int func_ov006_021bbdc0(obj_021bbdc0_t *p);
extern int func_ov006_021bd864(int *obj);
extern int func_0202bbdc(int a);
extern int func_0202bbc8(int a, int b);
extern int func_ov006_021b7ce0(int unused, int i, int j);
extern int func_ov006_021b7bb0(char *p, int a);
/* These calls pass full words; the matched setters consume their low 16 bits. */
extern int func_ov006_021b7c94(int unused, int idx, int value);
extern int func_ov006_021b7cc0(int unused, int i, int j, int v);
extern int func_ov006_021ca3e0(void *obj, int a, int b);
extern int func_ov006_021ca3f0(void *obj, int a, int b);
extern int func_ov006_021ca264(char *p, int a, int b);

int func_ov006_021bddd4(char *self) {
    int d = (int)data_ov006_0224f448;
    Ov006Msg msgv;
    Ov006Msg *m = &msgv;
    int ret = 0;
    char *e = data_ov006_0225e068;

    Copy32(self + 0x88, m, 12);
    *(int *)(self + 0x88) = 0;
    *(int *)(self + 0x8c) = 0;
    *(int *)(self + 0x90) = 0;

    switch (m->cmd) {
    case 1: {
        if (m->a != m->b) {
            ret = func_ov006_021be0b0(self, m->a, m->b);
            if (ret != 0) {
                switch (*(int *)(self + 0x40)) {
                case 1:
                    func_ov006_021bcb94(self, 0, 1);
                    func_ov006_021bf01c(self);
                    break;
                case 2:
                    func_ov006_021bf2a4(self);
                    break;
                }
            } else {
                func_02037208(0x43, -1, 0, 1);
            }
        }
        break;
    }
    case 2:
        func_ov006_021b8e4c((char *)d, m->a, 0, 1);
        if (*(int *)(self + 0x50) != 4) {
            *(int *)(self + 0x5c) = *(int *)(self + 0x50);
        }
        *(int *)(self + 0x50) = 4;
        func_ov006_021bd700(self, 4, 0);
        func_ov006_021bbdc0((obj_021bbdc0_t *)self);
        func_ov006_021bd864((int *)self);
        ret = 1;
        *(int *)(self + 0x60) = m->a;
        *(int *)(self + 0x84) = ret;
        break;
    case 3: {
        int i;
        func_0202bbc8(m->a, func_0202bbdc(m->a) == 0);
        for (i = 0; i < 5; i++) {
            if (func_ov006_021b7ce0(d, i, 0) >= 0) {
                func_ov006_021b7bb0((char *)d, i);
                ret = 1;
            }
        }
        break;
    }
    case 4:
        func_ov006_021b7c94(d, *(int *)(self + 0x50), m->a);
        func_ov006_021b7bb0((char *)d, *(int *)(self + 0x50));
        func_ov006_021bd700(self, *(int *)(self + 0x50), 0);
        ret = 1;
        break;
    case 5:
        if (m->a < 0) {
            int s = *(int *)(self + 0x50);
            func_ov006_021b7cc0(d, s, 0, -1);
            func_ov006_021b7cc0(d, s, 1, -1);
            func_ov006_021b7cc0(d, s, 2, -1);
            func_ov006_021b7cc0(d, s, 3, -1);
            func_ov006_021b7cc0(d, s, 4, -1);
            func_ov006_021b7cc0(d, s, 5, -1);
            func_ov006_021b7cc0(d, s, 6, -1);
        } else {
            func_ov006_021b7cc0(d, *(int *)(self + 0x50), m->a, m->b);
        }
        func_ov006_021b7bb0((char *)d, *(int *)(self + 0x50));
        func_ov006_021bd700(self, *(int *)(self + 0x50), 0);
        ret = 1;
        break;
    case 6:
        func_ov006_021ca3e0(e, 0x322, 0xd);
        func_ov006_021ca3f0(e, 2, 0xe);
        func_ov006_021ca264(e, m->a, m->b);
        break;
    }
    return ret;
}







