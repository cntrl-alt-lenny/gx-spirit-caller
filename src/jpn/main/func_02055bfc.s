; func_02055bfc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ffb30
        .extern data_020ffb74
        .extern func_02059ec4
        .extern func_0205ff4c
        .global func_02055bfc
        .arm
func_02055bfc:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x20c
    movs r5, r0
    beq .L_24
    ldr r4, [r5]
    cmp r4, #0x0
    beq .L_24
    cmp r1, #0x0
    bne .L_30
.L_24:
    add sp, sp, #0x20c
    mov r0, #0x2
    ldmia sp!, {r4, r5, pc}
.L_30:
    ldr lr, [sp, #0x218]
    cmp lr, #0x0
    bne .L_50
    ldr r1, _LIT0
    bl func_0205ff4c
    add sp, sp, #0x20c
    mov r0, #0x2
    ldmia sp!, {r4, r5, pc}
.L_50:
    ldr ip, [r4, #0x108]
    cmp ip, #0x0
    beq .L_a8
    mov r0, #0x0
    add lr, sp, #0x8
    mov r1, r0
    mov r2, r0
    mov r3, r0
    mov ip, #0x10
.L_74:
    stmia lr!, {r0, r1, r2, r3}
    stmia lr!, {r0, r1, r2, r3}
    subs ip, ip, #0x1
    bne .L_74
    ldr r2, [sp, #0x21c]
    str r0, [lr]
    ldr r3, [sp, #0x218]
    add r1, sp, #0x8
    mov r0, r5
    blx r3
    add sp, sp, #0x20c
    mov r0, #0x0
    ldmia sp!, {r4, r5, pc}
.L_a8:
    ldr ip, [r4, #0x1d8]
    cmp ip, #0x4
    bne .L_c8
    ldr r1, _LIT1
    bl func_0205ff4c
    add sp, sp, #0x20c
    mov r0, #0x2
    ldmia sp!, {r4, r5, pc}
.L_c8:
    ldr ip, [sp, #0x21c]
    str lr, [sp]
    str ip, [sp, #0x4]
    bl func_02059ec4
    add sp, sp, #0x20c
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_020ffb74
_LIT1: .word data_020ffb30
