/* CAMPAIGN-PREP candidate for func_02048050 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     leaf guard + teardown calls + store-order + null global; sp3
 *   risk:       arg ordering of func_0204548c (r0=0,r1=f_24,r2=0) guessed; final `data_0219dc78=0` nulls the pointer global itself, type must be ptr.
 *   confidence: med
 */
/* func_02048050: leaf teardown. If (*data_0219dc78)->f_24 != 0, run
 * func_020403d4/func_0204037c, call func_0204548c(0, f_24, 0), clear
 * f_24; then in all cases null the global pointer data_0219dc78.
 * sp3 routing.
 *
 *     ldr r0,=data_0219dc78; ldr r0,[r0]; ldr r0,[r0,#0x24]; cmp r0,#0; beq .L_4c
 *     bl func_020403d4; bl func_0204037c
 *     ldr r1,=data_0219dc78; mov r0,#0; ldr r1,[r1]; mov r2,r0
 *     ldr r1,[r1,#0x24]; bl func_0204548c      ; f0204548c(0, f_24, 0)
 *     ldr r0,=data_0219dc78; mov r1,#0; ldr r0,[r0]; str r1,[r0,#0x24]  ; f_24 = 0
 *  .L_4c: ldr r0,=data_0219dc78; mov r1,#0; str r1,[r0]   ; data_0219dc78 = NULL */

typedef struct {
    char _pad0[0x24];
    int  f_24;          /* +0x24 */
} state_02048050_t;

extern state_02048050_t *data_0219dc78;
extern void func_020403d4(void);
extern void func_0204037c(void);
extern void func_0204548c(int a, int f24, int c);

void func_02048050(void) {
    if (data_0219dc78->f_24 != 0) {
        func_020403d4();
        func_0204037c();
        func_0204548c(0, data_0219dc78->f_24, 0);
        data_0219dc78->f_24 = 0;
    }
    data_0219dc78 = 0;
}
