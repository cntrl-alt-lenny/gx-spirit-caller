; func_02055dec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ffb74
        .extern data_020ffc5c
        .extern func_020596d0
        .extern func_0205ff4c
        .global func_02055dec
        .arm
func_02055dec:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x48
    movs lr, r0
    beq .L_1c
    ldr ip, [lr]
    cmp ip, #0x0
    bne .L_28
.L_1c:
    add sp, sp, #0x48
    mov r0, #0x2
    ldmia sp!, {r4, pc}
.L_28:
    cmp r1, #0x0
    beq .L_3c
    ldrsb r4, [r1]
    cmp r4, #0x0
    bne .L_48
.L_3c:
    add sp, sp, #0x48
    mov r0, #0x2
    ldmia sp!, {r4, pc}
.L_48:
    cmp r2, #0x0
    beq .L_5c
    ldrsb r4, [r2]
    cmp r4, #0x0
    bne .L_68
.L_5c:
    add sp, sp, #0x48
    mov r0, #0x2
    ldmia sp!, {r4, pc}
.L_68:
    ldr r4, [sp, #0x54]
    cmp r4, #0x0
    bne .L_88
    ldr r1, _LIT0
    bl func_0205ff4c
    add sp, sp, #0x48
    mov r0, #0x2
    ldmia sp!, {r4, pc}
.L_88:
    ldr ip, [ip, #0x108]
    cmp ip, #0x0
    beq .L_d0
    add r3, sp, #0x24
    mov r0, #0x0
    mov r2, r3
    mov r1, r0
    stmia r2!, {r0, r1}
    stmia r2!, {r0, r1}
    stmia r2!, {r0, r1}
    stmia r2, {r0, r1}
    ldr r2, [sp, #0x58]
    mov r0, lr
    mov r1, r3
    blx r4
    add sp, sp, #0x48
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_d0:
    ldr lr, _LIT1
    mov ip, #0x0
    str lr, [sp]
    str r1, [sp, #0x4]
    str r2, [sp, #0x8]
    str ip, [sp, #0xc]
    str r3, [sp, #0x10]
    ldr r1, [sp, #0x50]
    str ip, [sp, #0x14]
    str r1, [sp, #0x18]
    ldr ip, [sp, #0x58]
    str r4, [sp, #0x1c]
    mov r1, lr
    mov r2, lr
    mov r3, lr
    str ip, [sp, #0x20]
    bl func_020596d0
    add sp, sp, #0x48
    ldmia sp!, {r4, pc}
_LIT0: .word data_020ffb74
_LIT1: .word data_020ffc5c
