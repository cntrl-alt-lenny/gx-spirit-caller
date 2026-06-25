/* CAMPAIGN-PREP candidate for func_0208aa0c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     counted loop, signed :1 bitfield guard, BIND arg, tail-ish call
 *   risk:       loop induction (r4+=0x170 vs index*stride) and arg-bind reg may flip; record size/bit position guessed
 *   confidence: med
 */
/* func_0208aa0c — iterate 4 fixed-size records (stride 0x170) at the
 * global data_021a5d3c; for each, test bit 0 of the flags word at
 * +0x110 (signed :1 bitfield -> lsl#31/asr#31) and, if set, call
 * func_0208a864(record, arg).
 *
 *   r4=&data_021a5d3c; r6=r0(arg); r5=0
 * loop:
 *   r0=[r4,#0x110]; lsl#31; asrs#31; beq skip   ; if (bit0) ...
 *   r0=r4; r1=r6; bl func_0208a864
 * skip:
 *   r5++; cmp r5,#4; r4+=0x170; blt loop
 *
 * The lsl#31;asr#31 pair is the signature of a signed 1-bit bitfield
 * read used in a truthiness test; a plain `& 1` would emit `and`/`tst`
 * instead. r6 holds the saved arg across the loop (BIND), r4 walks the
 * array base.
 */
#include <nitro/types.h>

typedef struct Rec_0208aa0c {
    u8 _pad0[0x110];
    struct { s32 active : 1; } flags;   /* +0x110, signed :1 -> lsl/asr */
    u8 _pad114[0x170 - 0x114];
} Rec_0208aa0c;

extern Rec_0208aa0c data_021a5d3c[];
extern void func_0208a864(Rec_0208aa0c *rec, int arg);

void func_0208aa0c(int arg) {
    int i;
    for (i = 0; i < 4; i++) {
        if (data_021a5d3c[i].flags.active) {
            func_0208a864(&data_021a5d3c[i], arg);
        }
    }
}
