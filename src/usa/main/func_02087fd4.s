; func_02087fd4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a5064
        .extern data_021a50a4
        .extern func_020b3988
        .global func_02087fd4
        .arm
func_02087fd4:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0xc
    mov r5, r0
    mov r4, r1
    ldr r0, [r5, #0x28]
    ldr r1, [r5, #0x2c]
    bl func_020b3988
    ldr r1, [r5, #0x48]
    ldr r2, [r5, #0x38]
    mov r3, r0
    mul lr, r3, r2
    cmp r1, #0x0
    mov ip, #0x0
    ble .L_64
    ldr r2, _LIT0
    ldr r0, _LIT1
.L_40:
    add r1, r5, ip
    ldrb r1, [r1, #0x4c]
    ldr r1, [r2, r1, lsl #0x3]
    add r1, r1, lr
    str r1, [r0, ip, lsl #0x2]
    ldr r1, [r5, #0x48]
    add ip, ip, #0x1
    cmp ip, r1
    blt .L_40
.L_64:
    ldr r0, [r5, #0x20]
    ldr r2, _LIT1
    str r0, [sp]
    ldr ip, [r5, #0x34]
    mov r0, r4
    str ip, [sp, #0x4]
    ldr r4, [r5, #0x30]
    blx r4
    ldr r0, [r5, #0x38]
    add r0, r0, #0x1
    str r0, [r5, #0x38]
    ldr r1, [r5, #0x38]
    ldr r0, [r5, #0x2c]
    cmp r1, r0
    movge r0, #0x0
    strge r0, [r5, #0x38]
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_021a50a4
_LIT1: .word data_021a5064
