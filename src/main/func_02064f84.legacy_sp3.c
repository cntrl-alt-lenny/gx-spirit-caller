typedef struct {
    unsigned int s_addr;
} inaddr_02064f84_t;

extern char data_02101588[];
extern char data_02101590[];
extern char data_02101594[];
extern int data_0219e928;
extern char data_0219e92c[2][0x16];
extern char *func_0206e778(inaddr_02064f84_t a);
extern int func_020a978c(char *buf, const char *fmt, ...);

char *func_02064f84(unsigned int addr, int port, char *buf) {
    inaddr_02064f84_t in;
    int idx;

    if (buf == 0) {
        idx = data_0219e928 ^ 1;
        buf = data_0219e92c[idx];
        data_0219e928 = idx;
    }
    if (addr != 0) {
        in.s_addr = addr;
        if (port != 0) {
            func_020a978c(buf, data_02101588, func_0206e778(in), port);
        } else {
            func_020a978c(buf, data_02101590, func_0206e778(in));
        }
    } else if (port == 0) {
        buf[0] = 0;
    } else {
        func_020a978c(buf, data_02101594, port);
    }
    return buf;
}
