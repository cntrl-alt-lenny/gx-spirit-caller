typedef unsigned short u16;
struct S022061e0 { u16 f0; u16 b0 : 1; u16 rest : 15; };

extern char data_ov002_022cf098[];
extern int  func_ov002_021bbdcc(int side);

int func_ov002_022060f0(struct S022061e0 *self) {
    int r = func_ov002_021bbdcc(1 - self->b0);
    int t = *(int *)(data_ov002_022cf098 + ((1 - self->b0) & 1) * 0x868);
    return (t + r) > 0;
}
