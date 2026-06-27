/* CAMPAIGN-PREP candidate for func_021aa5fc (ov018, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     reload data_021040ac across call; jump-table a1; low-nibble pack; 3-bit field via explicit (v<<29)>>15
 *   risk:       permuter-class: in .L_210/.L_234 the (a2?x:y) ternary lands in a different reg and mwcc orders moveq/movne AFTER the ldr vs target's moveq-before-ldr — a scheduling/reg coin-flip the pack-math (byte-exact otherwise) won't fix without permuter; plus _LIT3/_LIT4 names struct-guessed.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov018_021aa5fc (ov018, class C, MED) — batch p_0138.
 * DISASM-VERIFIED (shown prefix): prologue, the data_021040ac reload across
 * func_02006e1c, the table-index func_02006c0c call, func_0201d47c, and BOTH bitfield
 * packs (low-nibble bic/orr and the 3-bit field via EXPLICIT (v<<29)>>15 = lsl#29/lsr#15)
 * match byte-for-byte. NOTE: batch asm TRUNCATED after .L_26c — the .L_26c store and
 * the .L_27c return are RECONSTRUCTED. _LIT3/_LIT4 symbol identities are INFERRED. */

typedef unsigned int   u32;
typedef unsigned short u16;

extern int  func_02006c0c(int a, int b, int c);
extern void func_02006e1c(int a);
extern void func_0201d47c(void *p);
extern int  func_0201e5b8(void);

extern char data_021040ac[];          /* G: +0x9d0, +0x988, +0x34 (_LIT0/_LIT1/_LIT3) */
extern char data_ov018_021ad738[];
extern char data_ov018_021ad860[];
extern char data_ov018_021ad8a8[];    /* OBJ: r5 struct, +0x14 / +0x18 (_LIT2) */
extern char data_ov018_021ae234[];    /* TBL: jump-table base (_LIT4) */

void func_ov018_021aa5fc(int a0, int a1, int a2, int a3) {
    char *obj = data_ov018_021ad8a8;
    int  *tbl;
    int   job;
    int   w;

    if (*(int *)(data_021040ac + 0x9d0) != 0) {
        func_02006e1c(*(int *)(data_021040ac + 0x988));
        *(int *)(data_021040ac + 0x988) = 0;
    }

    tbl = (int *)(data_ov018_021ae234
                  + (*(int *)(data_021040ac + 0x34) << 5));
    job = func_02006c0c(tbl[a0], 4, 0);
    *(int *)(data_021040ac + 0x988) = job;

    func_0201d47c(obj);

    *(u16 *)(obj + 0x14) =
        (u16)((*(u16 *)(obj + 0x14) & ~0xf) | (((u32)(a1 << 0x10) >> 0x10) & 0xf));

    switch (a1) {
    case 1:
    case 6:
        w = *(int *)(obj + 0x18);
        *(int *)(obj + 0x18) =
            (w & ~0x1c000) | (((u32)(((a2 != 0) ? 2 : 0) << 0x1d)) >> 0xf);
        break;
    case 2:
    case 7:
        w = *(int *)(obj + 0x18);
        *(int *)(obj + 0x18) =
            (w & ~0x1c000) | (((u32)(((a2 != 0) ? 3 : 1) << 0x1d)) >> 0xf);
        break;
    case 3:
    case 8:
        *(int *)(obj + 0x18) = (*(int *)(obj + 0x18) & ~0x1c000) | 0x8000;
        break;
    case 4:   /* .L_26c, store reconstructed */
        *(int *)(obj + 0x18) = (*(int *)(obj + 0x18) & ~0x1c000) | 0xc000;
        break;
    default:  /* 0, 5, >8 -> .L_27c */
        break;
    }
}
