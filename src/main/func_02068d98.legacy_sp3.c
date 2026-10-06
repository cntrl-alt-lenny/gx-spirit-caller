extern int func_02054c0c(int a);
extern void func_0206950c(void *p, int addr, unsigned short port, int x, int y);

void func_02068d98(char *o, int host, int port, int x, int y) {
    func_0206950c(o + 0x4c, func_02054c0c(host), ((port >> 8) & 0xff) | ((port << 8) & 0xff00), x, y);
}
