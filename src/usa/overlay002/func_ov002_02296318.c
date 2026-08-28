/* func_ov002_02296318: (1-self->b0) picks a per-player row for a
 * threshold guard; a function-pointer literal (func_0202e3d8) is loaded
 * but never reassigned before the final bl -- an implicit 2nd argument. */
struct Ov002Self { unsigned short f0; unsigned short b0 : 1; };
extern char data_ov002_022cf08c[];
extern int func_ov002_02259e8c(int flag);
extern int func_ov002_021bbf20(int a, void *fn);
extern void func_0202e3d8(void);

int func_ov002_02296318(struct Ov002Self *self) {
    int idx = ((1 - self->b0) & 1) * 0x868;
    if (*(int *)(data_ov002_022cf08c + idx) > 0x7d0)
        return 0;
    if (func_ov002_02259e8c(self->b0) == 0)
        return 0;
    return func_ov002_021bbf20(self->b0, (void *)func_0202e3d8) >= 2;
}
