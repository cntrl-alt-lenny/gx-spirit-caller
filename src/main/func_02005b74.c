typedef struct {
    char pad[0xa44];
    int kind;
    void *fn;
} Pool_02005b74;

extern Pool_02005b74 *data_02103d6c[];
extern void func_0208fdf0(void);
extern void func_0208fe58(void);
extern void func_02005ca0(int which);
extern void func_0209448c(int a, void *p, int size);

void func_02005b74(int which) {
    Pool_02005b74 *p;

    switch (which) {
    case 1:
        p = data_02103d6c[0];
        break;
    case 2:
        p = data_02103d6c[1];
        break;
    default:
        p = 0;
        break;
    }
    func_0209448c(0, p, 0xa4c);
    func_02005ca0(which);
    p->kind = which;
    switch (which) {
    case 1:
        p->fn = func_0208fe58;
        break;
    case 2:
        p->fn = func_0208fdf0;
        break;
    }
}
