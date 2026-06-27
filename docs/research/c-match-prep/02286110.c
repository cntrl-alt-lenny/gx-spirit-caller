/* CAMPAIGN-PREP candidate for func_02286110 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     sub-sp scratch buf; movs slot + bmi early-ret; 3-way arg1 branch dispatch; per-player mla base + slot*0x14 store-order (str val,[slot,base])
 *   risk:       struct-guessed + TRUNCATED-asm: visible half VERIFIED-shape vs excerpt (mla base, mul*0x2bc, clamp>0x14, str ordering all reproduce). Tail past .L_3ec and the 3 pool dispatch consts + 5th-arg `extra` use are unknown -- bodies WILL diverge there. Also reg-alloc shifted (orig r7=arg0/r6=arg1).
 *   confidence: low
 */
typedef unsigned short u16;
typedef unsigned int   u32;
/* WARNING: batch asm is TRUNCATED at .L_3ec (size=444, only ~first half given).
 * Reconstructed from the visible store-dispatch; the post-.L_3ec tail (which
 * consumes the 5th stack arg `extra`, loaded `ldr r5,[sp,#0xe8]`) is UNKNOWN.
 * The 3 dispatch constants V1 / V1+0x47 / V2 are POOL literals absent from the
 * excerpt -- placeholders below; confirm vs the real pool + struct offsets. */
extern char data_ov002_022cd300[];   /* _LIT0 control: bit0 of u16@+4 gate, u16@+0x10 */
extern char data_ov002_022ce288[];   /* _LIT5 source: int@+0x6a4, int@+0x6a8 */
extern char data_ov002_022cf1a2[];   /* _LIT4 per-player 0x868 store table (word at slot+0) */
extern int  func_ov002_02285984(int *dst, int self);
extern int  func_ov002_02285a9c(int self, int kind, int z, int sub, int extra);
extern void func_ov002_021c4c9c(int a, int b, int *out);
#define DISP_V1 0x2bc
#define DISP_V2 0x400   /* placeholder: _LIT2, distinct from V1+0x47 */

int func_ov002_02286110(int arg0, int arg1, int arg2, int arg3, int extra) {
    int buf[0x32];
    int slot;
    int *base;
    func_ov002_02285984(&buf[0], arg0);
    slot = func_ov002_02285a9c(arg0, arg1, 0, arg2, arg3);
    if (slot < 0)
        return slot;
    base = (int *)(data_ov002_022cf1a2 + (arg0 & 1) * 0x868 + slot * 0x14);
    if (*(u16 *)(data_ov002_022cd300 + 4) & 1) {
        if (arg1 == DISP_V1) {
            *base = *(u16 *)(data_ov002_022cd300 + 0x10) * 0x2bc;
        } else if (arg1 == DISP_V1 + 0x47) {
            int v = *(int *)(data_ov002_022ce288 + 0x6a8);
            if (v > 0x14)
                v = 0x14;
            *base = v;
        } else if (arg1 == DISP_V2) {
            *base = *(int *)(data_ov002_022ce288 + 0x6a4);
        }
    }
    func_ov002_021c4c9c(arg0, slot, &buf[0]);
    return slot;
}
