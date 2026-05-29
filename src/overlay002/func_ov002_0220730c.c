/* func_ov002_0220730c: C-39f 2-D table — base + (bit0&1)*0x868 +
 * b1_5*0x14; if (v>>22 &1)+(v>>23 &1) != 0 return 0; else
 * helper(self, arg1). arg1 pass-through keeps r1 live (gotcha 7) so the
 * index temps avoid r1. */
typedef unsigned short u16;
struct S730 { u16 f0; u16 bit0:1; u16 b1_5:5; u16 rest:10; };
extern char data_ov002_022cf1ac[];
extern int func_ov002_021ff320(struct S730 *self, int arg1);
int func_ov002_0220730c(struct S730 *self, int arg1) {
    unsigned int v = *(unsigned int *)(data_ov002_022cf1ac + (self->bit0 & 1) * 0x868 + self->b1_5 * 0x14);
    if (((v >> 22) & 1) + ((v >> 23) & 1) != 0) return 0;
    return func_ov002_021ff320(self, arg1);
}
