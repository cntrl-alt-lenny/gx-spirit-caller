typedef struct Entry {
    int f0;
    unsigned int unused4 : 2;
    unsigned int mode : 3;
    unsigned int unused5 : 2;
    unsigned int state : 3;
    unsigned int rest4 : 22;
    unsigned int action : 3;
    unsigned int rest8 : 29;
    unsigned char fC;
    unsigned char error;
    unsigned char padE[10];
    int f18;
    int f1C;
    int f20;
    int f24;
    int f28;
} Entry;
extern int func_020a6ce0(void);
extern int func_020a6dc4(Entry *p, int *out);
int func_020a70fc(Entry *p) {
    if (p == 0) return func_020a6ce0();
    if (p->error != 0 || p->state == 0) return -1;
    if (p->mode == 1) return 0;
    if (p->action >= 3) p->action = 2;
    if (p->action == 2) p->f28 = 0;
    if (p->action != 1) {
        p->action = 0;
        return 0;
    }
    if (func_020a6dc4(p, 0) != 0) {
        p->error = 1;
        p->f28 = 0;
        return -1;
    }
    p->action = 0;
    p->f18 = 0;
    p->f28 = 0;
    return 0;
}
