; func_02061464 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101448
        .extern data_0210149c
        .extern func_020a6d54
        .global func_02061464
        .arm
func_02061464:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    ldr r2, [r5, #0x8]
    ldr r0, [r5, #0x4]
    add r2, r2, #0x2
    mov r4, r1
    cmp r2, r0
    ble .L_54c
    ldr r0, _LIT0
    ldr r1, _LIT1
    mov r2, #0x0
    mov r3, #0x2e
    bl func_020a6d54
.L_54c:
    ldr r2, [r5, #0x8]
    mov r1, r4, asr #0x8
    add r0, r2, #0x1
    str r0, [r5, #0x8]
    ldr r0, [r5]
    strb r1, [r0, r2]
    ldr r1, [r5, #0x8]
    add r0, r1, #0x1
    str r0, [r5, #0x8]
    ldr r0, [r5]
    strb r4, [r0, r1]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_0210149c
_LIT1: .word data_02101448
