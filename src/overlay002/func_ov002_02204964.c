/* func_ov002_02204964: brief 228 C-39 wave 3 — helper(1-bit0); bool tail.
 *
 * Variant V2, size 0x28. Brief 227's bool-from-helper
 * recipe + arg variant. See `docs/research/brief-228-c39-wave3-sub-shapes.md`.
 */

struct F02204964_F2 {
    unsigned short bit0 : 1;
    unsigned short pad  : 5;
    unsigned short tag6 : 6;
    unsigned short rest : 4;
};

struct F02204964_Self {
    unsigned short f0;
    struct F02204964_F2 f2;
};

extern int func_ov002_021bbf50(unsigned int v);

int func_ov002_02204964(struct F02204964_Self *self) {
    return func_ov002_021bbf50(1 - self->f2.bit0) != 0;
}
