/* CAMPAIGN-PREP candidate for func_02046b3c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     multi-guard chain + lookup + call, tri-valued return; sp3
 *   risk:       f_24 reloaded after the call (second daec ref) — split refs should match; ==5/==6 may merge into a range compare.
 *   confidence: med
 */
/* func_02046b3c: prerequisite guard chain over data_0219daec; on
 * success look up entry via func_02046888(arg), pass to
 * func_0206255c, return 0 / -1 / -2. sp3 routing.
 *
 *     ldr r1,=data_0219daec; mov r4,r0; ldr r0,[r1]; cmp r0,#0; beq .L_9c
 *     bl func_02045280; cmp r0,#0; bne .L_9c
 *     ldr r0,=data_0219daec; ldr r0,[r0]; ldr r0,[r0,#0x24]
 *     cmp r0,#5; beq .L_a4; cmp r0,#6; beq .L_a4
 *  .L_9c: mvn r0,#0 ; return -1
 *  .L_a4: mov r0,r4; bl func_02046888; cmp r0,#0
 *         mvneq r0,#1; return -2   ; if entry==0
 *         bl func_0206255c; mov r0,#0; return 0 */

typedef struct {
    char _pad0[0x24];
    int  f_24;          /* +0x24 dispatch state */
} state_02046b3c_t;

extern state_02046b3c_t *data_0219daec;
extern int   func_02045280(void);
extern void *func_02046888(int key);
extern void  func_0206255c(void *entry);

int func_02046b3c(int key) {
    if (data_0219daec == 0) return -1;
    if (func_02045280() != 0) return -1;
    if (data_0219daec->f_24 != 5 && data_0219daec->f_24 != 6) return -1;
    {
        void *e = func_02046888(key);
        if (e == 0) return -2;
        func_0206255c(e);
        return 0;
    }
}
