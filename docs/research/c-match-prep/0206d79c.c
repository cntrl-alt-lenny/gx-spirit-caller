/* CAMPAIGN-PREP candidate for func_0206d79c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     leaf accessor: u16 pair subtract, dec, conditional ring-wrap (addmi)
 *   risk:       struct offsets (0x68 ptr, +0x100/+0x102 u16 pair, +0xf8 modulus) guessed; subs/addmi vs explicit if-add may differ
 *   confidence: med
 */
/* func_0206d79c: b=p->_68; n = b->_102 - b->_100 - 1; if (n < 0) n += b->_f8;
 * return n.  (ring-buffer fill count; the u16 pair lives at b+0x100.)
 */

typedef struct {
    char           _pad_00[0xf8];
    int            cap;        /* +0xf8  */
    char           _pad_fc[0x100 - 0xfc];
    unsigned short head;       /* +0x100 */
    unsigned short tail;       /* +0x102 */
} Ring;

typedef struct {
    char  _pad_00[0x68];
    Ring *ring;                /* +0x68 */
} Obj;

int func_0206d79c(Obj *p) {
    Ring *b = p->ring;
    int n = b->tail - b->head - 1;
    if (n < 0)
        n += b->cap;
    return n;
}
