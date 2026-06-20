; func_ov002_022b303c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021040ac
        .extern data_02104bac
        .extern func_0201d5c0
        .extern func_0208cf44
        .extern func_0208cf58
        .extern func_0208d8c0
        .extern func_ov002_022b31a4
        .extern func_ov002_022b32c8
        .extern func_ov002_022b3434
        .extern func_ov002_022b3448
        .extern func_ov002_022b35d8
        .global func_ov002_022b303c
        .arm
func_ov002_022b303c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, _LIT0
    str r1, [r4, #0x4]
    ldrh r0, [r0, #0x52]
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    str r0, [r4, #0x64]
    ldr r0, [r4]
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    cmp r1, #0x0
    beq .L_118
    mov r2, #0x4000000
    ldr r1, [r2]
    ldr r0, [r2]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    bic r0, r3, #0x1e
    orr r0, r1, r0, lsl #0x8
    str r0, [r2]
    bl func_0208cf58
    bl func_0208cf44
    mov r0, #0x60
    bl func_0208d8c0
    mov r3, #0x4000000
    ldr r2, [r3]
    ldr r1, _LIT1
    mov r0, #0x4
    and r1, r2, r1
    orr r2, r1, #0x10
    mov r1, #0x0
    str r2, [r3]
    bl func_0201d5c0
    mov r0, r4
    bl func_ov002_022b31a4
    mov r0, r4
    mov r1, #0x0
    ldr r2, [r4, #0x34]
    bl func_ov002_022b32c8
    mov r0, r4
    mov r1, #0x1
    ldr r2, [r4, #0x38]
    bl func_ov002_022b32c8
    mov r0, r4
    ldr r1, [r4, #0xc]
    bl func_ov002_022b3434
    mov r0, r4
    ldr r1, [r4, #0x10]
    bl func_ov002_022b3448
    ldr r0, [r4, #0x68]
    cmp r0, #0x0
    beq .L_f0
    ldr r1, _LIT2
    mov r0, r4
    ldr r1, [r1, #0xb9c]
    mov r2, #0x1
    bl func_ov002_022b35d8
.L_f0:
    mov r2, #0x4000000
    ldr r1, [r2]
    ldr r0, [r2]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    orr r0, r3, #0x10
    orr r0, r1, r0, lsl #0x8
    str r0, [r2]
    ldmia sp!, {r4, pc}
.L_118:
    bl func_0208cf58
    bl func_0208cf44
    mov r2, #0x4000000
    ldr r1, [r2]
    ldr r0, [r2]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    bic r0, r3, #0x1e
    orr r0, r1, r0, lsl #0x8
    str r0, [r2]
    ldr r1, [r2]
    mov r0, #0x0
    bic r1, r1, #0xe000
    str r1, [r2]
    strh r0, [r2, #0x50]
    ldmia sp!, {r4, pc}
_LIT0: .word data_02104bac
_LIT1: .word 0xffcfffef
_LIT2: .word data_021040ac
