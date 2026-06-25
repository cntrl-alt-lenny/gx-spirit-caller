/* CAMPAIGN-PREP candidate for func_02046ae0 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     null-guard + byte dispatch + (call+1) tails; sp3 tier
 *   risk:       b369 must be re-loaded per compare (two ldrb) — caching in a local would emit one ldrb and diverge.
 *   confidence: high
 */
/* func_02046ae0: guard on global ptr data_0219daec; dispatch on the
 * byte at +0x369: ==2 or ==3 -> func_0204fa24()+1, else
 * func_0204fa50()+1. sp3 routing.
 *
 *     ldr r0,=data_0219daec; ldr r1,[r0]; cmp r1,#0
 *     moveq r0,#0; return                  ; if(!*daec) ret 0
 *     ldrb r0,[r1,#0x369]; cmp r0,#2; beq .L_38
 *     ldrb r0,[r1,#0x369]; cmp r0,#3; bne .L_48
 *  .L_38: bl func_0204fa24; add r0,r0,#1; return
 *  .L_48: bl func_0204fa50; add r0,r0,#1; return
 *
 * Here data_0219daec is dereferenced directly (r1=*daec) and the
 * b369 byte is read twice (one ldrb per compare). */

typedef struct {
    char          _pad0[0x369];
    unsigned char b_369;        /* +0x369 */
} state_02046ae0_t;

extern state_02046ae0_t *data_0219daec;
extern int func_0204fa24(void);
extern int func_0204fa50(void);

int func_02046ae0(void) {
    if (data_0219daec == 0) return 0;
    if (data_0219daec->b_369 == 2 || data_0219daec->b_369 == 3)
        return func_0204fa24() + 1;
    return func_0204fa50() + 1;
}
