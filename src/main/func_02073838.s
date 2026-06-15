; func_02073838 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_02101ea4
        .extern data_0219ef1c
        .extern data_0219ef2c
        .extern data_0219ef90
        .extern data_0219ef9a
        .extern func_02073e54
        .extern func_02073e68
        .extern func_020930b0
        .global func_02073838
        .arm
func_02073838:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r7, r0
    bl OS_DisableIrq
    ldr r1, _LIT0
    mov r4, r0
    cmp r7, r1
    mov r5, #0x0
    beq .L_1060
    ldr r0, _LIT1
    ldr r0, [r0]
    cmp r7, r0
    bne .L_1068
.L_1060:
    ldr r5, _LIT2
    b .L_10e0
.L_1068:
    mov r0, r7
    bl func_02073e68
    cmp r0, #0x0
    bne .L_1088
    mov r0, r7
    bl func_02073e54
    cmp r0, #0x0
    beq .L_1090
.L_1088:
    ldr r5, _LIT3
    b .L_10e0
.L_1090:
    ldr r1, _LIT4
    mov r6, r5
.L_1098:
    ldr r0, [r1]
    cmp r7, r0
    bne .L_10d0
    bl func_020930b0
    mov r2, #0xc
    mul r3, r6, r2
    ldr r2, _LIT4
    mov r5, r0, lsr #0x10
    add r0, r2, r3
    ldr r2, _LIT5
    orr r5, r5, r1, lsl #0x10
    strh r5, [r2, r3]
    add r5, r0, #0x4
    b .L_10e0
.L_10d0:
    add r6, r6, #0x1
    cmp r6, #0x8
    add r1, r1, #0xc
    bcc .L_1098
.L_10e0:
    mov r0, r4
    bl OS_RestoreIrq
    mov r0, r5
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
_LIT0: .word 0x7f000001
_LIT1: .word data_0219ef1c
_LIT2: .word data_0219ef2c
_LIT3: .word data_02101ea4
_LIT4: .word data_0219ef90
_LIT5: .word data_0219ef9a
