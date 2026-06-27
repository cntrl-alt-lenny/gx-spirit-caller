/* CAMPAIGN-PREP candidate for func_021ae4bc (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     u16 :13 bitfield for lsl#19;lsr#19; stack buf as single local at sp+0
 *   risk:       reshape-able: if a u16 :13 field yields lsl#3;lsr#3 (16-bit) not lsl#19;lsr#19, switch holder to a 32-bit `unsigned int id:13` over an ldr-loaded word.
 *   confidence: med
 */
/* func_ov002_021ae4bc: extract a 13-bit field from a u16 table entry
 * (ldrh + lsl#19;lsr#19), feed it through func_0202b100, then post a
 * 0x31/1 command with a 0x100-byte stack scratch buffer. */

extern char data_ov002_022d0250[];
extern int  func_0202b100(int x);
extern int  func_ov002_0229ce5c(void *buf, int a, int b);
extern int  func_ov002_0229ade0(int cmd, int a, void *buf, int d);

/* u16-backed :13 field => ldrh then lsl#19;lsr#19 (a plain &0x1fff = and). */
struct Ov002Field13 { unsigned short id : 13; };

int func_ov002_021ae4bc(int arg0, int arg1) {
    char buf[0x100];
    int v = func_0202b100(
        ((struct Ov002Field13 *)(data_ov002_022d0250 + arg1 * 4))->id);
    func_ov002_0229ce5c(buf, arg0, v);
    return func_ov002_0229ade0(0x31, 1, buf, arg1);
}
