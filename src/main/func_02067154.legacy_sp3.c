typedef struct {
    char pad[0xc];
    int **field_c;
} T_02067154;

extern int func_02054c0c(int a0);
extern T_02067154 *func_0206ebe8(int a0);
extern int func_020aaf40(void *p, int x);
extern char data_02101784[];

int func_02067154(int arg0, int b, void *cptr, int *d) {
    unsigned char *c = (unsigned char *)cptr;
    T_02067154 *p = 0;
    unsigned short v = (unsigned short)b;

    c[1] = 2;
    *(unsigned short *)(c + 2) = (unsigned short)(((v >> 8) & 0xff) | ((v << 8) & 0xff00));

    if (arg0 != 0) {
        *(int *)(c + 4) = func_02054c0c(arg0);
    } else {
        *(int *)(c + 4) = 0;
    }

    if (*(int *)(c + 4) == -1 && func_020aaf40((void *)arg0, (int)data_02101784) != 0) {
        p = func_0206ebe8(arg0);
        if (p == 0) {
            return 0;
        }
        *(int *)(c + 4) = **(p->field_c);
    }

    if (d != 0) {
        *d = (int)p;
    }
    return 1;
}
