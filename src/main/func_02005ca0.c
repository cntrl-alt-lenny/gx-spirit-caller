typedef struct {
    char pad[0xa00];
    short head;
    short tbl[32];
} Pool_02005ca0;

extern Pool_02005ca0 *data_02103d6c[];
extern void func_02005d0c(int which);

void func_02005ca0(int which) {
    int i;
    Pool_02005ca0 *p;

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
    for (i = 0; i < 32; i++) {
        p->tbl[i] = -1;
    }
    p->head = 0;
    func_02005d0c(which);
}
