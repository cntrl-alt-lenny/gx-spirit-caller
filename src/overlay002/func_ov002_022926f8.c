struct Self0 { unsigned short f0; unsigned short bit0 : 1; unsigned short _r : 15; };
extern int func_ov002_021bc000(int bit0, void *fn);
extern void func_0202e258(void);
extern int func_ov002_02280980(int bit0);
extern int func_ov002_02291160(struct Self0 *self, int arg1);

int func_ov002_022926f8(struct Self0 *self, int arg1) {
    if (func_ov002_021bc000(self->bit0, func_0202e258) == 0) return 0;
    if (func_ov002_02280980(self->bit0) <= 0) return 0;
    return func_ov002_02291160(self, arg1);
}
