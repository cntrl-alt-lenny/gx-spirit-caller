; func_020588e0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02100290
        .extern data_021002b8
        .extern data_021002d0
        .extern func_02058560
        .extern func_0205ff60
        .extern func_0206015c
        .extern func_020a6c60
        .global func_020588e0
        .arm
func_020588e0:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    ldr r4, [r5]
    add r2, sp, #0x0
    ldr r1, [r4, #0x1d4]
    bl func_0206015c
    cmp r0, #0x0
    addne sp, sp, #0x4
    ldmneia sp!, {r4, r5, pc}
    ldr r0, [sp]
    cmp r0, #0x4
    bne .L_3e0
    ldr r1, _LIT0
    ldr r2, _LIT1
    mov r0, r5
    bl func_0205ff60
    mov r0, r5
    mov r1, #0x4
    mov r2, #0x1
    bl func_02058560
    add sp, sp, #0x4
    mov r0, #0x4
    ldmia sp!, {r4, r5, pc}
.L_3e0:
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, pc}
    cmp r0, #0x3
    beq .L_40c
    ldr r0, _LIT2
    ldr r1, _LIT3
    ldr r3, _LIT4
    mov r2, #0x0
    bl func_020a6c60
.L_40c:
    mov r0, #0x2
    str r0, [r4, #0x1d8]
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
_LIT0: .word 0x00000107
_LIT1: .word data_02100290
_LIT2: .word data_021002b8
_LIT3: .word data_021002d0
_LIT4: .word 0x000002ef
