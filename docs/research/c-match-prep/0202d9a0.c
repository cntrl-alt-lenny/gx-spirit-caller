/* CAMPAIGN-PREP candidate for func_0202d9a0 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     bind-once counter increment + wrap if-assign
 *   risk:       movge/strge wrap may emit as ternary store; field offsets guessed; +0x60 limit add may CSE differently
 *   confidence: med
 */
/* func_0202d9a0: leaf counter bump with a wrap guard. Global base
 * held in r0 across all accesses (bind-once). Returns 0 if the
 * global is inactive, else 1. Inner: if field_24 set, increment
 * field_10 and wrap it to 0 once it reaches field_08+0x60.
 *
 *     ldr r0,_LIT0; ldr r1,[r0]; cmp r1,#0; moveq r0,#0; bxeq lr
 *     ldr r1,[r0,#0x64]; add r1,r1,#1; str r1,[r0,#0x64]
 *     ldr r1,[r0,#0x24]; cmp r1,#0; beq .L
 *     ldr r1,[r0,#0x10]; add r2,r1,#1; str r2,[r0,#0x10]
 *     ldr r1,[r0,#0x8]; add r1,r1,#0x60; cmp r2,r1
 *     movge r1,#0; strge r1,[r0,#0x10]
 *  .L: mov r0,#1; bx lr
 */

typedef struct {
    int active;         /* +0x00 */
    char _pad_04[0x04];
    int field_08;       /* +0x08 */
    char _pad_0c[0x04];
    int field_10;       /* +0x10 */
    char _pad_14[0x10];
    int field_24;       /* +0x24 */
    char _pad_28[0x3c];
    int field_64;       /* +0x64 */
} C_0202d9a0;

extern C_0202d9a0 data_0219ad48;

int func_0202d9a0(void) {
    C_0202d9a0 *p = &data_0219ad48;

    if (p->active == 0) return 0;

    p->field_64++;

    if (p->field_24 != 0) {
        int t = p->field_10 + 1;
        p->field_10 = t;
        if (t >= p->field_08 + 0x60) p->field_10 = 0;
    }
    return 1;
}
