typedef unsigned int u32;
struct Source { char pad[0x2a4]; u32 unused : 13; u32 state : 4; u32 rest : 15; };
struct Dest { char pad[0x280]; u32 flags; };
extern struct Source data_ov011_021d4000;
extern struct Dest data_ov011_021d403c;
void func_ov011_021ca630(void) {
    struct Source *src = &data_ov011_021d4000;
    struct Dest *dst = &data_ov011_021d403c;
    if (src->state) {
        dst->flags = (dst->flags & ~0x3c0000) | 0xc0000;
    }
}
