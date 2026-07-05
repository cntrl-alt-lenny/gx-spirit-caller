typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

struct Glob_9c480 {
    u8 _pad0[0x6];
    u16 field_6;       /* +0x6 <- r2 */
    u8 _pad8[0xc - 8];
    u32 *field_c;      /* +0xc <- lr + n*4 */
    u32 *field_10;     /* +0x10 <- r4 + n*4 */
};

extern struct Glob_9c480 data_0219c3a0;
extern u16 data_020fe3e0;

struct Obj_2038f3c {
    u8 _pad0[0x14];
    u32 arr14[8];      /* +0x14 */
    u8 _pad34[0x34 - (0x14 + 0x20)];
    u32 arr34[8];      /* +0x34 */
};

void func_02038eec(struct Obj_2038f3c *obj, int n, int r2) {
    int clamp;
    int i;

    clamp = n;
    if (n < 0) clamp = 0;
    data_0219c3a0.field_6 = (u16)r2;
    data_020fe3e0 = (u16)clamp;
    data_0219c3a0.field_10 = &obj->arr14[clamp];
    data_0219c3a0.field_c = &obj->arr34[clamp];
    if (n < 0) {
        for (i = 0; i < 8; i++) {
            obj->arr34[i] = 0;
            obj->arr14[i] = 0xffff;
        }
    }
}
