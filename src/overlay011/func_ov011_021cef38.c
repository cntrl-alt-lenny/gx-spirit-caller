typedef unsigned int u32;
struct Ov011Dst4000c {
    char pad0[0x254];
    u32 field_254;
    u32 field_258;
    u32 field_25c;
    char pad1[0x26c - 0x260];
    u32 field_26c;
    u32 field_270;
    char pad2[0x2a4 - 0x274];
    u32 field_2a4;
    char pad3[0x2ac - 0x2a8];
    u32 field_2ac;
};
extern struct Ov011Dst4000c data_ov011_021d4000;
extern void func_ov011_021ce324(int r0, int r1, int r2);
extern void func_ov011_021ccf8c(void);

void func_ov011_021cef38(int r0, int r1, int r2) {
    u32 v = data_ov011_021d4000.field_2a4;
    u32 t;
    v = (v & ~0x1e00u) | (((u32)r0 << 28) >> 19);
    t = (v << 19) >> 28;
    v &= ~0x1e0u;
    v |= (t << 28) >> 23;
    data_ov011_021d4000.field_2a4 = v;
    func_ov011_021ce324(1, r1, r2);
    data_ov011_021d4000.field_258 = (u32)r1 << 12;
    data_ov011_021d4000.field_25c = (u32)r2 << 12;
    data_ov011_021d4000.field_254 = 0x1000;
    data_ov011_021d4000.field_2ac &= ~0x20000;
    data_ov011_021d4000.field_26c = (u32)r1 << 12;
    data_ov011_021d4000.field_270 = (u32)r2 << 12;
    func_ov011_021ccf8c();
}
