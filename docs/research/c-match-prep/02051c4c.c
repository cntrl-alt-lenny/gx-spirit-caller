/* CAMPAIGN-PREP candidate for func_02051c4c (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     clone of 02051b10 recipe; f1=0 store-value delta; same mul-index base + guard chain
 *   risk:       Source .s TRUNCATED past .L_294 (no pool/epilogue); tail inferred. The strb f1 store-value (0 vs 1) and the two mov #imm orderings are the only visible clone deltas. struct-guessed.
 *   confidence: low
 */
/* func_02051c4c — main, cls C. Near-clone of func_02051b10; same 12-byte Slot.
   Visible delta vs 02051b10: f1 is set to 0 here (mov r2,#0 before strb) where
   02051b10 set it to 1; and the order of the two 'mov #imm' setups differs.
   NOTE: source .s is TRUNCATED (size=312; visible body ends at 'mov r0,r8'). */
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

int func_02051c4c(int id, int b, int c)
{
    if (b == 0 || c == 0)
        return 0;

    if (id >= 0x64 && gSlotTab[id - 0x64].id != 0) {
        if (gSlotTab[id - 0x64].ptr != 0 && func_020aaf40() != 0)
            return 0;
    } else {
        id = func_0204b3d0();
        if (id == 0)
            return 0;
    }

    /* .L_218: */
    gSlotTab[id - 0x64].id = (unsigned char)id;
    gSlotTab[id - 0x64].f1 = 0;          /* clone delta: 0 here, 1 in 02051b10 */
    gSlotTab[id - 0x64].hslot = 0;
    if (gSlotTab[id - 0x64].ptr != 0)
        func_0204548c(4);

    {
        int n = func_020aaddc(b);
        gSlotTab[id - 0x64].ptr = func_020454cc(4, n + 1);
    }
    if (gSlotTab[id - 0x64].ptr == 0) {
        func_02050054(9, (int)0xfffe82ac);
        return 0;
    }

    /* .L_294: (TRUNCATED — tail inferred) */
    func_020aadf8(gSlotTab[id - 0x64].ptr, b);
    return id;
}
