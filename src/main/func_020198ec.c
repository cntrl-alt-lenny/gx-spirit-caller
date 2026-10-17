typedef struct { char p[5]; signed char b5; char q[1]; } R;
extern R data_020b5b80[];
extern void *GetSystemWork(void);
extern int func_02019604(int);
extern int func_0201a170(int);
int func_020198ec(int k) {
    int t;
    R *p;
    GetSystemWork();
    p = &data_020b5b80[k];
    t = p->b5;
    if (t + (func_02019604(k) >> 1) > 0x1e) {
        t = 0x1e;
    } else {
        t += func_02019604(k) >> 1;
    }
    int r = func_0201a170(10);
    r += t;
    return r;
}
