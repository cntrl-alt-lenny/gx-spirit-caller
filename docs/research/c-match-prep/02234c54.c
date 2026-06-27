/* CAMPAIGN-PREP candidate for func_02234c54 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     switch(g+0x5a8-0x7c); store 0x5ac then 0x5b0 in order; parity 0x868 index; sel=bit0
 *   risk:       struct-guessed/permuter-class: asm is TRUNCATED at .L_dc (3 of 5 case bodies missing) so this TU is partial; even the visible prefix risks reg-rotation. Campaign needs full .s before matching.
 *   confidence: low
 */
/* func_ov002_02234c54 (ov002, class D): state dispatch g+0x5a8 (0x7c..0x80),
 * parity index into cf178/d016c 0x868 tables, clears g+0x5ac/0x5b0, store-order
 * sensitive. NOTE: asm body in batch is TRUNCATED at .L_dc (mla into _LIT6 then
 * ldr [_LIT5+0xd78]); cases .L_154/.L_16c/.L_194/.L_1a8 bodies are NOT present,
 * so only the visible prefix (.L_40, .L_88, partial .L_dc) is reconstructed. */
typedef unsigned short u16;

struct Self02234c54 {
    u16 f0;
    u16 bit0 : 1;
    u16 rest : 15;
};

extern char data_ov002_022cd744[];   /* _LIT3 */
extern char data_ov002_022ce288[];   /* g */
extern char data_ov002_022cf16c[];   /* _LIT6 */
extern char data_ov002_022cf178[];   /* _LIT2 */
extern char data_ov002_022d016c[];   /* _LIT4 / _LIT5 */
extern void func_ov002_021ae400(int player, int mask);
extern int  func_ov002_022593f4(void);
extern void func_ov002_022592ec(char *p);
extern void func_ov002_02290500(int player, int f0, char *p);

int func_ov002_02234c54(struct Self02234c54 *self) {
    int b0 = self->bit0;            /* r4 = [r5+2]<<0x1f>>0x1f */
    switch (*(int *)(data_ov002_022ce288 + 0x5a8) - 0x7c) {
    case 0: { /* .L_40: clear two slots, parity-gated helper */
        int v;
        *(int *)(data_ov002_022ce288 + 0x5ac) = 0;
        *(int *)(data_ov002_022ce288 + 0x5b0) = 0;
        b0 = self->bit0;
        v = *(int *)(data_ov002_022cf178 + (b0 & 1) * 0x868);
        if (v == 0) return 0;
        func_ov002_021ae400(b0, 0x1f);
        return 0x7f;
    }
    case 1: { /* .L_88 */
        int v = *(int *)(data_ov002_022cf178 + (b0 & 1) * 0x868);
        if (v == 0) return 0x7d;
        if (*(int *)(data_ov002_022d016c + (b0 << 2)) != 1) {
            func_ov002_022592ec(data_ov002_022d016c);
        } else {
            func_ov002_02290500(b0, self->f0, data_ov002_022d016c);
        }
        return 0x7e;
    }
    case 2: { /* .L_dc: TRUNCATED in source asm; partial */
        if (func_ov002_022593f4() == 0) return 0; /* .L_154 body not in batch */
        /* visible: int parity = 1-? ; mla cf16c ; ldr [cd744+0xd78] ... (incomplete) */
        return 0;
    }
    default:  /* .L_16c / .L_194 / .L_1a8 not present in batch asm */
        return 0;
    }
}
