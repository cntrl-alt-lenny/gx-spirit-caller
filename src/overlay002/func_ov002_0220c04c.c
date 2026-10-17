typedef unsigned short u16;
typedef unsigned int u32;
struct A { u16 f0; u16 bit0:1; u16 a:5; u16 type:6; u16 rest:4; u16 pad; u32 pad2[3]; u32 w0:9; u32 b9:1; u32 f10:4; u32 b14:1; u32 b15:1; u32 w16:3; u32 f19:4; u32 rest2:9; };
extern int func_ov002_022020e0(struct A *self, int p1);
int func_ov002_0220c04c(struct A *self, int p1) {
    if (self->type == 0x16 && self->b9 == self->bit0 && self->f10 <= 4 && self->b15 != 0 && self->f19 == 0xe) {
        return func_ov002_022020e0(self, p1);
    }
    return 0;
}
