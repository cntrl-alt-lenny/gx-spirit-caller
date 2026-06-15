; func_020877c8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a4868
        .extern func_0207cfdc
        .extern func_0207d05c
        .global func_020877c8
        .arm
func_020877c8:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    ldr r0, _LIT0
    mov r1, #0x0
    bl func_0207cfdc
    movs r1, r0
    beq .L_22c
    ldr r4, _LIT0
.L_20c:
    ldrb r2, [r5, #0x3d]
    ldrb r0, [r1, #0x3d]
    cmp r2, r0
    bcc .L_22c
    mov r0, r4
    bl func_0207cfdc
    movs r1, r0
    bne .L_20c
.L_22c:
    ldr r0, _LIT0
    mov r2, r5
    bl func_0207d05c
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_021a4868
