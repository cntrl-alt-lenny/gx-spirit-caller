typedef struct {
    char           _0[0x10];
    unsigned short port;
    char           _12[0x2];
    int            a;
    int            b;
} req_0206c52c_t;

extern int func_0206e4a4(int a0);
extern req_0206c52c_t *func_0206bf94(void *a0, char *a1, int a2);
extern int func_0206c4b0(void *a);
extern int func_0206be54(int *p, void *req);

int func_0206c52c(char *a0, int a, int b) {
    if (func_0206e4a4((int)a0) != 0) {
        return -0x1c;
    }
    int flag = 0;
    if (a0 != 0) {
        flag = (*(short *)(a0 + 0x70) & 0x1) != 0;
    }
    if (!flag) {
        return -0x27;
    }
    if (*(short *)(a0 + 0x70) & 0x2) {
        return -0x1c;
    }
    signed char st = *(signed char *)(a0 + 0x73);
    int flag2 = 1;
    if (st != 0) {
        if (st != 4) {
            flag2 = 0;
        }
    }
    if (!flag2) {
        return -0x1c;
    }
    signed char mode = *(signed char *)(a0 + 0x72);
    if (mode != 1) {
        return -0x6;
    }
    if (*(unsigned short *)(a0 + 0x74) == 0) {
        return -0x1c;
    }
    req_0206c52c_t *r = func_0206bf94((void *)func_0206c4b0, a0, mode);
    r->port = *(unsigned short *)(a0 + 0x74);
    r->a = a;
    r->b = b;
    *(short *)(a0 + 0x70) |= 0x2;
    return func_0206be54((int *)a0, r);
}
