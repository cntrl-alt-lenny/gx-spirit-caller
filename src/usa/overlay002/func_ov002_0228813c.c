/* func_ov002_0228813c: gate on func_ov002_02281964(b0); then require
 * func_ov002_02281650(self,!b0,0)==0; result is func_ov002_021bbe70(!b0)<2. */
struct SelfB0 {
    unsigned short _pad0;
    unsigned short b0 : 1;
};

extern int func_ov002_02281964(int b0);
extern int func_ov002_02281650(void *self, int notB0, int zero);
extern int func_ov002_021bbe70(int notB0);

int func_ov002_0228813c(void *self) {
    struct SelfB0 *s = (struct SelfB0 *)self;

    if (func_ov002_02281964(s->b0) == 0)
        return 0;
    if (func_ov002_02281650(self, 1 - s->b0, 0) != 0)
        return 0;

    return func_ov002_021bbe70(1 - s->b0) < 2;
}
