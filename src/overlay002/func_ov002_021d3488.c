typedef unsigned int u32;
typedef unsigned short u16;
struct State { u16 f0, f2, f4, f6; char pad[0x804]; int f80c, f810; };
extern struct State data_ov002_022ce950;
struct Bits { u32 lo:13; u32 bit:1; u32 mid:8; u32 hi:8; u32 top:2; };
struct Entry { struct Bits bits; char pad[16]; };
struct HalfEntry { u16 value; char pad[18]; };
struct Table { char pad[0x30]; struct Entry entries[1]; };
extern char data_ov002_022cf16c[][0x868];
extern char data_ov002_022cf1a2[][0x868];
extern char data_ov002_022cf1a4[][0x868];
extern int func_ov002_0229c7f8(int a);
extern int func_ov002_0229ade0(int a, int b, int c, int d);
void func_ov002_021d3488(void) {
    int flag;
    int slot, kind;
    flag = (data_ov002_022ce950.f0 & 0x8000) ? 1 : 0;
    slot = data_ov002_022ce950.f4;
    kind = data_ov002_022ce950.f6;
    switch (data_ov002_022ce950.f810) {
    case 0:
        data_ov002_022ce950.f810++;
    case 1:
        if (func_ov002_0229c7f8(-1) != 0) return;
        if (kind == 2) {
            int slotOffset = slot * 0x14;
            int playerOffset = (flag & 1) * 0x868;
            struct Bits *x = &((struct Table *)(data_ov002_022cf16c[flag & 1]))->entries[slot].bits;
            u32 a = ((struct HalfEntry *)(data_ov002_022cf1a4[flag & 1]))[slot].value;
            u32 b = ((struct HalfEntry *)(data_ov002_022cf1a2[flag & 1]))[slot].value;
            u16 packed = (flag & 1) | ((slot & 31) << 1) | ((a & 1) << 14) | ((b & 1) << 15);
            func_ov002_0229ade0(0x34, packed, x->hi * 2 + x->bit, 0);
        } else {
            struct Bits *x = &((struct Table *)(data_ov002_022cf16c[flag & 1]))->entries[slot].bits;
            func_ov002_0229ade0(0x33, flag, slot, x->hi * 2 + x->bit);
        }
        data_ov002_022ce950.f810++;
        break;
    case 2:
        if (func_ov002_0229c7f8(kind == 2 ? 0x34 : 0x33) == 0)
            data_ov002_022ce950.f80c = 0;
        break;
    }
}










