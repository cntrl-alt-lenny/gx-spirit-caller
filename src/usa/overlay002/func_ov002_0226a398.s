; func_ov002_0226a398 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce4a8
        .extern IsValue12D3Or147E
        .global func_ov002_0226a398
        .arm
func_ov002_0226a398:
    stmdb sp!, {r3, r4, r5, lr}
    subs r4, r1, #0x1
    bmi .L_958
    ldr r1, _LIT0
    mov r0, #0x18
    mla r5, r4, r0, r1
.L_900:
    ldrh r0, [r5]
    bl IsValue12D3Or147E
    cmp r0, #0x0
    bne .L_94c
    ldrh r0, [r5, #0x4]
    orr r2, r0, #0x2
    mov r0, r2, lsl #0x1e
    mov r0, r0, lsr #0x1f
    bic r1, r2, #0x4
    mov r0, r0, lsl #0x1f
    orr r0, r1, r0, lsr #0x1d
    strh r0, [r5, #0x4]
    ldrh r1, [r5, #0x4]
    mov r0, r1, lsl #0x1d
    mov r0, r0, lsr #0x1f
    bic r1, r1, #0x8
    mov r0, r0, lsl #0x1f
    orr r0, r1, r0, lsr #0x1c
    strh r0, [r5, #0x4]
.L_94c:
    sub r5, r5, #0x18
    subs r4, r4, #0x1
    bpl .L_900
.L_958:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022ce4a8
