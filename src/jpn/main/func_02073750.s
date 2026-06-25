; func_02073750 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_02101dc4
        .extern data_0219ee3c
        .extern data_0219ee4c
        .extern data_0219eeb0
        .extern data_0219eeba
        .extern func_02073d6c
        .extern func_02073d80
        .extern func_02092fc8
        .global func_02073750
        .arm
func_02073750:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r7, r0
    bl OS_DisableIrq
    ldr r1, _LIT0
    mov r4, r0
    cmp r7, r1
    mov r5, #0x0
    beq .L_134
    ldr r0, _LIT1
    ldr r0, [r0]
    cmp r7, r0
    bne .L_13c
.L_134:
    ldr r5, _LIT2
    b .L_1b4
.L_13c:
    mov r0, r7
    bl func_02073d80
    cmp r0, #0x0
    bne .L_15c
    mov r0, r7
    bl func_02073d6c
    cmp r0, #0x0
    beq .L_164
.L_15c:
    ldr r5, _LIT3
    b .L_1b4
.L_164:
    ldr r1, _LIT4
    mov r6, r5
.L_16c:
    ldr r0, [r1]
    cmp r7, r0
    bne .L_1a4
    bl func_02092fc8
    mov r2, #0xc
    mul r3, r6, r2
    ldr r2, _LIT4
    mov r5, r0, lsr #0x10
    add r0, r2, r3
    ldr r2, _LIT5
    orr r5, r5, r1, lsl #0x10
    strh r5, [r2, r3]
    add r5, r0, #0x4
    b .L_1b4
.L_1a4:
    add r6, r6, #0x1
    cmp r6, #0x8
    add r1, r1, #0xc
    bcc .L_16c
.L_1b4:
    mov r0, r4
    bl OS_RestoreIrq
    mov r0, r5
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
_LIT0: .word 0x7f000001
_LIT1: .word data_0219ee3c
_LIT2: .word data_0219ee4c
_LIT3: .word data_02101dc4
_LIT4: .word data_0219eeb0
_LIT5: .word data_0219eeba
