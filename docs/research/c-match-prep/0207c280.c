/* CAMPAIGN-PREP candidate for func_0207c280 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     guard polarity = if(fail){restore;return} (matches beq-over-return); reload global per store, ordered
 *   risk:       asm TRUNCATED after final `bl func_0209360c`: tail (RestoreIrq+return 0) and `_LIT1` value are reconstructed/guessed (LIT1=0x2000 placeholder). Plus global-reload-vs-CSE same as 0207b408. struct-guessed (unknown tail + literal).
 *   confidence: low
 */
/* func_0207c280: guarded subsystem init. r0=handle(r6), r1=size(r5).
 * irq = OS_DisableIrq();
 * if (*data_021a088c != 0)            { OS_RestoreIrq(irq); return 1; }
 * if (handle == 0)                    { OS_RestoreIrq(irq); return 1; }
 * if (handle & 0x1f)                  { OS_RestoreIrq(irq); return 1; }
 * if (size < 0x2300)                  { OS_RestoreIrq(irq); return 6; }
 * *data_021a088c = handle;
 * base+0x2000: [0x260]=1(int); [0x26a]=0(byte); [0x26b]=0(byte);
 * base+0x2200: [0x80]=0(half); [0x68]=0(half); [0x82]=0(half); [0xf8]=0(half);
 * func_0207b230(); func_0207cd7c();
 * if (func_020931e8()==0) func_020931f8();
 * if (func_0209361c()==0) func_0209362c();
 * func_0209360c(*data_021a088c + LIT1);
 * NOTE: asm listing truncates after the final bl; tail (RestoreIrq + return 0)
 * is reconstructed -- see risk flag.
 */
extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int);
extern char *data_021a088c;
extern void func_0207b230(void);
extern void func_0207cd7c(void);
extern int func_020931e8(void);
extern void func_020931f8(void);
extern int func_0209361c(void);
extern void func_0209362c(void);
extern void func_0209360c(void *);

#define LIT1 0x2000   /* _LIT1 word feeding func_0209360c offset (UNKNOWN literal, struct-guessed) */

int func_0207c280(unsigned int handle, unsigned int size) {
    int irq = OS_DisableIrq();
    char *base;

    if ((int)data_021a088c != 0) { OS_RestoreIrq(irq); return 1; }
    if (handle == 0)             { OS_RestoreIrq(irq); return 1; }
    if (handle & 0x1f)           { OS_RestoreIrq(irq); return 1; }
    if (size < 0x2300)           { OS_RestoreIrq(irq); return 6; }

    data_021a088c = (char *)handle;

    base = (char *)handle + 0x2000;
    *(int *)(base + 0x260) = 1;

    base = data_021a088c + 0x2200;
    *(short *)(base + 0x80) = 0;
    base = data_021a088c + 0x2200;
    *(short *)(base + 0x68) = 0;
    base = data_021a088c + 0x2000;
    *(unsigned char *)(base + 0x26a) = 0;
    base = data_021a088c + 0x2000;
    *(unsigned char *)(base + 0x26b) = 0;
    base = data_021a088c + 0x2200;
    *(short *)(base + 0x82) = 0;
    base = data_021a088c + 0x2200;
    *(short *)(base + 0xf8) = 0;

    func_0207b230();
    func_0207cd7c();
    if (func_020931e8() == 0) func_020931f8();
    if (func_0209361c() == 0) func_0209362c();
    func_0209360c(data_021a088c + LIT1);

    OS_RestoreIrq(irq);
    return 0;
}
