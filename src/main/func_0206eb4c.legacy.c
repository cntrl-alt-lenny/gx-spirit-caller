extern int func_0206e174(void);
int func_0206eb4c(void *self, unsigned char *out) {
    unsigned int addr;
    int port;
    int h;
    if (self == 0) return -0x27;
    addr = func_0206e174();
    port = self ? *(unsigned short *)((char *)self + 0x74) : 0;
    if (addr == 0) port = 0;
    h = (unsigned short)port;
    out[0] = 8;
    out[1] = 2;
    *(unsigned short *)(out + 2) = ((h >> 8) & 0xff) | ((h << 8) & 0xff00);
    *(unsigned int *)(out + 4) = ((addr >> 24) & 0xff) | ((addr >> 8) & 0xff00) | ((addr << 8) & 0xff0000) | ((addr << 24) & 0xff000000);
    return 0;
}

