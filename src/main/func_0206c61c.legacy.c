extern int func_0206e4a4(int a0);
extern int func_0206c46c(void *param0);
extern int func_0206c9b0(char *a0, unsigned short port);
extern int func_0206c52c(char *a0, int a, int b);
extern char data_02101e64[];

int func_0206c61c(char *a0, int a, int b) {
    if (func_0206e4a4((int)a0) != 0) return -0x1c;
    int flag = 0;
    if (a0 != 0) {
        flag = (*(short *)(a0 + 0x70) & 1) != 0;
    }
    if (!flag) return -0x27;
    if (*(short *)(a0 + 0x70) & 2) return -0x1c;
    signed char st = *(signed char *)(a0 + 0x73);
    int flag2 = 1;
    if (st != 0) {
        if (st != 4) flag2 = 0;
    }
    if (!flag2) return -0x1c;
    if (*(signed char *)(a0 + 0x72) != 1) return -6;
    int handle = func_0206c46c(data_02101e64);
    if (handle < 0) return handle;
    int result = func_0206c9b0((char *)handle, *(unsigned short *)(a0 + 0x74));
    if (result < 0) return result;
    result = func_0206c52c((char *)handle, a, b);
    if (result < 0) return result;
    return handle;
}
