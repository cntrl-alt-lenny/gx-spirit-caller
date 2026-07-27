/* func_ov002_02295b50: gate on func_ov002_02259f74(b0); then require
 * func_ov002_021bbf50(!b0)<2; result is func_ov002_02281760(self,!b0,0)==0. */
struct SelfB0 {
    unsigned short _pad0;
    unsigned short b0 : 1;
};

extern int func_ov002_02259f74(int b0);
extern int func_ov002_021bbf50(int notB0);
extern int func_ov002_02281760(void *self, int notB0, int zero);

int func_ov002_02295b50(void *self) {
    struct SelfB0 *s = (struct SelfB0 *)self;

    if (func_ov002_02259f74(s->b0) == 0)
        return 0;
    if (func_ov002_021bbf50(1 - s->b0) >= 2)
        return 0;

    return func_ov002_02281760(self, 1 - s->b0, 0) == 0;
}
