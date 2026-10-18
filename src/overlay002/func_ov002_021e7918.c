struct S021e7918 { char _pad[2]; unsigned short b0 : 1; unsigned short bits1_5 : 5; unsigned short _r : 10; };
extern int func_ov002_021b39c4(int a, int b, int c);

int func_ov002_021e7918(struct S021e7918 *self, int a, int b) {
    int r = func_ov002_021b39c4(a, b, 0);
    if (r == 0xffff || r == (unsigned short)((unsigned char)self->b0 | ((unsigned char)self->bits1_5 << 8))) return 1;
    return 0;
}
