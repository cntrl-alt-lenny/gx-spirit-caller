typedef unsigned short u16;
typedef unsigned int u32;

struct Obj {
    char pad0[8];
    u32 f8; u16 fc; u16 pade; u16 f10; u16 pad12; int f14;
    u32 f18; u16 f1c; u16 pad1e; u16 f20; u16 pad22; int f24; int f28;
};

extern void func_02090330(void);
extern void func_0209015c(void);
extern void func_020901cc(void *dst, u32 a, u32 size);

void func_02081f5c(struct Obj *o, int flag)
{
    if (flag != 0) {
        func_02090330();
    }
    u32 s1 = o->fc * 8;
    if (s1 != 0) {
        func_020901cc((char *)o + o->f14, (o->f8 & 0xffff) * 8, s1);
        o->f10 |= 1;
    }
    u32 s2 = o->f1c * 8;
    if (s2 != 0) {
        u32 m = o->f18 & 0xffff;
        u32 v = m * 8;
        char *p2 = (char *)o + o->f28;
        func_020901cc((char *)o + o->f24, v, s2);
        u32 lo = ((m * 8) & 0x1ffff) >> 1;
        u32 hi = (v & 0x40000) >> 2;
        func_020901cc(p2, lo + 0x20000 + hi, s2 >> 1);
        o->f20 |= 1;
    }
    if (flag != 0) {
        func_0209015c();
    }
}
