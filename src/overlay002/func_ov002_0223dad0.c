/* func_ov002_0223dad0: append val to self's ring buffer at the current
 * write-index (an 8-bit bitfield sharing a u16 with a low byte that is
 * left untouched), then advance the index. */
struct S0223dad0 {
    char _pad[6];
    unsigned short lo : 8;
    unsigned short hi : 8;
    unsigned short arr[1];
};

void func_ov002_0223dad0(struct S0223dad0 *self, unsigned short val) {
    unsigned int idx = self->hi;
    self->hi = self->hi + 1;
    self->arr[idx] = val;
}
