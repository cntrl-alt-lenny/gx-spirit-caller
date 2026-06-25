/* CAMPAIGN-PREP candidate for func_02029204 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     single-load bitfield && guard chain; reload-after-call for b4; if(!b2)/else-if
 *   risk:       BB ordering of func_02029a88 (out-of-line a58) and reload of flags at a5c sensitive; offsets guessed
 *   confidence: med
 */
/* func_02029204 — bitfield guard chain dispatching to calls */
typedef unsigned short u16;

typedef struct Obj29204 {
    char _pad0[0x188];
    int  field188;                                  /* 0x188 — ptr/int, != 0 guard */
    char _pad1[0x19a - 0x18c];                       /* 0x18c .. 0x19a */
    u16  b0:1, b1:1, b2:1, b3:1, b4:1, b5:1, b6:1;  /* 0x19a */
} Obj29204;

extern void func_020294c0(Obj29204 *p);
extern void func_02029a88(void);
extern void func_02029f74(Obj29204 *p);

int func_02029204(Obj29204 *p) {
    if (p->b0 && p->b1) {
        if (!p->b2)
            func_02029a88();
        else if (!(p->b5 && p->b6))
            func_020294c0(p);
        if (p->b4 && p->field188)
            func_02029f74(p);
    }
    return 1;
}
