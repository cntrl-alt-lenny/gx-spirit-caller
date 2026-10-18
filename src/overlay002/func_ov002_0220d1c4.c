typedef unsigned short u16;
typedef unsigned int u32;
struct Card {
    u16 id;
    u16 side:1;
    u16 pad1:5;
    u16 kind:6;
    u16 pad2:4;
    char pad3[16];
    u32 idx:9;
    u32 side9:1;
    u32 field10:4;
    u32 pad14:1;
    u32 bit15:1;
    u32 bit16:1;
    u32 pad17:1;
    u32 side18:1;
    u32 nib:4;
};
struct Entry { u16 id:13; u16 rest:3; u16 other; };
extern struct Entry data_ov002_022d0250[];
extern int func_0202ed90(int a0);
extern int func_ov002_022536e8(void *self, int arg1, int arg2);
extern int func_ov002_021bc618(int arg0);
/* The original caller supplies only r0 to the four-argument thunk. */
extern int func_ov002_021ca2b8();
int func_ov002_0220d1c4(struct Card *self) {
    if (self->kind == 0x1b && self->side9 == self->side && self->field10 <= 4 && self->side18 != self->side && !self->bit16 && self->bit15 && self->nib == 0xe && func_0202ed90(data_ov002_022d0250[self->idx].id)) {
        if (func_ov002_022536e8((void *)self->side, self->id, 0) == 0) return 0;
        if (func_ov002_021bc618(self->side) == 0) return 0;
        return func_ov002_021ca2b8(self->side) != 0;
    }
    return 0;
}

