/* func_ov002_0222b1f0: global 3-way switch (brief 262). switch+break to
 * a shared return 0; mwcc emits sequential cmp (no range-fusion). */
typedef unsigned short u16;
struct S { u16 f0; u16 bit0:1; u16 rest:15; };
extern char data_ov002_022ce1a8[];
extern void func_ov002_021e267c(int a, int f0, int five, int x);
extern void func_ov002_022100d4(void);
int func_ov002_0222b1f0(struct S *self, u16 *arg1) {
    switch (*(int *)(data_ov002_022ce1a8 + 0x5a8)) {
    case 0x80:
        func_ov002_021e267c(1 - self->bit0, self->f0, 5, *arg1);
        return 0x7f;
    case 0x7f:
        func_ov002_022100d4();
        break;
    }
    return 0;
}
