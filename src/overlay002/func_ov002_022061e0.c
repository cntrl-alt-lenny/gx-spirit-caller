typedef unsigned short u16;
struct S022061e0 { u16 f0; u16 b0 : 1; u16 rest : 15; };

extern char data_ov002_022cf178[];
extern int  func_ov002_021bbeac(int side);

int func_ov002_022061e0(struct S022061e0 *self) {
    int r = func_ov002_021bbeac(1 - self->b0);
    int t = *(int *)(data_ov002_022cf178 + ((1 - self->b0) & 1) * 0x868);
    return (t + r) > 0;
}
