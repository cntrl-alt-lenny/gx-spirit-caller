typedef unsigned int u32;
typedef unsigned short u16;
typedef struct {
    u32 resource, unk4, unk8, unkc;
    u16 unk10, unk12;
    unsigned short f14:4, flag14:1, rest14:11;
    u16 f16;
    unsigned px:7, py:7, mode:3, rest18:15;
    unsigned a:8, b:8, rest1c:16;
    u32 unk20, unk24;
} Obj;
struct Table { void *p[6]; };
struct State {
    char pad[0x34];
    unsigned low:8, index:4, side:1, rest:19;
    char pad38[0x274];
    unsigned flags;
};
extern const struct Table data_ov000_021b569c;
extern struct State data_ov000_021c758c;
extern int func_0201d47c(Obj *o);
extern int func_0201e5b8(Obj *o);
extern int func_02006c0c(void *, int, int);
extern void func_ov000_021ab62c(int idx, int a, int b);
extern void func_ov000_021ab4bc(int idx, int val);
void func_ov000_021af5e0(int index, int side) {
    Obj o;
    struct Table table = data_ov000_021b569c;
    data_ov000_021c758c.flags &= ~1u;
    data_ov000_021c758c.side = side;
    data_ov000_021c758c.index = index;
    *(volatile u16 *)0x0400100c = (*(volatile u16 *)0x0400100c & 0x43) | 0x408;
    func_ov000_021ab62c(1,4,0);
    func_0201d47c(&o);
    o.resource = func_02006c0c(table.p[data_ov000_021c758c.index],4,0);
    o.f14 = 7;

    o.px = 0;
    o.py = 0;
    o.unk8 = -1;
    o.unkc = 0;
    o.unk10 = 0xc0;
    o.flag14 = 0;
    func_0201e5b8(&o);
    func_ov000_021ab4bc(1,4);
    data_ov000_021c758c.low = 0xff;
    *(volatile u32 *)0x04001018 = 0;
}




