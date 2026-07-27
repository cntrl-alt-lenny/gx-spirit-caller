/* func_ov002_02287fdc: self->b0 (bit0 at +2) forwarded to 3 sinks in
 * sequence, each gating the next / providing an early-return value. */
struct Ov002Self { unsigned short f0; unsigned short b0 : 1; };
extern int func_ov002_02281964(int arg0);
extern int func_ov002_02281650(struct Ov002Self *self, int a, int b);
extern int func_ov002_02280870(int arg0);

int func_ov002_02287fdc(struct Ov002Self *self) {
    if (func_ov002_02281964(self->b0) == 0)
        return 0;
    if (func_ov002_02281650(self, 1 - self->b0, 1) != 0)
        return 1;
    return func_ov002_02280870(self->b0) < 0;
}
