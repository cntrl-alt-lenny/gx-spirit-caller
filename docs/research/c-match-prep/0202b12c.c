/* CAMPAIGN-PREP candidate for func_0202b12c (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     :3 bitfield index into ptr table; two cursors (i src, d store); do/while peeks lookahead
 *   risk:       reshape-able/permuter-class: orig uses distinct regs for src-offset i (r2) and store pointer lr; if mwcc collapses them to one induction var the strb addressing (buf[i] vs *d++) and the post-inc lookahead reorder. :3 field offset struct-guessed.
 *   confidence: med
 */
/* func_0202b12c (main, class D): copy signed-char string src into a 0x20 stack
 * buffer, replacing each '#' (0x23) with the byte *rep, then call func_02098038
 * on the buffer. rep = data_020be77c[ (data_02104f4c.f4 & 7) ] (a :3 bitfield
 * at +4 indexes a pointer table). Two cursors: i indexes src + final NUL, a
 * separate moving pointer d does the stores (matches r2 vs lr in the .s).
 * Loop peeks src[i] AFTER the post-increment (do/while on the lookahead).
 * struct-guessed: :3 field at byte +4 of data_02104f4c. */
extern void func_02098038(char *s);
struct Cfg02104f4c { char _0[4]; unsigned int f4 : 3; };
extern struct Cfg02104f4c data_02104f4c;
extern signed char *data_020be77c[];

int func_0202b12c(signed char *src) {
    char buf[0x20];
    char *d;
    int i = 0;
    signed char c;

    if (src[0] != 0) {
        signed char *rep = data_020be77c[data_02104f4c.f4];
        d = buf;
        do {
            c = src[i];
            i++;
            *d = c;
            if (c == 0x23)
                *d = *rep;
            d++;
        } while (src[i] != 0);
    }
    buf[i] = 0;
    func_02098038(buf);
    return 0;
}
