; func_02054700 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ffb80
        .extern data_020ffb8c
        .extern data_020ffb94
        .extern data_020ffb9c
        .extern data_020ffba4
        .extern data_020ffbb0
        .extern data_020ffbbc
        .extern func_020453e8
        .extern func_020541b8
        .extern func_020a6d54
        .global func_02054700
        .arm
func_02054700:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    movs r7, r3
    mov sl, r0
    mov r9, r1
    mov r8, r2
    ldr r6, [sp, #0x24]
    bne .L_478
    ldr r0, _LIT0
    ldr r1, _LIT1
    mov r2, #0x0
    mov r3, #0x38
    bl func_020a6d54
.L_478:
    ldr r0, [sp, #0x20]
    cmp r0, #0x0
    bne .L_498
    ldr r0, _LIT2
    ldr r1, _LIT1
    mov r2, #0x0
    mov r3, #0x39
    bl func_020a6d54
.L_498:
    cmp sl, #0x0
    bne .L_4b4
    ldr r0, _LIT3
    ldr r1, _LIT1
    mov r2, #0x0
    mov r3, #0x3a
    bl func_020a6d54
.L_4b4:
    cmp r9, #0x0
    bne .L_4d0
    ldr r0, _LIT4
    ldr r1, _LIT1
    mov r2, #0x0
    mov r3, #0x3b
    bl func_020a6d54
.L_4d0:
    mov r0, #0x14
    bl func_020453e8
    movs r5, r0
    bne .L_4f4
    ldr r0, _LIT5
    ldr r1, _LIT1
    mov r2, #0x0
    mov r3, #0x3e
    bl func_020a6d54
.L_4f4:
    mov r0, r9, lsl #0x2
    bl func_020453e8
    str r0, [r5]
    ldr r0, [r5]
    cmp r0, #0x0
    bne .L_520
    ldr r0, _LIT6
    ldr r1, _LIT1
    mov r2, #0x0
    mov r3, #0x41
    bl func_020a6d54
.L_520:
    cmp r9, #0x0
    mov r4, #0x0
    ble .L_550
.L_52c:
    mov r0, sl
    mov r1, r8
    mov r2, r6
    bl func_020541b8
    ldr r1, [r5]
    str r0, [r1, r4, lsl #0x2]
    add r4, r4, #0x1
    cmp r4, r9
    blt .L_52c
.L_550:
    str r9, [r5, #0x4]
    ldr r0, [sp, #0x20]
    str r6, [r5, #0x8]
    str r0, [r5, #0x10]
    mov r0, r5
    str r7, [r5, #0xc]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_020ffb94
_LIT1: .word data_020ffb80
_LIT2: .word data_020ffb9c
_LIT3: .word data_020ffba4
_LIT4: .word data_020ffbb0
_LIT5: .word data_020ffb8c
_LIT6: .word data_020ffbbc
