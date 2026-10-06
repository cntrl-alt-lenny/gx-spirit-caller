typedef struct {
    char _pad0[0xc];
    int **xc;
} Host;

extern int func_02054c0c(int a);
extern Host *func_0206ebe8(int a0);

int func_02053ab4(int name, int port, unsigned char *addr) {
    Host *h;
    unsigned short p = port;

    addr[1] = 2;
    *(unsigned short *)(addr + 2) = ((p >> 8) & 0xff) | ((p << 8) & 0xff00);
    *(int *)(addr + 4) = func_02054c0c(name);
    if (*(int *)(addr + 4) == -1) {
        h = func_0206ebe8(name);
        if (h == 0) {
            return 0;
        }
        *(int *)(addr + 4) = **h->xc;
    }
    return 1;
}
