typedef unsigned int u32;
struct View {
    char pad0[0x238];
    u32 x, y;
    char pad1[0x18];
    u32 prev_x, prev_y;
    u32 dx, dy;
    char pad2[0x44];
    u32 low:20;
    u32 blend:8;
    u32 enabled:1;
    u32 high:3;
    u32 counter;
};
extern struct View data_ov011_021d4000;
void func_ov011_021ccfcc(void) {
    data_ov011_021d4000.blend = 255;
    data_ov011_021d4000.dx = data_ov011_021d4000.x - data_ov011_021d4000.prev_x + 0x80000;
    data_ov011_021d4000.dy = data_ov011_021d4000.y - data_ov011_021d4000.prev_y + 0x60000;
    data_ov011_021d4000.counter &= ~0xff;
    data_ov011_021d4000.enabled = 1;
}
