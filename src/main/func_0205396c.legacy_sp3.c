typedef struct {
    int x0;
    char pad4[8];
    unsigned char xc;
    char padd[0x3f];
    int x4c;
    int x50;
    int x54;
} State;
extern State data_0219e474;
extern char data_0219e434[];
extern signed char data_0219e3f4[];
extern char data_020ffadc[];
extern unsigned char data_0219e478[];
extern char data_0219e485[];
extern char *func_020aadf8(char *dst, const char *src);
extern void func_02055320(void);
extern int func_020a978c(char *dst, const char *fmt, ...);
extern int func_02053ab4(int name, int port, unsigned char *addr);
extern int func_02054e8c(int unused0, int unused1, int unused2);
extern int func_020aaddc(const char *s);
extern void *func_020a7368(void *dst, signed char *src, int count);
extern void func_02053a64(void);
void func_0205396c(char *name) {
    char buf[0x40];
    int c;
    int len;
    func_020aadf8(data_0219e434, name);
    data_0219e474.x0 = -1;
    func_02055320();
    c = data_0219e3f4[0];
    if (c == 0) {
        func_020a978c(buf, data_020ffadc, name);
    }
    if (func_02053ab4((int)(c ? (char *)data_0219e3f4 : buf), 0x6cfc, data_0219e478) == 0) return;
    data_0219e474.x0 = func_02054e8c(2, 2, 0);
    if (data_0219e474.x0 == -1) return;
    data_0219e474.xc = 9;
    len = func_020aaddc(name);
    func_020a7368(data_0219e485, (signed char *)name, len + 1);
    data_0219e474.x4c = len + 6;
    func_02053a64();
    data_0219e474.x54 = 0;
}
