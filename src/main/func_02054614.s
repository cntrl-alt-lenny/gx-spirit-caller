; func_02054614 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ffb80
        .extern data_020ffb8c
        .extern func_02054140
        .extern func_020a6d54
        .global func_02054614
        .arm
func_02054614:
    stmdb sp!, {r4, r5, r6, lr}
    movs r6, r0
    mov r4, #0x0
    bne .L_380
    ldr r0, _LIT0
    ldr r1, _LIT1
    mov r2, r4
    mov r3, #0x61
    bl func_020a6d54
.L_380:
    cmp r6, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r0, [r6, #0x4]
    mov r5, #0x0
    cmp r0, #0x0
    ble .L_3bc
.L_39c:
    ldr r0, [r6]
    ldr r0, [r0, r5, lsl #0x2]
    bl func_02054140
    ldr r1, [r6, #0x4]
    add r5, r5, #0x1
    cmp r5, r1
    add r4, r4, r0
    blt .L_39c
.L_3bc:
    mov r0, r4
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_020ffb8c
_LIT1: .word data_020ffb80
