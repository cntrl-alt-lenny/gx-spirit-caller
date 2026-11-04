struct S4a8 {
    unsigned short f0;
    unsigned short b0 : 1;
    unsigned short c : 5;
    unsigned short pad : 8;
    unsigned short b14 : 1;
    unsigned short pad2 : 1;
};

extern int func_ov002_021bc8c8(int a, int b, int c);
extern int func_ov002_021c2f24(int a, int b);
extern int func_ov002_021ca2b8(int a);
extern int func_ov002_021ff2b8(struct S4a8 *self, int a);

int func_ov002_022024a8(struct S4a8 *self) {
    int id = self->b0 ^ self->b14;

    if (func_ov002_021bc8c8(id, self->b0, self->c) == 0) return 0;
    if (func_ov002_021ff2b8(self, id) < (id != self->b0) + 2) return 0;
    if (func_ov002_021ca2b8(id) == 0) return 0;
    if (func_ov002_021c2f24(id, 0x1288) == 0) return 0;
    if (func_ov002_021c2f24(id, 0x129b) == 0) return 0;
    if (func_ov002_021c2f24(id, 0x12b8) == 0) return 0;
    return 2;
}
