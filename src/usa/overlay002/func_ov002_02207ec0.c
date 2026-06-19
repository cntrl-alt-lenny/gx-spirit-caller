/* func_ov002_02207ec0: C-39f self-preserved — if table[bit0] <
 * (unsigned)pre(self) return 0; else tail helper2(self, arg1). */
typedef unsigned short u16;
struct S { u16 f0; u16 bit0:1; u16 rest:15; };
extern char data_ov002_022cf09c[];
extern int func_ov002_02210174(struct S *self);
extern int func_ov002_02207f4c(struct S *self, int arg1);
int func_ov002_02207ec0(struct S *self, int arg1) {
    int p = func_ov002_02210174(self);
    unsigned int v = *(unsigned int *)(data_ov002_022cf09c + (self->bit0 & 1) * 0x868);
    if (v < (unsigned int)p) return 0;
    return func_ov002_02207f4c(self, arg1);
}
