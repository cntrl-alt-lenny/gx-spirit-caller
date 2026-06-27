/* CAMPAIGN-PREP candidate for func_020142b4 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     0x8d8/0x8e0 :1 bitfield guards; 0x920 cmp-chain + state-2 0x924 jump-table; (x&~1)|1; o[8] stores
 *   risk:       struct-guessed: asm TRUNCATED at .L_944 — state-2 case2/3 and state-3 arms + _LIT consts are reconstructed; verify tail vs full .s. Bit0/1 must stay :1 bitfield not &1 (and-wall).
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_020142b4 (main, class D, MED tier) — prep batch p_0147.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * Drop into src/main/, run ninja + objdiff, then apply the risk note below.
 *   recipe: GetSystemWork :1 bitfield guard (0x8d8 bit0) + 0x920 cmp-chain dispatch (1/2/3);
 *           state-2 0x924 addls jump-table (case1 sets 924=4 falls into case4); bit1 :1 bitfield
 *           test on 0x8e0; (x&~1)|1 for bic;orr; o[8] message stores; bind work base in one local.
 * NOTE: the JSON asm is TRUNCATED at .L_944; the state-2 case-2/3 arms (.L_9a0/.L_944) and the
 * state-3 arm (.L_9e4) plus the literal pool are reconstructed from the sibling family pattern
 * (cf func_02014b28/02014814) — VERIFY tail + _LIT consts against the full .s.
 */
extern char *GetSystemWork(void);
extern void func_0200a26c(int);
extern int  func_020139b4(void);
extern int  func_02019034(void);
extern void func_020195ec(void);
extern int  func_02019640(int);
extern int  func_02019664(void);
extern void func_0201b7b4(void);
extern int  func_0201b7e0(void *);

/* :1 bitfields at byte 0x8d8/0x8e0 so bit-tests emit lsl#k;lsrs#31, not `and #1`. */
struct Flag { unsigned int b0 : 1; unsigned int b1 : 1; };

void func_020142b4(void *o) {
    char *w = GetSystemWork();
    if (((struct Flag *)(w + 0x8d8))->b0 == 0) return;
    switch (*(int *)(w + 0x920)) {
    case 1:
        if (func_020139b4() != 2) return;
        if (func_0201b7e0(o) != 4) return;
        if ((unsigned int)func_02019034() < (unsigned int)(*(int *)(w + 0x8dc) + 1)) return;
        *(int *)(w + 0x900) |= 0x1000000;
        *(int *)((char *)o + 8) = 0x000b0100;
        if (((struct Flag *)(w + 0x8e0))->b1) return;
        func_0200a26c(0xb);
        return;
    case 2:
        switch (*(int *)(w + 0x924)) {
        case 1:
            *(int *)(w + 0x924) = 4;
            /* fallthrough */
        case 4:
            if (func_02019664() != 0x6b) return;
            *(int *)((char *)o + 8) = 0x000b0101;
            *(int *)(w + 0x8e0) = (*(int *)(w + 0x8e0) & ~1) | 1;
            return;
        case 3: /* reconstructed: standard load-done arm */
            if (((struct Flag *)(w + 0x8e0))->b0) return;
            if (func_02019640(0) == 0)
                *(int *)((char *)o + 8) = 0x000b0102;
            else
                *(int *)((char *)o + 8) = 0x000b0103;
            return;
        case 2: /* reconstructed */
            *(int *)((char *)o + 8) = 0x000b0104;
            func_020195ec();
            return;
        }
        return;
    case 3: /* reconstructed: teardown arm */
        *(int *)((char *)o + 8) = 0x000b0105;
        func_0201b7b4();
        return;
    }
}
