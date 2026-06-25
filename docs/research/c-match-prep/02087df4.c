/* CAMPAIGN-PREP candidate for func_02087df4 (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     null guard + signed-short table index + tail call
 *   risk:       data_020c31f8 re-externed as short[] (defined u8[]); arg1 pass-through reg may differ
 *   confidence: med
 */
/* func_02087df4: null guard, scaled signed-halfword table lookup,
 * tail call. data_020c31f8 is read as a signed-short table
 * (ldrsh [base + i*2]); re-extern it with that view.
 */

typedef struct ObjDf4 {
    char _pad_00[0x3c];
    unsigned char byte_3c;   /* +0x3c */
} ObjDf4;

typedef struct EntDf4 {
    ObjDf4 *field_0;         /* +0x00 -> ObjDf4* */
} EntDf4;

extern const short data_020c31f8[128];
extern void func_020951a8(int a, int b, int c);

void func_02087df4(EntDf4 *p, int arg1, int idx) {
    ObjDf4 *obj = p->field_0;

    if (obj == 0) return;
    func_020951a8(obj->byte_3c, arg1, data_020c31f8[idx]);
}
