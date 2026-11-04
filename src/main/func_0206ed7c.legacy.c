typedef struct Address {
    unsigned char len;
    unsigned char family;
    unsigned short port;
    unsigned int addr;
} Address;
extern int func_0206d1f0(void *self, int a, int b, unsigned short *port, unsigned int *addr, int flags);
int func_0206ed7c(void *self, int a, int b, int flags, void *out) {
    unsigned short port;
    unsigned int addr;
    int ret;
    Address *dst;
    ret = func_0206d1f0(self, a, b, &port, &addr, flags);
    if (ret < 0) return ret;
    dst = out;
    if (dst == 0) return ret;
    dst->port = ((port >> 8) & 0xff) | ((port << 8) & 0xff00);
    dst->addr = ((addr >> 24) & 0xff) | ((addr >> 8) & 0xff00) | ((addr << 8) & 0xff0000) | ((addr << 24) & 0xff000000);
    return ret;
}
