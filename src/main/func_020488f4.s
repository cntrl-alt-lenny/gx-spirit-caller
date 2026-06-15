; func_020488f4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219dc80
        .extern func_02047804
        .extern func_02048108
        .extern func_02052f04
        .extern func_02055738
        .extern func_020557b8
        .global func_020488f4
        .arm
func_020488f4:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    ldr r2, _LIT0
    mov r3, #0x0
    ldr r2, [r2]
    mov r5, r0
    mov r4, r1
    str r3, [sp]
    cmp r2, #0x0
    beq .L_614
    bl func_02047804
    cmp r0, #0x0
    bne .L_620
.L_614:
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r4, r5, pc}
.L_620:
    bl func_02048108
    mov r1, r5
    bl func_02052f04
    mov r5, r0
    cmp r5, #0x0
    ble .L_660
    ldr r0, _LIT0
    add r2, sp, #0x0
    ldr r0, [r0]
    mov r1, r5
    ldr r0, [r0, #0x4]
    bl func_02055738
    cmp r0, #0x0
    addne sp, sp, #0x4
    movne r0, #0x0
    ldmneia sp!, {r4, r5, pc}
.L_660:
    cmp r5, #0x0
    ble .L_678
    ldr r1, [sp]
    mvn r0, #0x0
    cmp r1, r0
    bne .L_684
.L_678:
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r4, r5, pc}
.L_684:
    ldr r0, _LIT0
    mov r2, r4
    ldr r0, [r0]
    ldr r0, [r0, #0x4]
    bl func_020557b8
    cmp r0, #0x0
    movne r0, #0x0
    moveq r0, #0x1
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_0219dc80
