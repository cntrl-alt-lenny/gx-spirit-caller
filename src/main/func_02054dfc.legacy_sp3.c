typedef struct {
    unsigned char b[8];
} SockAddr;

extern int func_0206eea0(int p, void *src);
extern int func_02054ea8(int a, int b);

int func_02054dfc(int sock, SockAddr *addr, unsigned char len) {
    SockAddr tmp;

    if (*(unsigned short *)&addr->b[2] == 0) {
        return 0;
    }
    tmp = *addr;
    tmp.b[0] = len;
    return func_02054ea8(func_0206eea0(sock, &tmp), -1);
}
