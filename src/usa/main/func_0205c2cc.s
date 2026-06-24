; func_0205c2cc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02100a84
        .extern data_02100aa4
        .extern data_02100ab0
        .extern func_02057cb8
        .extern func_020a6c60
        .extern func_020a9698
        .global func_0205c2cc
        .arm
func_0205c2cc:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x4c
    mov r9, r0
    mov r8, r1
    mov r7, r2
    cmp r3, #0x0
    ldr r6, [r3, #0x4]
    ldr r5, [r3]
    ldr r4, [r3, #0x8]
    bne .L_5c4
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r3, _LIT2
    mov r2, #0x0
    bl func_020a6c60
.L_5c4:
    ldr r1, _LIT3
    str r6, [sp]
    add r0, sp, #0x8
    mov r2, r7
    mov r3, r5
    str r4, [sp, #0x4]
    bl func_020a9698
    add r2, sp, #0x8
    mov r0, r9
    mov r1, r8
    bl func_02057cb8
    add sp, sp, #0x4c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_02100aa4
_LIT1: .word data_02100a84
_LIT2: .word 0x00000376
_LIT3: .word data_02100ab0
