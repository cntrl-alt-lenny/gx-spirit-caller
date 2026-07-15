extern int  data_ov010_021b8a70[];
extern int  func_02006c0c(int a, int b, int c);
extern void Task_Invoke(int task);
extern void func_0201d47c(void *buf);
extern void func_0201e5b8(void *buf);

typedef union {
    unsigned int raw;
    struct {
        unsigned int lo14 : 14;
        unsigned int dir  : 3;
        unsigned int hi15 : 15;
    } bits;
} F18;

typedef struct {
    int f00;
    char _pad04[0x10];
    unsigned short f14;
    char _pad16[2];
    F18 f18;
    char _pad1c[0x28 - 0x1c];
} TaskBuf;

void func_ov010_021b32ac(int state, int alt, int kind) {
    int idx;
    int handle;
    TaskBuf buf;

    switch (kind) {
    case 1: idx = 1; break;
    case 2: idx = 2; break;
    case 3: idx = 3; break;
    case 4: idx = 4; break;
    case 5: idx = 5; break;
    default: idx = 0; break;
    }

    handle = func_02006c0c(data_ov010_021b8a70[idx], 4, 0);
    func_0201d47c(&buf);

    switch (state) {
    case 0:
        buf.f14 = (buf.f14 & ~0xf) | 0;
        buf.f18.bits.dir = (alt == 0 ? 0 : 2);
        break;
    case 1:
        buf.f14 = (buf.f14 & ~0xf) | 1;
        buf.f18.bits.dir = (alt == 0 ? 1 : 3);
        break;
    case 2:
        buf.f14 = (buf.f14 & ~0xf) | 2;
        buf.f18.bits.dir = 2;
        break;
    case 3:
        buf.f14 = (buf.f14 & ~0xf) | 3;
        buf.f18.bits.dir = 3;
        break;
    case 4:
        buf.f14 = (buf.f14 & ~0xf) | 5;
        buf.f18.bits.dir = (alt == 0 ? 0 : 2);
        break;
    case 5:
        buf.f14 = (buf.f14 & ~0xf) | 6;
        buf.f18.bits.dir = (alt == 0 ? 1 : 3);
        break;
    case 6:
        buf.f14 = (buf.f14 & ~0xf) | 7;
        buf.f18.bits.dir = 2;
        break;
    case 7:
        buf.f14 = (buf.f14 & ~0xf) | 8;
        buf.f18.bits.dir = 3;
        break;
    }

    buf.f14 |= 0x10;
    buf.f00 = handle;
    func_0201e5b8(&buf);
    Task_Invoke(handle);
}
