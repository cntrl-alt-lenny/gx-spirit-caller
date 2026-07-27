/* func_ov002_022880ec: self->b0 (bit0 at +2) forwarded to 3 sinks in
 * sequence, each gating the next / providing an early-return value. */
struct Ov002Self { unsigned short f0; unsigned short b0 : 1; };
extern int func_ov002_02281a74(int arg0);
extern int func_ov002_02281760(struct Ov002Self *self, int a, int b);
extern int func_ov002_02280980(int arg0);

int func_ov002_022880ec(struct Ov002Self *self) {
    if (func_ov002_02281a74(self->b0) == 0)
        return 0;
    if (func_ov002_02281760(self, 1 - self->b0, 1) != 0)
        return 1;
    return func_ov002_02280980(self->b0) < 0;
}
