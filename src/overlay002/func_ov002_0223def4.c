/* func_ov002_0223def4: leaf. For idx<5 read self->arr8[idx]; else the
 * ce720 ring at (self->f18 + idx - 5) % 128. Return the 5-bit field at
 * bit offset 5 of that u16. Sibling of shipped 0223de94. */
typedef unsigned short u16;

struct Node0223def4 {
    char _pad[8];
    u16 arr8[5];   /* +8 */
    u16 f18;       /* +0x12 */
};

extern u16 data_ov002_022ce720[];

int func_ov002_0223def4(struct Node0223def4 *self, int idx) {
    u16 *p;
    if (idx < 5) {
        p = &self->arr8[idx];
    } else {
        int n = (self->f18 + idx - 5) % 128;
        p = &data_ov002_022ce720[n];
    }
    return (unsigned)((u16)*p << 18) >> 23;
}
