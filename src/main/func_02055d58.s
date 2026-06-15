; func_02055d58 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ffc54
        .extern func_0205f844
        .extern func_0205ffc0
        .global func_02055d58
        .arm
func_02055d58:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x30
    cmp r0, #0x0
    beq .L_a44
    ldr r4, [r0]
    cmp r4, #0x0
    bne .L_a50
.L_a44:
    add sp, sp, #0x30
    mov r0, #0x2
    ldmia sp!, {r4, pc}
.L_a50:
    ldr ip, [sp, #0x48]
    cmp ip, #0x0
    bne .L_a70
    ldr r1, _LIT0
    bl func_0205ffc0
    add sp, sp, #0x30
    mov r0, #0x2
    ldmia sp!, {r4, pc}
.L_a70:
    ldr r4, [r4, #0x108]
    cmp r4, #0x0
    beq .L_ab0
    add r1, sp, #0x1c
    mov r4, #0x0
    str r4, [r1]
    str r4, [r1, #0x4]
    str r4, [r1, #0x8]
    ldr r2, [sp, #0x4c]
    ldr r3, _LIT1
    str r4, [r1, #0xc]
    str r3, [sp, #0x24]
    blx ip
    add sp, sp, #0x30
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_ab0:
    ldr r4, [sp, #0x38]
    ldr lr, [sp, #0x3c]
    str r4, [sp]
    ldr r4, [sp, #0x40]
    str lr, [sp, #0x4]
    str r4, [sp, #0x8]
    mov r4, #0x0
    ldr lr, [sp, #0x44]
    str r4, [sp, #0xc]
    str lr, [sp, #0x10]
    ldr lr, [sp, #0x4c]
    str ip, [sp, #0x14]
    str lr, [sp, #0x18]
    bl func_0205f844
    add sp, sp, #0x30
    ldmia sp!, {r4, pc}
_LIT0: .word data_020ffc54
_LIT1: .word 0x00000601
