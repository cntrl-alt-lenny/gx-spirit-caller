/* CAMPAIGN-PREP candidate for func_021aa540 (ov022, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     store-order cmd[0x14]/[0x18]; bic|orr mask-insert; switch case-pairs; if-not ternary fields
 *   risk:       reshape-able: orig zero-extends state (lsl#16;lsr#16) before `and #0xf` at cmd[0x14] insert; declare `state` as `unsigned short` param to emit the pair. Tail (enable arm) struct-guessed: 02006e1c/020944a4 order inferred from .extern set.
 *   confidence: low
 */
/* func_ov022_021aa540: build+commit a BgCfg-style command record for `state`,
 * then conditionally query/release the handle when `enable`. 0201d47c/0201e5b8
 * command-record family (cf. JPN twin 021c11f0). Tail after 0201d760 inferred
 * from the .extern set (02006e1c, 020944a4 must be called in the enable arm). */
extern int  data_ov022_021ab9a0[];
extern int  func_02006c0c(int id, int b, int c);
extern void func_0201d47c(void *cmd);
extern void func_0201e5b8(void *cmd);
extern int  func_0201d6d4(int h);
extern void func_0201d760(int h);
extern int  func_02006e1c(int h);
extern void func_020944a4(int a);

int func_ov022_021aa540(int index, int state, int flag, int enable) {
    char cmd[40];
    int h;
    h = func_02006c0c(data_ov022_021ab9a0[index], 4, 0);
    func_0201d47c(cmd);
    *(unsigned short *)(cmd + 0x14) =
        (*(unsigned short *)(cmd + 0x14) & ~0xf) | ((unsigned short)state & 0xf);
    switch (state) {
    case 1:
    case 6:
        *(int *)(cmd + 0x18) =
            (*(int *)(cmd + 0x18) & ~0x1c000) | ((flag ? 2 : 0) << 14);
        break;
    case 2:
    case 7:
        *(int *)(cmd + 0x18) =
            (*(int *)(cmd + 0x18) & ~0x1c000) | ((flag ? 3 : 1) << 14);
        break;
    case 3:
    case 8:
        *(int *)(cmd + 0x18) = (*(int *)(cmd + 0x18) & ~0x1c000) | 0x8000;
        break;
    case 4:
        *(int *)(cmd + 0x18) = (*(int *)(cmd + 0x18) & ~0x1c000) | 0xc000;
        break;
    }
    *(int *)(cmd + 0) = h;
    *(unsigned short *)(cmd + 0x14) |= 0x10;
    func_0201e5b8(cmd);
    if (enable) {
        flag = func_0201d6d4(h);
        func_0201d760(h);
        func_020944a4(func_02006e1c(h));
    }
    return h;
}
