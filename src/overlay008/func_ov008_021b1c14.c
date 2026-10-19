typedef struct {
    unsigned int a, b;
    unsigned char pad8[0x14];
    struct { unsigned int low8:8; unsigned int:24; };
    unsigned char pad20[4];
    struct { unsigned int:17; unsigned int mid4:4; unsigned int:11; };
} state_t;
typedef struct { unsigned int f_0, f_4; } Dims02001e94;
typedef struct { unsigned int pad; unsigned int mode:3; unsigned int:29; } Mode;
extern void func_02001d0c(state_t *p, int a, int b);
extern void func_02001e94(Dims02001e94 *p, unsigned short *dst, int val, int shift);
extern void func_02005088(int a0, int a1, int a2, int a3, int a4, int a5);
extern int func_020054a4(char *, int);
extern char *func_0202c0c0(int);
extern int func_0208de94(void);
extern int func_0208e120(void);
extern int OS_SPrintf(signed char *buffer, const signed char *format, ...);
extern void func_02094504(int, void *, int);
extern char *func_020aaf10(char *, const char *);
extern char data_02102c90[];
extern Mode data_02104f4c;
extern int *data_ov008_021b270c;
extern char data_ov008_021b2710[];
extern char data_ov008_021b2714[];
void func_ov008_021b1c14(void) {
    char buf[64];
    int base;
    int x;
    base = func_0208de94() + 0xa20;
    func_02094504(0, (void *)(base + 0x1000), 0x880);
    OS_SPrintf((signed char *)buf, (const signed char *)func_0202c0c0(0x1c8), data_ov008_021b270c[5]);
    if (data_ov008_021b270c[5] >= 100) {
        func_020aaf10(buf, data_02104f4c.mode == 0 ? data_ov008_021b2710 : data_ov008_021b2714);
    }
    x = 0xf8 - func_020054a4(buf, 12);
    if (x < 0) x = 0;
    func_02001d0c((state_t *)data_02102c90, 0x20, 2);
    func_02005088((int)data_02102c90, (int)buf, base + 0x1000, x, 2, 12);
    func_02001e94((Dims02001e94 *)data_02102c90, (unsigned short *)(func_0208e120() + 0x580), 0xd1, 1);
}
