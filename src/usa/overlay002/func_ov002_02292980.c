/* func_ov002_02292980: if func_ov002_0228c350(b0)!=0, true. Else if
 * func_ov002_02280870(b0) < -2, true. Else result is
 * func_ov002_022579d0(self,!b0) >= 2. */
struct SelfB0 {
    unsigned short _pad0;
    unsigned short b0 : 1;
};

extern int func_ov002_0228c350(int b0);
extern int func_ov002_02280870(int b0);
extern int func_ov002_022579d0(void *self, int notB0);

int func_ov002_02292980(void *self) {
    struct SelfB0 *s = (struct SelfB0 *)self;

    if (func_ov002_0228c350(s->b0) != 0)
        return 1;
    if (func_ov002_02280870(s->b0) < -2)
        return 1;

    return func_ov002_022579d0(self, 1 - s->b0) >= 2;
}
