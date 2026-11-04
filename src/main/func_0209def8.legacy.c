typedef unsigned int u32;
typedef unsigned short u16;
typedef unsigned char u8;

typedef struct Ctx {
    u32 p0;
    u32 p4;
    u32 p8;
    u32 pC;
    u32 p10;
    u16 f14;
    u8 pad16[0xb6];
    u32 tabCC[16];
    u32 tab10C[16];
    u32 f14C;
    u16 f150;
} Ctx;

extern u16 data_021a8d28;
extern Ctx *data_021a8d2c;
extern u8 data_021a8d30[];
extern u8 data_021a8d50[];
extern u16 data_021a8dc0[];

extern u32 OS_DisableIrq(void);
extern void OS_RestoreIrq(u32);
extern int func_0209256c(void *, void *, int);
extern void func_02092614(void *, void *, int);
extern void func_020928cc(void *, u32);
extern void func_020928e8(void *, int);
extern void func_020940ac(u32, void *, int, u32);
extern void func_02096228(void);
extern int func_0209640c(int, int);
extern void func_02096434(int, void *);
extern void func_0209d788(void);
extern void func_0209d7a4(void);

int func_0209def8(u8 *buf, u32 mode, u32 size)
{
    u32 irq;
    int i;
    int j;
    u16 *p;

    irq = OS_DisableIrq();
    if (data_021a8d28 != 0) {
        OS_RestoreIrq(irq);
        return 3;
    }
    if (buf == 0) {
        OS_RestoreIrq(irq);
        return 6;
    }
    if (mode > 3) {
        OS_RestoreIrq(irq);
        return 6;
    }
    if ((u32)buf & 0x1f) {
        OS_RestoreIrq(irq);
        return 6;
    }
    func_02096228();
    if (func_0209640c(10, 1) == 0) {
        OS_RestoreIrq(irq);
        return 4;
    }
    func_020928cc(buf, size);
    func_020940ac(mode, buf, 0, size);
    data_021a8d2c = (Ctx *)buf;
    data_021a8d2c->p0 = (u32)buf + 0x200;
    data_021a8d2c->p4 = data_021a8d2c->p0 + 0x300;
    data_021a8d2c->pC = data_021a8d2c->p4 + 0x800;
    data_021a8d2c->p10 = data_021a8d2c->pC + 0x100;
    func_0209d788();
    data_021a8d2c->f14 = mode;
    data_021a8d2c->f14C = 0;
    data_021a8d2c->f150 = 0;
    for (i = 0; i < 16; i++) {
        data_021a8d2c->tabCC[i] = 0;
        data_021a8d2c->tab10C[i] = 0;
    }
    func_02092614(data_021a8d30, data_021a8d50, 10);
    for (p = data_021a8dc0, j = 0; j < 10; j++) {
        *p = 0x8000;
        func_020928e8(p, 2);
        func_0209256c(data_021a8d30, p, 1);
        p += 0x80;
    }
    func_02096434(10, func_0209d7a4);
    data_021a8d28 = 1;
    OS_RestoreIrq(irq);
    return 0;
}
