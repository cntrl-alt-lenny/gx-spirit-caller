/* func_ov002_0222706c: C-39 — if a global word == 0x80, run a bit0
 * helper; then tail helper2(self, arg). */
typedef unsigned short u16;
struct S { u16 f0; u16 bit0:1; u16 rest:15; };
extern char data_ov002_022ce288[];
extern void func_ov002_021e276c(int bit0, u16 f0, int a, int b);
extern int func_ov002_02211b64(struct S *self, int arg);
int func_ov002_0222706c(struct S *self, int arg) {
    if (*(int *)(data_ov002_022ce288 + 0x5a8) == 0x80) {
        func_ov002_021e276c(self->bit0, self->f0, 1, 0);
    }
    return func_ov002_02211b64(self, arg);
}
