/* func_ov002_02296428: (1-self->b0) picks a per-player row for a
 * threshold guard; a function-pointer literal (func_0202e42c) is loaded
 * but never reassigned before the final bl -- an implicit 2nd argument. */
struct Ov002Self { unsigned short f0; unsigned short b0 : 1; };
extern char data_ov002_022cf16c[];
extern int func_ov002_02259f74(int flag);
extern int func_ov002_021bc000(int a, void *fn);
extern void func_0202e42c(void);

int func_ov002_02296428(struct Ov002Self *self) {
    int idx = ((1 - self->b0) & 1) * 0x868;
    if (*(int *)(data_ov002_022cf16c + idx) > 0x7d0)
        return 0;
    if (func_ov002_02259f74(self->b0) == 0)
        return 0;
    return func_ov002_021bc000(self->b0, (void *)func_0202e42c) >= 2;
}
