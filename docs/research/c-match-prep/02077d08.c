/* CAMPAIGN-PREP candidate for func_02077d08 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     IRQ-bracket + guarded-scan loop + 64-bit-tick >>16 pack
 *   risk:       slot/req field offsets guessed; loop induction (ptr vs index) and r1-base hoist may differ
 *   confidence: med
 */
/* func_02077d08: IRQ-bracketed 4-slot match loop.
 * Scans data_021a071c[4] (stride 0x5c) for an active slot whose key
 * word (+0x54) == arg1 and key halfword (+0x58) == arg2, copies two
 * blocks into it, stamps a packed tick at +0x50, and flags p->_0x30.
 */

extern int       OS_DisableIrq(void);
extern void      OS_RestoreIrq(int saved);
extern void      func_02094688(void *dst, const void *src, int n); /* memcpy */
extern long long func_020930b0(void);                              /* 64-bit tick */

typedef struct {
    unsigned char  block_a[0x20];   /* +0x00, from p+0x74 */
    unsigned char  block_b[0x30];   /* +0x20, from p      */
    unsigned int   packed;          /* +0x50 */
    unsigned int   key_w;           /* +0x54 */
    unsigned short key_h;           /* +0x58 */
    unsigned char  active;          /* +0x5a */
    unsigned char  _pad_5b[1];      /* +0x5b -> stride 0x5c */
} slot_t;

typedef struct {
    unsigned char _pad_00[0x30];
    unsigned char ok;               /* +0x30 */
    unsigned char _pad_31[0x43];    /* +0x31 .. 0x73 */
    unsigned char blk[0x20];        /* +0x74 */
} req_t;

extern slot_t data_021a071c[4];

void func_02077d08(req_t *p, unsigned int key_w, unsigned short key_h) {
    slot_t *s = data_021a071c;
    int saved = OS_DisableIrq();
    int i;

    p->ok = 0;
    for (i = 0; i < 4; i++, s++) {
        if (s->active != 0 && s->key_w == key_w && s->key_h == key_h) {
            func_02094688(s, p->blk, 0x20);
            func_02094688(s->block_b, p, 0x30);
            s->packed = (unsigned int)(func_020930b0() >> 16);
            p->ok = 1;
            break;
        }
    }
    OS_RestoreIrq(saved);
}
