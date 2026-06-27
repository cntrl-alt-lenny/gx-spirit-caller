/* CAMPAIGN-PREP candidate for func_021b6074 (ov016, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     shifted-or operand-order (accumulator-first); unsigned (x<<23)>>7 for lsl;lsr; store-order pack
 *   risk:       reshape-able: the folded `mov tmp,ip lsl#23; orr w,acc,tmp lsr#7` needs the unsigned-shift form; if mwcc materializes (x<<16)&mask instead, rewrite as ((unsigned)(arg0-0xd)<<23)>>7 exactly (already done) or split.
 *   confidence: med
 */
/* func_ov016_021b6074 (ov016, class D): pack a 6-byte command word/halfword
 * from 4 args and dispatch (func_02005dac handle -> func_020944a4). Same cmd
 * shape as 021b5948. Store-order and shifted-OR operand-order are the levers.
 *
 *  half = (arg3 + 0x2dc) | (arg2 << 0xa) | 0x5000
 *  word = (((arg1+2)&0xff) | 0x40000000) | (((arg0-0xd) << 23) >> 7)
 *         (the <<23>>7 places a 9-bit field at bit 16; emitted as a folded
 *          shifted-orr second operand, so written unsigned to get lsl;lsr). */

extern int  func_02005dac(int a, int b, void *blk);
extern void func_020944a4(void *blk, int handle, int n);

struct cmd_021b6074 {
    int w;
    unsigned short h;
};

int func_ov016_021b6074(int arg0, int arg1, int arg2, int arg3) {
    struct cmd_021b6074 cmd;
    int handle;

    cmd.h = (unsigned short)((arg3 + 0x2dc) | (arg2 << 0xa) | 0x5000);
    cmd.w = (((arg1 + 2) & 0xff) | 0x40000000)
            | (((unsigned int)(arg0 - 0xd) << 23) >> 7);

    handle = func_02005dac(2, 0, &cmd);
    func_020944a4(&cmd, handle, 6);
    return 0;
}
