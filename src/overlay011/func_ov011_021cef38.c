typedef unsigned int u32;
struct State {
    char pad0[0x254];
    u32 f254, f258, f25c;
    char pad1[0xc];
    u32 f26c, f270;
    char pad2[0x30];
    u32 low:5;
    u32 mode:4;
    u32 next:4;
    u32 high:19;
    u32 f2a8;
    u32 f2ac;
};
extern struct State data_ov011_021d4000;
extern void func_ov011_021ce324();
extern void func_ov011_021ccf8c(void);
void func_ov011_021cef38(int mode, int x, int y) {
    u32 a, b;
    data_ov011_021d4000.next = mode;
    data_ov011_021d4000.mode = data_ov011_021d4000.next;
    func_ov011_021ce324(1);
    a = x << 12;
    b = y << 12;
    data_ov011_021d4000.f258 = a;
    data_ov011_021d4000.f25c = b;
    data_ov011_021d4000.f254 = 0x1000;
    data_ov011_021d4000.f2ac &= ~0x20000;
    data_ov011_021d4000.f26c = a;
    data_ov011_021d4000.f270 = b;
    func_ov011_021ccf8c();
}
