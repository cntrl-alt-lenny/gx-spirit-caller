struct Sock { int handle; };
struct Addr { unsigned short fam; unsigned short port; unsigned int ip; };

extern int func_02055000(int a0);
extern int func_02054d14(int a, void *b, int c, int d, struct Addr *e, int *f);
extern int func_02054bfc(int a);
extern int func_02063188(struct Sock *s, unsigned int ip, unsigned int port);
extern int func_02063288(struct Sock *s, void *buf, int len, unsigned int ip, unsigned int port);
extern void func_020644c4(struct Sock *s);

#define SWAP16(x) ((unsigned short)((((x) >> 8) & 0xff) | (((x) << 8) & 0xff00)))

int func_02063034(struct Sock *s) {
    unsigned char buf[0x5dc];
    struct Addr addr;
    int addrlen;
    int n;
    int err;

    while (func_02055000(s->handle)) {
        addrlen = 8;
        n = func_02054d14(s->handle, buf, 0x5dc, 0, &addr, &addrlen);
        if (n == -1) {
            err = func_02054bfc(s->handle);
            if (err == -15) {
                if (!func_02063188(s, addr.ip, SWAP16(addr.port))) {
                    return 0;
                }
            } else if (err != -35) {
                func_020644c4(s);
                return 0;
            }
        } else {
            if (!func_02063288(s, buf, n, addr.ip, SWAP16(addr.port))) {
                return 0;
            }
        }
    }
    return 1;
}
