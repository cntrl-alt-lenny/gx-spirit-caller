; func_0207bfd4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_021a088c
        .extern func_0207ab68
        .extern func_0207ae74
        .extern func_0207b038
        .extern func_0207b408
        .extern func_0209de74
        .extern func_0209e0f0
        .extern func_0209e4f8
        .extern func_0209e8d0
        .extern func_0209f1b0
        .global func_0207bfd4
        .arm
func_0207bfd4:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, r1
    bl OS_DisableIrq
    ldr r1, _LIT0
    mov r4, r0
    ldr r1, [r1]
    cmp r1, #0x0
    bne .L_9dc
    bl OS_RestoreIrq
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
.L_9dc:
    add r1, r1, #0x2000
    ldr r1, [r1, #0x260]
    cmp r1, #0x1
    beq .L_a00
    cmp r1, #0x2
    beq .L_a10
    cmp r1, #0x3
    beq .L_a20
    b .L_a30
.L_a00:
    mov r0, r6
    mov r1, r5
    bl func_0207b408
    b .L_a40
.L_a10:
    bl OS_RestoreIrq
    mov r0, #0x2
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
.L_a20:
    bl OS_RestoreIrq
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
.L_a30:
    bl OS_RestoreIrq
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
.L_a40:
    ldr r0, _LIT0
    ldr r0, [r0]
    add r1, r0, #0x2000
    ldr r1, [r1, #0x26c]
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    bl func_0209e0f0
    cmp r0, #0x6
    addls pc, pc, r0, lsl #0x2
    b .L_ab4
    b .L_ad0
    b .L_ab4
    b .L_ab4
    b .L_a84
    b .L_aa0
    b .L_ab4
    b .L_ab4
.L_a84:
    mov r0, #0xb
    bl func_0207b038
    mov r0, r4
    bl OS_RestoreIrq
    mov r0, #0x7
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
.L_aa0:
    mov r0, r4
    bl OS_RestoreIrq
    mov r0, #0x5
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
.L_ab4:
    mov r0, #0xb
    bl func_0207b038
    mov r0, r4
    bl OS_RestoreIrq
    mov r0, #0x7
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
.L_ad0:
    bl func_0209e4f8
    cmp r0, #0x0
    bne .L_b18
    bl func_0209de74
    cmp r0, #0x0
    beq .L_b04
    mov r0, #0xb
    bl func_0207b038
    mov r0, r4
    bl OS_RestoreIrq
    mov r0, #0x7
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
.L_b04:
    mov r0, r4
    bl OS_RestoreIrq
    mov r0, #0x5
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
.L_b18:
    ldr r0, _LIT1
    bl func_0209e8d0
    cmp r0, #0x0
    beq .L_b44
    mov r0, #0xb
    bl func_0207b038
    mov r0, r4
    bl OS_RestoreIrq
    mov r0, #0x7
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
.L_b44:
    ldr r0, _LIT2
    bl func_0209f1b0
    cmp r0, #0x2
    beq .L_b68
    cmp r0, #0x3
    beq .L_ba4
    cmp r0, #0x8
    beq .L_b88
    b .L_ba4
.L_b68:
    mov r0, #0x2
    bl func_0207b038
    ldr r0, _LIT0
    mov r1, #0x1
    ldr r0, [r0]
    add r0, r0, #0x2200
    strh r1, [r0, #0x80]
    b .L_bc0
.L_b88:
    mov r0, #0xc
    bl func_0207b038
    mov r0, r4
    bl OS_RestoreIrq
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
.L_ba4:
    mov r0, #0xb
    bl func_0207b038
    mov r0, r4
    bl OS_RestoreIrq
    mov r0, #0x7
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
.L_bc0:
    mov r0, r4
    bl OS_RestoreIrq
    mov r0, #0x3
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
_LIT0: .word data_021a088c
_LIT1: .word func_0207ae74
_LIT2: .word func_0207ab68
