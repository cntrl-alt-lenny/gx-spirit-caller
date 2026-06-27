/* CAMPAIGN-PREP candidate for func_0203e540 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS C: result-reuse in r4 (sel then result); CLASS D high-nibble :4 at 0xd0b; case 3/4/5 order follows source; ||/&& match the guard
 *   risk:       struct-guessed (d16 offset via 0xd00+0x16 flattening is fragile). Also asm tests cmp #3/#4/#5 as a beq cascade not a jump table -- if mwcc builds a switch table for 3 dense cases the dispatch diverges; reshape-able by keeping if/else-if (done).
 *   confidence: low
 */
/* func_0203e540 - main - class D + class C
 * switch(sel) over {3,4,5}; result kept in one reused local (r4=sel then
 * result). High-nibble :4 at base+0xd0b (>=1 ->6) gates func_0203e870.
 * r5 = base param, held across the whole body.
 */
typedef struct {
    unsigned char _pad0[0xd0b];
    unsigned char d0b_lo:4;
    unsigned char d0b_hi:4;   /* +0xd0b bit4 : lsl#18;lsr#1c */
    unsigned char _d0c[5];
    unsigned char d11_pad[7];
    unsigned char d12;        /* +0xd12 */
    unsigned char _x[0xd00+0x16-0xd13];
    unsigned short d16;       /* +0xd00+0x16 */
} Base;

extern int  func_0203e254(int sel);
extern int  func_0203e400(Base *b);
extern int  func_0203e870(void);
extern void func_0203e9ac(int);

int func_0203e540(Base *b, int sel)
{
    int r;

    r = sel;
    if (sel == 3) {
        if (b->d12 != 0 || b->d16 != 0) {
            if (func_0203e254(1) != 0) {
                r = 4;
            } else {
                r = func_0203e400(b);
            }
        } else if (b->d0b_hi >= 1) {
            r = 6;
        } else {
            r = func_0203e870();
        }
    } else if (sel == 4) {
        r = func_0203e400(b);
    } else if (sel == 5) {
        if (b->d0b_hi >= 1)
            r = 6;
        else
            r = func_0203e870();
    }
    func_0203e9ac(r);
    return r;
}
