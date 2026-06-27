/* CAMPAIGN-PREP candidate for func_02050140 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     0x80-int stack arr; fp+1 src; -1 breaks; atoi base10 store; stacked tail args
 *   risk:       func_0204d97c takes 4 reg args but orig stacks arr(&sp+0x1c) at [sp] and i at [sp+4], passing fp[0],_,a1,_ in regs — the reg/stack split of its 6-ish args is struct-guessed; arg placement likely diverges. struct-guessed.
 *   confidence: low
 */
// func_02050140 — fill a stack array via tokenizer then forward (class C)
// Loops up to 0x80 entries: func_0204e868(buf, fp+1, i) tokenizes; on -1 stop,
// else func_020acca0(buf, 0, 10) parses (atoi base10) into arr[i]. fp=arg2,
// arg1 saved at [sp+8]. arr is the 0x80-int block at sp+0x1c.

extern int func_0204e868(char *dst, char *src, int n);
extern int func_020acca0(char *s, int x, int radix);    // strtol-ish
extern void func_0204d97c(int a, int b, int c, int d);

void func_02050140(int a0, int a1, unsigned char *fp) {
    char buf[0x10];          // sp+0xc
    int arr[0x80];           // sp+0x1c
    int i = 0;               // sl

    do {
        if (func_0204e868(buf, (char *)(fp + 1), i) == -1) break;
        arr[i] = func_020acca0(buf, 0, 10);
        i++;
    } while (i < 0x80);

    func_0204d97c((int)fp[0], a1, (int)arr, i);   // arr,i passed via [sp],[sp+4]
}
