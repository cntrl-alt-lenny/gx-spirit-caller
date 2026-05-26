/* func_ov002_0220b0f8: brief 228 C-39 wave 3 — helper(self, 1-bit0); bool tail.
 *
 * Variant V4, size 0x28. Brief 227's bool-from-helper
 * recipe + arg variant. See `docs/research/brief-228-c39-wave3-sub-shapes.md`.
 */

struct F0220b0f8_F2 {
    unsigned short bit0 : 1;
    unsigned short pad  : 5;
    unsigned short tag6 : 6;
    unsigned short rest : 4;
};

struct F0220b0f8_Self {
    unsigned short f0;
    struct F0220b0f8_F2 f2;
};

extern int func_ov002_021ff2b8(struct F0220b0f8_Self *self, unsigned int v);

int func_ov002_0220b0f8(struct F0220b0f8_Self *self) {
    return func_ov002_021ff2b8(self, 1 - self->f2.bit0) != 0;
}
