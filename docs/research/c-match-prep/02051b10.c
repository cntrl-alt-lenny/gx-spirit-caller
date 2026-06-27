/* CAMPAIGN-PREP candidate for func_02051b10 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     mul-index struct array base[id-0x64]; guard chain; bind ptr field reload per orig
 *   risk:       Source .s TRUNCATED past .L_15c (no pool/epilogue) so tail+_LIT4/5 are inferred; whole-function byte-match unverifiable. struct-guessed.
 *   confidence: low
 */
/* func_02051b10 — main, cls C. mul-index (stride 12) table writes + guards.
   NOTE: source .s is TRUNCATED (size=316/79 insns; visible body ends at
   'ldr r1,_LIT5' with no epilogue and no literal pool). Tail + pool inferred. */
typedef struct {
    unsigned char  id;      /* +0  data_0219dcb4 */
    unsigned char  f1;      /* +1  data_0219dcb5 */
    unsigned char  f2;      /* +2  data_0219dcb6 */
    unsigned char  _pad3;
    unsigned short hslot;   /* +4  data_0219dcb8 */
    unsigned char  _pad6[2];
    void          *ptr;     /* +8  data_0219dcbc */
} Slot;                     /* sizeof == 0x0c */

extern Slot gSlotTab[];     /* base data_0219dcb4 */

extern int  func_0204b3d0(void);
extern int  func_020aaf40(void);
extern int  func_020aaddc(int b);
extern void *func_020454cc(int a, int n);
extern void func_0204548c(int a);
extern void func_02050054(int a, int b);
extern void func_020aadf8(void *p, int b);

int func_02051b10(int id, int b, int c)
{
    if (b == 0 || c == 0)
        return 0;

    if (id >= 0x64 && gSlotTab[id - 0x64].id != 0) {
        if (gSlotTab[id - 0x64].ptr != 0 && func_020aaf40() != 0)
            return 0;
        /* fall through to reinit (.L_dc) */
    } else {
        id = func_0204b3d0();
        if (id == 0)
            return 0;
    }

    /* .L_dc: (re)initialise the slot */
    gSlotTab[id - 0x64].id = (unsigned char)id;
    gSlotTab[id - 0x64].f1 = 1;
    gSlotTab[id - 0x64].hslot = 0;
    if (gSlotTab[id - 0x64].ptr != 0)
        func_0204548c(4);

    {
        int n = func_020aaddc(b);
        gSlotTab[id - 0x64].ptr = func_020454cc(4, n + 1);
    }
    if (gSlotTab[id - 0x64].ptr == 0) {
        func_02050054(9, (int)0xfffe82ac); /* _LIT4 placeholder */
        return 0;
    }

    /* .L_15c: (TRUNCATED in source — tail inferred) */
    func_020aadf8(gSlotTab[id - 0x64].ptr, b);
    return id;
}
