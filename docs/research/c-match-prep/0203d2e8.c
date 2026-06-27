/* CAMPAIGN-PREP candidate for func_0203d2e8 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D: :4 bitfield at 0xd0c (lsl;lsr), signed short f2c (asr#4); reload b->mode per chain (asm re-ldrb both times)
 *   risk:       asm RELOADS [r4,#0xd0c] at the start of each chain (two ldrb). If mwcc caches b->mode in a reg across both, the second ldrb vanishes -- reshape-able: read b->mode separately in each chain (already done) but mwcc may still CSE; otherwise permuter-class.
 *   confidence: med
 */
/* func_0203d2e8 - main - class D (bitfield) + class C
 * two identical guard chains; nibble bitfield at base+0xd0c (low :4),
 * signed (s2c>>4)&1 bit test, then a sub-handler call returning 6 or 7.
 * base = func_0203c900(0x10); r5 = param held across both chains.
 */
typedef struct {
    unsigned char _pad0[0x2c];
    short f2c;            /* +0x2c : signed -> asr#4 */
} Obj;

typedef struct {
    unsigned char _pad0[0xd0c];
    unsigned char mode:4; /* +0xd0c low nibble : lsl#1c;lsr#1c */
    unsigned char modehi:4;
} Base;

extern Base *func_0203c900(int sel);
extern int func_0203f6a0(void *p);
extern int func_0203f740(void *p);

int func_0203d2e8(Obj *obj)
{
    Base *b;
    int m;

    b = func_0203c900(0x10);
    m = b->mode;
    if ((m == 0 || m == 4) && ((obj->f2c >> 4) & 1) == 1) {
        if (func_0203f6a0((char *)obj + 0xc) == 1)
            return 6;
    }
    m = b->mode;
    if ((m == 0 || m == 5) && ((obj->f2c >> 4) & 1) == 1) {
        if (func_0203f740((char *)obj + 0xc) == 1)
            return 7;
    }
    return -1;
}
