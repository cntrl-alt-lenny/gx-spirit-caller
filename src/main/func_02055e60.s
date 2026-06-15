; func_02055e60 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ffc54
        .extern data_020ffd3c
        .extern func_02059744
        .extern func_0205ffc0
        .global func_02055e60
        .arm
func_02055e60:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x48
    movs lr, r0
    beq .L_b4c
    ldr ip, [lr]
    cmp ip, #0x0
    bne .L_b58
.L_b4c:
    add sp, sp, #0x48
    mov r0, #0x2
    ldmia sp!, {r4, pc}
.L_b58:
    cmp r1, #0x0
    beq .L_b6c
    ldrsb r4, [r1]
    cmp r4, #0x0
    bne .L_b78
.L_b6c:
    add sp, sp, #0x48
    mov r0, #0x2
    ldmia sp!, {r4, pc}
.L_b78:
    cmp r2, #0x0
    beq .L_b8c
    ldrsb r4, [r2]
    cmp r4, #0x0
    bne .L_b98
.L_b8c:
    add sp, sp, #0x48
    mov r0, #0x2
    ldmia sp!, {r4, pc}
.L_b98:
    ldr r4, [sp, #0x54]
    cmp r4, #0x0
    bne .L_bb8
    ldr r1, _LIT0
    bl func_0205ffc0
    add sp, sp, #0x48
    mov r0, #0x2
    ldmia sp!, {r4, pc}
.L_bb8:
    ldr ip, [ip, #0x108]
    cmp ip, #0x0
    beq .L_c00
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
.L_c00:
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
    bl func_02059744
    add sp, sp, #0x48
    ldmia sp!, {r4, pc}
_LIT0: .word data_020ffc54
_LIT1: .word data_020ffd3c
