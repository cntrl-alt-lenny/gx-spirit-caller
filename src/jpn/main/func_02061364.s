; func_02061364 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101368
        .extern data_02101398
        .extern func_020a6c60
        .extern func_020a7274
        .extern func_020aace8
        .global func_02061364
        .arm
func_02061364:
    stmdb sp!, {r4, r5, r6, lr}
    movs r5, r1
    mov r6, r0
    mov r4, r2
    ldmeqia sp!, {r4, r5, r6, pc}
    cmp r4, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    mvn r0, #0x0
    cmp r4, r0
    bne .L_3f4
    mov r0, r5
    bl func_020aace8
    mov r4, r0
.L_3f4:
    ldr r1, [r6, #0x8]
    ldr r0, [r6, #0x4]
    add r1, r1, r4
    cmp r1, r0
    ble .L_41c
    ldr r0, _LIT0
    ldr r1, _LIT1
    mov r2, #0x0
    mov r3, #0x40
    bl func_020a6c60
.L_41c:
    ldr r3, [r6]
    ldr r0, [r6, #0x8]
    mov r1, r5
    mov r2, r4
    add r0, r3, r0
    bl func_020a7274
    ldr r0, [r6, #0x8]
    add r0, r0, r4
    str r0, [r6, #0x8]
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_02101398
_LIT1: .word data_02101368
