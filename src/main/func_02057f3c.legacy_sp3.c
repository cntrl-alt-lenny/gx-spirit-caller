extern int func_02054cf8(int sock, int a1, int a2, int flag);
extern int func_02054bfc(int sock);
extern void func_0205ffd4(int *a0, int a1, int a2);
extern void func_020585d4(void *a0, int a1, int a2);
extern void func_020604a4(int a, ...);
extern char data_021001f4[];
extern char data_0210021c[];

int func_02057f3c(void *ctx, int sock, int a2, int a3, int *done, int *result, char *name) {
    int r;
    int err;

    r = func_02054cf8(sock, a2, a3, 0);
    if (r == -1) {
        err = func_02054bfc(sock);
        if (err != -6 && err != -26 && err != -76) {
            if (name[0] == 'P' && name[1] == 'R') {
                return 3;
            }
            func_0205ffd4((int *)ctx, 5, (int)data_021001f4);
            func_020585d4(ctx, 3, 0);
            return 3;
        }
        *result = 0;
        *done = 0;
    } else if (r != 0) {
        *result = r;
        *done = 0;
    } else {
        func_020604a4((int)ctx, data_0210021c, name);
        *result = 0;
        *done = 1;
    }
    return 0;
}
