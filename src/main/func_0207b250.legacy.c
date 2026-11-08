typedef struct {
    unsigned char pad0[0x1500];
    unsigned char pad1500[0x764];
    int f2264;
    unsigned char pad2268[0x1c];
} Pre;
typedef struct {
    unsigned char pad[0x2264];
    int f2264;
    unsigned short f2268;
    unsigned char pad226a[0x1a];
    int f2284;
    int f2288;
    unsigned short f228c;
    unsigned short f228e;
    unsigned short f2290;
    char mac[6];
    unsigned short f2298;
    unsigned short f229a;
    char name[0x20];
} GxState;
extern GxState *data_021a088c;
extern unsigned char data_020bee6c[];
extern unsigned char data_020bee7c[];
extern unsigned char data_020bee84[];
extern unsigned int func_0207b548(unsigned int flags);
extern unsigned short func_0207b18c(int x);
extern unsigned short func_0209e308(void);
extern void func_02094688(void *src, void *dst, int n);
void func_0207b250(char *a, unsigned char *b,unsigned int c) {
    unsigned short v;
    func_0207b548(c);
    data_021a088c->f2288 = (int)((char *)data_021a088c + 0x1500);
    data_021a088c->f228c = 0x400;
    data_021a088c->f228e = (1 << func_0207b18c(0)) >> 1;
    v = data_021a088c->f2268;
    if (v == 0) {
        v = func_0209e308();
    }
    data_021a088c->f2290 = v;
    data_021a088c->f2298 = (data_021a088c->f2264 & 0x300000) != 0x300000;
    if (a == 0) {
        func_02094688(data_020bee7c, data_021a088c->mac, 6);
    } else {
        func_02094688(a, data_021a088c->mac, 6);
    }
    if (b == 0 || b == data_020bee84) {
        func_02094688(data_020bee84, data_021a088c->name, 0x20);
        data_021a088c->f229a = 0;
    } else {
        int i;
        func_02094688(b, data_021a088c->name, 0x20);
        for (i = 0; i < 0x20; i++) {
            if (*b == 0) break;
            b++;
        }
        data_021a088c->f229a = i;
    }
    data_021a088c->f2284 = 0;
}
