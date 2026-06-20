; func_ov002_022a2a40 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021afbc4
        .global func_ov002_022a2a40
        .arm
func_ov002_022a2a40:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x8
    ldr r3, [r1, #0x4]
    mov r5, r0
    mov r4, r2
    cmp r3, #0x5
    beq .L_28
    cmp r3, #0x6
    cmpne r3, #0x9
    b .L_70
.L_28:
    ldr r3, _LIT0
    mov r2, r4, lsr #0x1f
    smull r0, lr, r3, r4
    smull r0, ip, r3, r4
    add ip, r2, ip, asr #0x2
    add lr, r2, lr, asr #0x2
    mov r3, #0xa
    smull r0, r2, r3, lr
    sub lr, r4, r0
    mov r0, lr, lsl #0x4
    add r2, r0, #0x38
    ldr r1, [r1, #0x30]
    mov r0, ip, lsl #0x4
    add r0, r0, r1, lsl #0x3
    add r0, r0, #0x8
    str r2, [sp]
    str r0, [sp, #0x4]
    b .L_d0
.L_70:
    cmp r3, #0x0
    bge .L_b0
    bl func_ov002_021afbc4
    cmp r0, #0x6
    movgt r0, #0x6
    bgt .L_8c
    bl func_ov002_021afbc4
.L_8c:
    mov r0, r0, lsl #0x5
    add r0, r0, r0, lsr #0x1f
    mov r0, r0, asr #0x1
    rsb r0, r0, #0x90
    add r1, r0, r4, lsl #0x5
    mov r0, #0x4a
    str r1, [sp]
    str r0, [sp, #0x4]
    b .L_d0
.L_b0:
    mov r0, #0x18
    mul r2, r4, r0
    ldr r0, [r1, #0x30]
    add r1, r2, #0x40
    mov r0, r0, lsl #0x3
    add r0, r0, #0x8
    str r1, [sp]
    str r0, [sp, #0x4]
.L_d0:
    ldr r1, [sp]
    ldr r0, [sp, #0x4]
    str r1, [r5]
    str r0, [r5, #0x4]
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x66666667
