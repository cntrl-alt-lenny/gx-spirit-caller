struct S { char pad0[0xA4]; int cnt; int base; char pad1[0x10]; unsigned int bits[4]; };
extern void func_ov002_0229d890(struct S *self, int idx, int arg);

void func_ov002_0229db44(struct S *self, int n) {
    int i;
    for (i = 0; i < 4; i++) {
        if (i == n / 32) {
            unsigned int mask = (1 << (n & 0x1f)) - 1;
            unsigned int v = self->bits[i];
            self->bits[i] = (v & mask) | (~mask & (v >> 1));
        } else if (i > n / 32) {
            self->bits[i] >>= 1;
        }
    }
    self->cnt -= 1;
    func_ov002_0229d890(self, self->base, 0);
}
