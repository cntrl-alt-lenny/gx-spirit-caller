typedef unsigned int u32;
typedef unsigned short u16;
struct S { char pad[0xd44]; int count; };
struct E { u32 f2 : 13; u32 lo : 1; u32 f1 : 8; u32 hi : 8; u32 f0 : 2; };
extern struct S data_ov002_022d016c;
extern struct E *func_ov002_021b004c(int id);
extern void func_ov002_021d479c(u16 a, u16 b, u16 c, u16 d);

void func_ov002_021e1bf8(int arg0) {
    int i;
    for (i = data_ov002_022d016c.count - 1; i >= 0; i--) {
        struct E *a = func_ov002_021b004c(i + 1);
        u32 c = (func_ov002_021b004c(i + 1)->hi << 1) + a->lo;
        func_ov002_021d479c((u16)((arg0 ? 0x8000 : 0) | 0x57), 13, (u16)c, 0);
    }
}
