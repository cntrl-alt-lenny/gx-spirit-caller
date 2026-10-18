typedef unsigned short u16;
typedef unsigned int u32;
struct S022297e0 { u16 f0; u16 bit0:1; u16 rest:15; };
struct Side { char pad[0x868]; };
extern struct Side data_ov002_022cf16c[];
extern int func_ov002_0223df38(struct S022297e0 *self, int a, u32 *out);
extern int func_ov002_0225764c(struct S022297e0 *self, int a, int b);
extern int func_ov002_021c84c4(int bit, int i);
extern int func_ov002_021d59cc(int a, int b, int c, int d, u16 e);
int func_ov002_022297e0(struct S022297e0 *self) {
    u32 v;
    if (func_ov002_0223df38(self, 0, &v)) {
        int a = v & 0xff;
        int b = ((u16)v >> 8) & 0xff;
        if (func_ov002_0225764c(self, a, b)) {
            int i;
            int sum = 0;
            for (i = 0; i <= 4; i++) {
                if (*(u16 *)((char *)&data_ov002_022cf16c[self->bit0 & 1] + i * 0x14 + 0x38) != 0) {
                    sum += func_ov002_021c84c4(self->bit0, i);
                }
            }
            func_ov002_021d59cc(a, b, self->f0, 2, (u16)sum);
        }
    }
    return 0;
}
