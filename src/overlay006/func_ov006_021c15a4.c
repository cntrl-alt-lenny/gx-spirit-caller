extern int func_020215d8(void *p);
extern int func_ov006_021c1680(int *base);
extern int func_ov006_021c16c8(void *x);
extern int func_ov006_021c1770(int this_, int on);

typedef struct {
    void *f_0;
    int f_4;
    int f_8;
} ov006_021c15a4_state_t;

int func_ov006_021c15a4(ov006_021c15a4_state_t *p) {
    switch (p->f_4) {
    case 0:
        if (p->f_8 == 2) {
            func_ov006_021c1680((int *)p);
            p->f_4 = 1;
            p->f_8 = 0;
        }
        break;
    case 1:
        if (p->f_8 == 3) {
            func_ov006_021c1770((int)p, 1);
        }
        if (func_020215d8(p->f_0) == 0) {
            p->f_0 = 0;
            p->f_4 = 2;
            p->f_8 = 0;
        } else {
            func_ov006_021c16c8(p);
        }
        break;
    case 2:
        return 1;
    }
    p->f_8++;
    return 0;
}
