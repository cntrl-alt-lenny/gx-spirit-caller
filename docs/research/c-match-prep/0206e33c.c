/* CAMPAIGN-PREP candidate for func_0206e33c (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     leaf discriminant switch, ldrneh u16, OR-guard, sub
 *   risk:       offsets (0x64,0x73,0x104,0x4,0x44,0xf8) guessed; r0 reuse means p->m44 (orig param) not q
 *   confidence: med
 */
/* func_0206e33c: leaf accessor switched on a signed-byte discriminant.
 *   q = p->_0x64; if (q == 0) return 0;
 *   d = (s8)p->_0x73;
 *   if (d == 1) { u = q->_0x104; if (u) return (u16)u->_0x4; return 0; }
 *   else if (d == 0 || d == 4) return p->_0x44 - q->_0xf8;
 *   return 0;
 * Note: in the d!=1 path r0 still holds the original param p, so the
 * minuend is p->_0x44 (not q->_0x44).
 */

typedef struct {
    char           _pad_00[0x4];
    unsigned short m4;       /* +0x4 — ldrneh (unsigned) */
} node_t;

typedef struct {
    char    _pad_00[0xf8];
    int     mf8;             /* +0xf8 */
    char    _pad_fc[0x104 - 0xfc];
    node_t *m104;            /* +0x104 */
} ctx_t;

typedef struct {
    char         _pad_00[0x44];
    int          m44;        /* +0x44 */
    char         _pad_48[0x64 - 0x48];
    ctx_t       *m64;        /* +0x64 */
    char         _pad_68[0x73 - 0x68];
    signed char  m73;        /* +0x73 */
} obj_t;

int func_0206e33c(obj_t *p) {
    ctx_t *q = p->m64;
    int r = 0;
    signed char d;

    if (q == 0) return 0;

    d = p->m73;
    if (d == 1) {
        node_t *u = q->m104;
        if (u != 0) r = u->m4;
    } else if (d == 0 || d == 4) {
        r = p->m44 - q->mf8;
    }
    return r;
}
