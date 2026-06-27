/* CAMPAIGN-PREP candidate for func_0209fae4 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: <<9 bank index, (u16)(1<<chan) bit, masked MMIO set/clr in IRQ crit
 *   risk:       permuter-class/struct-guessed: OS_DisableIrq's return (saved IRQ state) is passed to OS_RestoreIrq - my OS_DisableIrq_save() macro is pseudo; real prototype is `int OS_DisableIrq(void)`. res from f8c8 feeds arg2 of 944a4/9448c (r1), not discarded. Heavy reg-rotation; expect .s.
 *   confidence: low
 */
/* func_0209fae4: per-channel (r1=bit) enable/handoff on a device at r0.
 * class D bitfield/MMIO: base+0x800 is a control block; index <<9 selects a
 * 512-byte channel bank; bit = (u16)(1<<chan). Reads enable masks, optionally
 * advances chan = (chan+1)&3, calls a setup, dispatches to one of two
 * configure fns by r2, then sets/clears bits under OS_DisableIrq.
 */

extern void OS_DisableIrq(void);
extern void OS_RestoreIrq(int s);   /* takes prior state in r0 */
extern int  func_0209448c(int a, int hw);
extern int  func_020944a4(int a, int hw);
extern int  func_0209f8c8(void *dev, void *bank);

struct Ctl0800 {
    unsigned char pad8[8];
    unsigned short chan;    /* +0x08 active channel index */
    unsigned char padA[4];
    unsigned short en;      /* +0x0e enable mask */
    unsigned short hw10;    /* +0x10 hw param */
    unsigned char pad12[6];
    unsigned short flag18;  /* +0x18 */
};

int func_0209fae4(char *dev, int chanbit, int sel) {
    struct Ctl0800 *ctl = (struct Ctl0800 *)(dev + 0x800);
    unsigned short bit = (unsigned short)(1 << chanbit);
    unsigned short *bank;
    int chan;

    if ((ctl->en & bit) == 0) return 0;
    chan = ctl->chan;
    bank = (unsigned short *)(dev + (chan << 9));
    if ((bit & *bank) == 0) {
        if (ctl->flag18 != 1) return 0;
        chan = (chan + 1) & 3;
        bank = (unsigned short *)(dev + (chan << 9));
        if ((bit & *bank) == 0) return 0;
    }
    {
        void *bankp = (void *)(dev + (chan << 9) + 4);
        int res = func_0209f8c8(dev, bankp);
        if (sel != 0) func_020944a4(sel, ctl->hw10);
        else          func_0209448c(0, ctl->hw10);
        (void)res;
    }
    {
        int s;
        unsigned short *clr = (unsigned short *)(dev + (chan << 9));
        unsigned short *set = (unsigned short *)(dev + 2 + (chan << 9));
        OS_DisableIrq_save(s);
        *clr = (unsigned short)(*clr & ~bit);
        *set = (unsigned short)(*set | bit);
        OS_RestoreIrq(s);
    }
    return 0;
}
