typedef struct {
    char pad[2];
    signed char field2;
    char pad2[4];
} Elem0201a0e0;

extern void GetSystemWork(void);
extern int func_020195d0(int);
extern Elem0201a0e0 data_020b5a8c[];

int func_0201a0ac(int arg0) {
    int r;
    Elem0201a0e0 *p;
    GetSystemWork();
    r = func_020195d0(arg0);
    p = &data_020b5a8c[arg0];
    return p->field2 + (r >> 1);
}
