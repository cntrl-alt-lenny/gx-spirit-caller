/* CAMPAIGN-PREP candidate for func_02046a5c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard + ptr-arith out-param + byte dispatch + tail calls; sp3
 *   risk:       b369 double-read needs separate || operands (not a cached temp); 0x624 materialized as pool word — magnitude may inline as imm.
 *   confidence: med
 */
/* func_02046a5c: guard on global ptr data_0219daec; write
 * (*data_0219daec + 0x624) into *out; then dispatch on the byte at
 * +0x369 of *data_0219daec: ==2 or ==3 tail-call func_0204f8f0(out),
 * else tail-call func_0204f998(out). sp3 routing.
 *
 *     ldr r2,=data_0219daec; ldr r3,[r2]; cmp r3,#0
 *     moveq r0,#0; return                    ; if(!*daec) ret 0
 *     ldr r1,=0x624; add r1,r3,r1; str r1,[r0]; *out = (char*)*daec+0x624
 *     ldr r2,[r2]; ldrb r1,[r2,#0x369]; cmp r1,#2; beq .L_d4
 *     ldrb r1,[r2,#0x369]; cmp r1,#3; bne .L_e0
 *  .L_d4: bl func_0204f8f0; return
 *  .L_e0: bl func_0204f998; return
 *
 * r0 (the out pointer) is preserved into both tail calls. The struct
 * base is reloaded for the byte test (separate global reference). The
 * b369 byte is read twice (once per compare). */

typedef struct {
    char          _pad0[0x369];
    unsigned char b_369;        /* +0x369 */
} state_02046a5c_t;

extern state_02046a5c_t *data_0219daec;
extern int func_0204f8f0(void **out);
extern int func_0204f998(void **out);

int func_02046a5c(void **out) {
    if (data_0219daec == 0) return 0;
    *out = (void *)((char *)data_0219daec + 0x624);
    if (data_0219daec->b_369 == 2 || data_0219daec->b_369 == 3)
        return func_0204f8f0(out);
    return func_0204f998(out);
}
