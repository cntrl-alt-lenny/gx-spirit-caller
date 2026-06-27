/* CAMPAIGN-PREP candidate for func_0201d620 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     u16 header count/offset; manual byte-swap repack; variable-stride scan, key compared once
 *   risk:       permuter-class: orig's halfword byte-swap is a long lsl/lsr/asr/and/orr chain across r1,r4,ip,lr,r5; mwcc will not reproduce that exact 15-instr sequence from `(key>>8&0xff)|(key&0xff)<<8` — the swap region is scheduling/regalloc-bound.
 *   confidence: low
 */
/* func_0201d620 (main, class D) — byte-swap a 16-bit key then linear-scan a
 * variable-stride record list. Header: count=u16[0xe], firstoff=u16[0xc].
 * Each record: word[0]=key (compared), word[1]=stride to next. Returns the
 * matching record pointer, else 0. The key arg is byte-swapped via the
 * lsl/lsr/asr/and/orr repack the asm spells out (swap low/high bytes of the
 * low halfword). */
struct rec0201d620 {
    unsigned short f0;
    unsigned short fe;
};

char *func_0201d620(char *base, unsigned int key) {
    int count = *(unsigned short *)(base + 0xe);
    char *p = base + *(unsigned short *)(base + 0xc);
    unsigned int k;
    int i;
    if (count <= 0)
        return (char *)0;
    /* swap the two bytes of the low halfword of key */
    k = ((key >> 8) & 0xff) | ((key & 0xff) << 8);
    k = (k & 0xffff);
    for (i = 0; i < count; i++) {
        if (*(int *)p == (int)k)
            return p;
        p += *(int *)(p + 0x4);
    }
    return (char *)0;
}
