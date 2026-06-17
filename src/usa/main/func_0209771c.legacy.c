/* func_0209771c: Family G memset + gotcha-17 volatile re-read tail. */
extern void func_02094500(void *ptr, int val, unsigned count);
struct V810 { int f0, f4, f8; volatile int f12, f16, f20, f24; };
void func_0209771c(struct V810 *self) {
    func_02094500(self, 0, 92);
    self->f16 = 0;
    self->f12 = self->f16;
    self->f24 = 0;
    self->f20 = self->f24;
}
