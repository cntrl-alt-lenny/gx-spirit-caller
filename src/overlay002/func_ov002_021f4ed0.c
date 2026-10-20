typedef unsigned short u16;
typedef unsigned char u8;
struct S {
    u16 id;
    u16 player:1;
    u16 slot:5;
    u16 pad:6;
    u16 kind:2;
    u16 rest:2;
    u16 pad4:6;
    u16 index:9;
    u16 top:1;
};
extern int func_ov002_021b947c(int index);
extern void func_ov002_021d5b80(int arg0, int arg1, int arg2, int arg3);
extern void func_ov002_021df62c(int arg0, int arg1, int idx);
extern void func_ov002_021e2d94(int arg0, int arg1, int arg2, int arg3);
extern int func_ov002_022577dc(void *self);
extern char data_ov002_022cf1a4[];
int func_ov002_021f4ed0(struct S *self) {
    if (self->kind != 2) {
        unsigned int r = func_ov002_021b947c(self->index);
        if ((u8)r == self->player && (u8)((u16)r >> 8) == self->slot) {
            if ((u16)(r >> 16) != 0xffff && *(u16 *)(data_ov002_022cf1a4 + (self->player & 1) * 0x868 + self->slot * 20) != 0) {
                func_ov002_021e2d94(self->player, self->slot, 5, 1);
                func_ov002_021d5b80(self->player, self->slot, 0x1174, 1);
            }
            func_ov002_021df62c(self->player, self->slot, self->index);
            return 1;
        }
        if (self->id == 0x1a90 && func_ov002_022577dc(self)) {
            func_ov002_021df62c(self->player, self->slot, self->index);
            return 1;
        }
        return -1;
    }
    func_ov002_021df62c(self->player, self->slot, self->index);
    return 1;
}

