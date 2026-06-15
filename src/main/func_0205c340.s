; func_0205c340 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02100b64
        .extern data_02100b84
        .extern data_02100b90
        .extern func_02057d2c
        .extern func_020a6d54
        .extern func_020a978c
        .global func_0205c340
        .arm
func_0205c340:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x4c
    mov r9, r0
    mov r8, r1
    mov r7, r2
    cmp r3, #0x0
    ldr r6, [r3, #0x4]
    ldr r5, [r3]
    ldr r4, [r3, #0x8]
    bne .L_14b0
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r3, _LIT2
    mov r2, #0x0
    bl func_020a6d54
.L_14b0:
    ldr r1, _LIT3
    str r6, [sp]
    add r0, sp, #0x8
    mov r2, r7
    mov r3, r5
    str r4, [sp, #0x4]
    bl func_020a978c
    add r2, sp, #0x8
    mov r0, r9
    mov r1, r8
    bl func_02057d2c
    add sp, sp, #0x4c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_02100b84
_LIT1: .word data_02100b64
_LIT2: .word 0x00000376
_LIT3: .word data_02100b90
