; func_02054684 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ffb80
        .extern data_020ffb8c
        .extern func_020453b4
        .extern func_02054148
        .extern func_020a6d54
        .global func_02054684
        .arm
func_02054684:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    movs r5, r0
    bne .L_3f0
    ldr r0, _LIT0
    ldr r1, _LIT1
    mov r2, #0x0
    mov r3, #0x51
    bl func_020a6d54
.L_3f0:
    cmp r5, #0x0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, pc}
    ldr r0, [r5, #0x4]
    mov r4, #0x0
    cmp r0, #0x0
    ble .L_428
.L_40c:
    ldr r0, [r5]
    ldr r0, [r0, r4, lsl #0x2]
    bl func_02054148
    ldr r0, [r5, #0x4]
    add r4, r4, #0x1
    cmp r4, r0
    blt .L_40c
.L_428:
    ldr r0, [r5]
    bl func_020453b4
    mov r0, r5
    bl func_020453b4
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_020ffb8c
_LIT1: .word data_020ffb80
