; func_020902ec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern OSi_IrqCheckBuf
        .extern data_027e0000
        .extern func_020919a4
        .global func_020902ec
        .arm
func_020902ec:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r0
    mov r4, r1
    bl OS_DisableIrq
    cmp r5, #0x0
    beq .L_30
    ldr r1, _LIT0
    mvn r2, r4
    add r1, r1, #0x3000
    ldr r3, [r1, #0xff8]
    and r2, r3, r2
    str r2, [r1, #0xff8]
.L_30:
    bl OS_RestoreIrq
    ldr r1, _LIT0
    add r0, r1, #0x3000
    ldr r0, [r0, #0xff8]
    ands r0, r4, r0
    ldmneia sp!, {r4, r5, r6, lr}
    bxne lr
    ldr r0, _LIT1
    add r6, r1, r0
    ldr r5, _LIT2
.L_58:
    mov r0, r5
    bl func_020919a4
    ldr r0, [r6]
    ands r0, r4, r0
    beq .L_58
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
_LIT0: .word data_027e0000
_LIT1: .word 0x00003ff8
_LIT2: .word OSi_IrqCheckBuf
