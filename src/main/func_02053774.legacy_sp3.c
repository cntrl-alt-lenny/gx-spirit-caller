typedef struct {
    int x0;
    char pad[0x4c];
    unsigned int x50;
    int x54;
} State;
extern State data_0219e474;
extern int data_0219e3f0;
extern int func_020538b0(signed char *name, int len, unsigned char *hdr, int *out);
extern void func_02053a64(void);
/* The caller consumes r0; the existing void definition omits the returned status. */
extern int func_02054d14(int a, int b, int c, int d, unsigned char *e, int *f);
extern int func_02054e70(int unused0);
extern int func_02055000(int a0);
extern int func_02055330(void);
int func_02053774(void) {
    signed char name[0x40];
    unsigned char hdr[8];
    int size = 8;
    int flags;
    if (data_0219e474.x0 == -1) {
        data_0219e3f0 = 1;
        return 1;
    }
    if (func_02055000(data_0219e474.x0)) {
        int len = func_02054d14(data_0219e474.x0, (int)name, 0x40, 0, hdr, &size);
        if (func_020538b0(name, len, hdr, &flags) == 0) {
            func_02054e70(data_0219e474.x0);
            if (flags & 1) data_0219e3f0 = 2;
            else if (flags & 2) data_0219e3f0 = 3;
            else data_0219e3f0 = 1;
            return data_0219e3f0;
        }
    }
    if ((unsigned int)func_02055330() > data_0219e474.x50 + 0x7d0) {
        if (data_0219e474.x54 == 1) {
            func_02054e70(data_0219e474.x0);
            data_0219e3f0 = 1;
            return 1;
        }
        func_02053a64();
        data_0219e474.x54++;
    }
    return 0;
}



