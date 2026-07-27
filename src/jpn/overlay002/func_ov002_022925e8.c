struct Self0 { unsigned short f0; unsigned short bit0 : 1; unsigned short _r : 15; };
extern int func_ov002_021bbf20(int bit0, void *fn);
extern void func_0202e204(void);
extern int func_ov002_02280870(int bit0);
extern int func_ov002_02291050(struct Self0 *self, int arg1);

int func_ov002_022925e8(struct Self0 *self, int arg1) {
    if (func_ov002_021bbf20(self->bit0, func_0202e204) == 0) return 0;
    if (func_ov002_02280870(self->bit0) <= 0) return 0;
    return func_ov002_02291050(self, arg1);
}
