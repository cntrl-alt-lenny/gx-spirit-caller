/* CAMPAIGN-PREP candidate for func_0209423c (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D bitfield: 2-bit :2 top field => bic+orr lsl#30; load cb before clearing status
 *   risk:       the bic#0xc0000000+orr,lsl#30 RMW: a :2 bitfield at bit30 emits exactly this, but mwcc volatile bitfield store may add a re-load; if it reads-back differently, 1 ldr diverges. struct-guessed (offsets) + reshape-able.
 *   confidence: med
 */
// func_0209423c — VRAM/engine bank reconfig: RMW 2-bit field in 0x04000600, then blx stored cb
// data_021a6710: ctx { x0 status, ..., +0x10 cb, +0x14 cb_arg, +0x18 mode2, +0x1c arg }

extern void func_020905dc(int mask);
extern void func_020907b4(int mask, int arg);

typedef struct {
    int  status;   // 0x0
    char pad4[0xc];
    int  (*cb)();  // 0x10
    int  cb_arg;   // 0x14
    int  mode2;    // 0x18  (2-bit value -> bits 30..31)
    int  arg1c;    // 0x1c
} Ctx;
extern Ctx data_021a6710;

typedef struct { unsigned int field30 : 30; unsigned int top2 : 2; } Reg0600;
#define REG0600 (*(volatile Reg0600 *)0x04000600)

void func_0209423c(void) {
    int arg;
    int (*cb)();

    func_020905dc(0x200000);
    REG0600.top2 = data_021a6710.mode2;
    arg = data_021a6710.arg1c;
    func_020907b4(0x200000, arg);
    cb = data_021a6710.cb;
    data_021a6710.status = 0;
    if (data_021a6710.cb_arg == 0)
        return;
    cb();
}
