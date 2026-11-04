typedef unsigned short u16;
typedef unsigned int u32;

typedef struct Req {
    u16 type;
    u16 pad;
    void *buf;
    char data[0x18];
    u32 w20;
    u16 pad2;
    u16 extra;
    u16 pad3;
} Req;

extern int func_0209db88(int a, int b);
extern void func_020928e8(void *p, int n);
extern char *func_0209dca8(void);
extern void func_0209de5c(int a, int b);
extern void func_02094688(void *src, void *dst, int n);
extern void func_020945f4(void *dst, int v, int n);
extern int func_0209dcb8(void *p, int n);

int func_0209ea24(int a, u16 *buf, void *src, u32 w, u16 extra)
{
    Req req;
    char *st;
    int r;

    r = func_0209db88(1, 2);
    if (r != 0) {
        return r;
    }
    if (buf == 0) {
        return 6;
    }
    func_020928e8(buf, *buf << 1);
    st = func_0209dca8();
    *(u16 *)(st + 0x150) = 0;
    *(u32 *)(st + 0x14c) = 0;
    func_0209de5c(0xc, a);
    req.type = 0xc;
    req.buf = buf;
    if (src != 0) {
        func_02094688(src, req.data, 0x18);
    } else {
        func_020945f4(req.data, 0, 0x18);
    }
    req.w20 = w;
    req.extra = extra;
    r = func_0209dcb8(&req, 0x28);
    if (r == 0) {
        r = 2;
    }
    return r;
}
