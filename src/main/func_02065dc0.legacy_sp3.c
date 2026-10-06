typedef struct {
    unsigned char  len;
    unsigned char  family;
    unsigned short port;
    unsigned int   addr;
} sockaddr_02065dc0_t;

extern int func_02054ca8(int sock, void *buf, int len, int flags, sockaddr_02065dc0_t *to, int tolen);

int func_02065dc0(int sock, unsigned int addr, int port, void *buf, int len) {
    sockaddr_02065dc0_t sa;

    sa.addr = addr;
    sa.family = 2;
    sa.port = ((port >> 8) & 0xff) | ((port << 8) & 0xff00);
    return func_02054ca8(sock, buf, len, 0, &sa, 8);
}
