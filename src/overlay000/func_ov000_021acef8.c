typedef unsigned short u16;
typedef unsigned int u32;
typedef struct {
    u32 resource;
    u32 unk4;
    u32 unk8;
    u32 unkc;
    u16 unk10;
    u16 unk12;
    unsigned short f14 : 4;
    unsigned short flag14 : 1;
    unsigned short rest14 : 11;
    u16 f16;
    unsigned px : 7;
    unsigned py : 7;
    unsigned mode : 3;
    unsigned rest18 : 15;
    unsigned a : 8;
    unsigned b : 8;
    unsigned : 16;
    u32 unk20;
    unsigned short xlo : 8;
    unsigned short xhi : 8;
    unsigned short ylo : 8;
    unsigned short yhi : 8;
} Obj;
struct State { char pad[0x260]; u32 resource; u32 unk264; u32 unk268; unsigned flags; };
extern struct State data_ov000_021c75c4;
extern int func_0201d47c(Obj *o);
extern int func_0201e5b8(Obj *o);
extern int func_0208e0a0(void);
extern void func_02094504(unsigned value, int dest, unsigned size);
void func_ov000_021acef8(int arg) {
    Obj o;
    struct State *s = &data_ov000_021c75c4;
    if (arg == 0) {
        *(volatile u16 *)0x0400100c = (*(volatile u16 *)0x0400100c & 0x43) | 0x184;
        *(volatile u16 *)0x0400100e = (*(volatile u16 *)0x0400100e & 0x43) | 0x310;
    }
    func_0201d47c(&o);
    switch ((s->flags << 23) >> 30) {
    case 0:
        o.xlo = 0;
        o.ylo = 0x20;
        o.px = 0; o.py = 15;
        o.xhi = 0;
        o.yhi = 9;
        break;
    case 1:
        o.xlo = 0;
        o.ylo = 0x20;
        o.px = 0; o.py = 22;
        o.xhi = 9;
        o.yhi = 0xb;
        break;
    }
    o.f16 |= 0x4000;
    o.flag14 = 1;


    o.resource = s->resource;
    o.unk10 = 0x600;
    o.mode = 7;
    o.unk8 = 0;
    o.f14 = 7;
    o.unkc = 0x40;
    if (arg == 0) func_02094504(0, func_0208e0a0(), 0x800);
    s->flags |= 0x40;
    func_0201e5b8(&o);
}





