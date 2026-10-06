extern int func_02054c0c(int a);
extern void func_02069454(void *p, int addr, unsigned short port, int x);

void func_02068d50(char *o, int host, int port, int x) {
    func_02069454(o + 0x4c, func_02054c0c(host), ((port >> 8) & 0xff) | ((port << 8) & 0xff00), x);
}
