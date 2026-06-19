/* func_ov002_021ff578: brief 228 C-39 wave 3 — helper(bit0, -1); bool tail.
 *
 * Variant V1, size 0x28. Brief 227's bool-from-helper
 * recipe + arg variant. See `docs/research/brief-228-c39-wave3-sub-shapes.md`.
 */

struct F021ff668_F2 {
    unsigned short bit0 : 1;
    unsigned short pad  : 5;
    unsigned short tag6 : 6;
    unsigned short rest : 4;
};

struct F021ff668_Self {
    unsigned short f0;
    struct F021ff668_F2 f2;
};

extern int func_ov002_021bcca0(unsigned int bit0, int mask);

int func_ov002_021ff578(struct F021ff668_Self *self) {
    return func_ov002_021bcca0(self->f2.bit0, ~0) > 0;
}
