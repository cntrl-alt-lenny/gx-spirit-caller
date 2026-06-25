; func_0209dc3c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a8c50
        .extern func_02092484
        .extern func_02092800
        .extern func_02096264
        .extern func_0209dcf4
        .global func_0209dc3c
        .arm
func_0209dc3c:
    stmdb sp!, {r0, r1, r2, r3}
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r4, r0
    bl func_0209dcf4
    movs r5, r0
    addeq sp, sp, #0x4
    moveq r0, #0x8
    ldmeqia sp!, {r4, r5, lr}
    addeq sp, sp, #0x10
    bxeq lr
    strh r4, [r5]
    ldrh r2, [sp, #0x14]
    add r0, sp, #0x14
    bic r0, r0, #0x3
    mov r3, #0x0
    cmp r2, #0x0
    add r4, r0, #0x4
    ble .L_68
.L_4c:
    add r4, r4, #0x4
    ldr r1, [r4, #-4]
    add r0, r5, r3, lsl #0x2
    add r3, r3, #0x1
    str r1, [r0, #0x4]
    cmp r3, r2
    blt .L_4c
.L_68:
    mov r0, r5
    mov r1, #0x100
    bl func_02092800
    mov r1, r5
    mov r0, #0xa
    mov r2, #0x0
    bl func_02096264
    mov r4, r0
    ldr r0, _LIT0
    mov r1, r5
    mov r2, #0x1
    bl func_02092484
    cmp r4, #0x0
    movlt r0, #0x8
    movge r0, #0x2
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    add sp, sp, #0x10
    bx lr
_LIT0: .word data_021a8c50
