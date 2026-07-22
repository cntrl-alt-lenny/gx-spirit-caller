typedef struct {
    char pad[2];
    signed char field2;
    char pad2[4];
} Elem0201a0e0;

extern void GetSystemWork(void);
extern int func_02019604(int);
extern Elem0201a0e0 data_020b5b80[];

int func_0201a0e0(int arg0) {
    int r;
    Elem0201a0e0 *p;
    GetSystemWork();
    r = func_02019604(arg0);
    p = &data_020b5b80[arg0];
    return p->field2 + (r >> 1);
}
