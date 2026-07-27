/* func_ov002_02292a90: if func_ov002_0228c460(b0)!=0, true. Else if
 * func_ov002_02280980(b0) < -2, true. Else result is
 * func_ov002_02257ab8(self,!b0) >= 2. */
struct SelfB0 {
    unsigned short _pad0;
    unsigned short b0 : 1;
};

extern int func_ov002_0228c460(int b0);
extern int func_ov002_02280980(int b0);
extern int func_ov002_02257ab8(void *self, int notB0);

int func_ov002_02292a90(void *self) {
    struct SelfB0 *s = (struct SelfB0 *)self;

    if (func_ov002_0228c460(s->b0) != 0)
        return 1;
    if (func_ov002_02280980(s->b0) < -2)
        return 1;

    return func_ov002_02257ab8(self, 1 - s->b0) >= 2;
}
