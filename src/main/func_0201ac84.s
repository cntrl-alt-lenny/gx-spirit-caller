; func_0201ac84 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern func_020191dc
        .extern func_02019210
        .extern func_0201942c
        .global func_0201ac84
        .arm
func_0201ac84:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    bl GetSystemWork
    mov r4, r0
    mov r0, r6
    bl func_02019210
    sub r2, r0, #0x1
    mov r1, #0x18
    mov r0, r6
    mla r5, r2, r1, r4
    bl func_020191dc
    ldr r1, [r4, #0x8d0]
    mov r0, r6, lsl #0x18
    bic r1, r1, #0xff0
    orr r0, r1, r0, lsr #0x14
    str r0, [r4, #0x8d0]
    ldr r2, [r5, #0x10]
    mov r0, r6
    mov r1, r2, lsl #0x14
    mov r1, r1, lsr #0x18
    add r1, r1, #0x1
    bic r2, r2, #0xff0
    mov r1, r1, lsl #0x18
    orr r1, r2, r1, lsr #0x14
    str r1, [r5, #0x10]
    bl func_0201942c
    cmp r0, #0x0
    beq .L_b8
    ldr r1, [r4, #0x8d4]
    mov r0, #0x10000
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    ldr r2, [r4, #0x8e4]
    rsb r0, r0, #0x0
    and r2, r2, r0
    mov r0, r1, lsl #0x10
    orr r0, r2, r0, lsr #0x10
    str r0, [r4, #0x8e4]
    ldr r1, [r4, #0x8e0]
    ldr r0, _LIT0
    and r0, r1, r0
    str r0, [r4, #0x8e0]
    ldr r0, [r4, #0x900]
    orr r0, r0, #0x100
    str r0, [r4, #0x900]
    b .L_f8
.L_b8:
    ldr r2, [r4, #0x8e0]
    mov r0, r2, lsl #0xb
    mov r0, r0, lsr #0x18
    add r1, r0, #0x1
    cmp r1, #0xff
    ldr r0, _LIT0
    bls .L_e8
    and r0, r2, r0
    orr r0, r0, #0xfe000
    orr r0, r0, #0x100000
    str r0, [r4, #0x8e0]
    b .L_f8
.L_e8:
    mov r1, r1, lsl #0x18
    and r0, r2, r0
    orr r0, r0, r1, lsr #0xb
    str r0, [r4, #0x8e0]
.L_f8:
    ldr r0, [r4, #0x8e0]
    bic r0, r0, #0x1
    str r0, [r4, #0x8e0]
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0xffe01fff
