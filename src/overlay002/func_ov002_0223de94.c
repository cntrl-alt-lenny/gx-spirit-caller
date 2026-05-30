/* func_ov002_0223de94: read a (bit0, bits1-4) pair out of a u16 slot
 * (leaf, 27 band-callers). For arg1 in [0,5) the slot is arg0->arr8[arg1];
 * otherwise it indexes the shared data_ov002_022ce720 table at
 * (arg0->f18 + arg1 - 5) mod 128. Returns bit0 in byte 0 and the 4-bit
 * field (bits 1-4) in byte 1.
 */

typedef unsigned short u16;
typedef unsigned char u8;

struct node {
    char _pad[8];
    u16 arr8[5];   /* offset 8 */
    u16 f18;       /* offset 18 */
};

typedef struct { u16 b0:1; u16 b1_4:4; u16 _rest:11; } VBits;

extern u16 data_ov002_022ce720[];

u16 func_ov002_0223de94(struct node *arg0, int arg1) {
    VBits *p;
    if (arg1 < 5) {
        p = (VBits *)&arg0->arr8[arg1];
    } else {
        int idx = (arg0->f18 + arg1 - 5) % 128;
        p = (VBits *)&data_ov002_022ce720[idx];
    }
    return (u8)p->b0 | ((u8)p->b1_4 << 8);
}
