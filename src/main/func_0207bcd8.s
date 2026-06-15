; func_0207bcd8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_021a088c
        .extern func_0207a868
        .extern func_0207b038
        .extern func_0207b250
        .extern func_020928cc
        .extern func_0209eb48
        .global func_0207bcd8
        .arm
func_0207bcd8:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r7, r0
    mov r6, r1
    mov r5, r2
    bl OS_DisableIrq
    ldr r1, _LIT0
    mov r4, r0
    ldr r1, [r1]
    cmp r1, #0x0
    bne .L_6ec
    bl OS_RestoreIrq
    add sp, sp, #0x4
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
.L_6ec:
    add r1, r1, #0x2000
    ldr r1, [r1, #0x260]
    cmp r1, #0x3
    beq .L_774
    cmp r1, #0x5
    beq .L_710
    cmp r1, #0x6
    beq .L_738
    b .L_760
.L_710:
    mov r0, r7
    mov r1, r6
    mov r2, r5
    bl func_0207b250
    mov r0, r4
    bl OS_RestoreIrq
    add sp, sp, #0x4
    mov r0, #0x2
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
.L_738:
    mov r0, r7
    mov r1, r6
    mov r2, r5
    bl func_0207b250
    mov r0, r4
    bl OS_RestoreIrq
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
.L_760:
    bl OS_RestoreIrq
    add sp, sp, #0x4
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
.L_774:
    mov r0, r7
    mov r1, r6
    mov r2, r5
    bl func_0207b250
    ldr r0, _LIT0
    ldr r0, [r0]
    add r1, r0, #0x2200
    add r0, r0, #0x2000
    ldrh r1, [r1, #0x8c]
    ldr r0, [r0, #0x288]
    bl func_020928cc
    ldr r3, _LIT0
    ldr r2, _LIT1
    ldr r1, [r3]
    ldr r0, _LIT2
    add r1, r1, #0x2000
    ldr r5, [r1, #0x284]
    add r5, r5, #0x1
    str r5, [r1, #0x284]
    ldr r1, [r3]
    add r1, r1, r2
    bl func_0209eb48
    cmp r0, #0x2
    beq .L_7e8
    cmp r0, #0x3
    beq .L_820
    cmp r0, #0x8
    beq .L_808
    b .L_820
.L_7e8:
    mov r0, #0x5
    bl func_0207b038
    ldr r0, _LIT0
    mov r1, #0x3
    ldr r0, [r0]
    add r0, r0, #0x2200
    strh r1, [r0, #0x80]
    b .L_840
.L_808:
    mov r0, r4
    bl OS_RestoreIrq
    add sp, sp, #0x4
    mov r0, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
.L_820:
    mov r0, #0xb
    bl func_0207b038
    mov r0, r4
    bl OS_RestoreIrq
    add sp, sp, #0x4
    mov r0, #0x7
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
.L_840:
    mov r0, r4
    bl OS_RestoreIrq
    mov r0, #0x3
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
_LIT0: .word data_021a088c
_LIT1: .word 0x00002288
_LIT2: .word func_0207a868
