; func_0206133c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101430
        .extern data_02101448
        .extern data_02101454
        .extern func_020a6d54
        .extern func_020a7388
        .global func_0206133c
        .arm
func_0206133c:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r1
    mvn r1, #0x0
    mov r6, r0
    cmp r5, r1
    ldreq r0, [r6, #0x8]
    mov r4, r2
    subeq r5, r0, r4
    ldr r0, [r6, #0x8]
    cmp r5, r0
    ble .L_42c
    ldr r0, _LIT0
    ldr r1, _LIT1
    mov r2, #0x0
    mov r3, #0x4f
    bl func_020a6d54
.L_42c:
    ldr r0, [r6, #0x8]
    sub r0, r0, r5
    cmp r4, r0
    ble .L_450
    ldr r0, _LIT2
    ldr r1, _LIT1
    mov r2, #0x0
    mov r3, #0x50
    bl func_020a6d54
.L_450:
    ldr r0, [r6]
    ldr r1, [r6, #0x8]
    add r0, r0, r5
    sub r2, r1, r5
    add r1, r0, r4
    sub r2, r2, r4
    bl func_020a7388
    ldr r0, [r6, #0x8]
    sub r0, r0, r4
    str r0, [r6, #0x8]
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_02101430
_LIT1: .word data_02101448
_LIT2: .word data_02101454
