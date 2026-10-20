typedef unsigned short u16;
struct Ov002287Self {
    u16 id;
    u16 side : 1;
    u16 index : 5;
    u16 mode : 6;
    u16 rest : 4;
    u16 pad : 6;
    u16 value : 9;
    u16 end : 1;
};
extern void func_ov002_021e276c(void *self, int a, int b, int c);
extern int func_ov002_022287c4(struct Ov002287Self *self, int unused1);
int func_ov002_022319f4(struct Ov002287Self *self, int unused1) {
    if (self->mode != 2) {
        func_ov002_021e276c(self->side, self->id, 0x11, self->value);
        return 0;
    }
    return func_ov002_022287c4(self, unused1);
}
