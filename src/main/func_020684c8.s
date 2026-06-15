; func_020684c8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020453b4
        .extern func_020453e8
        .extern func_02054700
        .extern func_02068580
        .extern func_02068594
        .extern func_020685a4
        .global func_020684c8
        .arm
func_020684c8:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x8
    mov r0, #0x24
    mov r6, r1
    mov r5, r2
    bl func_020453e8
    movs r4, r0
    addeq sp, sp, #0x8
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r0, _LIT0
    ldr r2, _LIT1
    str r0, [sp]
    mov r0, #0x8
    ldr r3, _LIT2
    mov r1, r0
    str r2, [sp, #0x4]
    mov r2, #0x4
    bl func_02054700
    str r0, [r4, #0x18]
    ldr r0, [r4, #0x18]
    cmp r0, #0x0
    bne .L_70
    mov r0, r4
    bl func_020453b4
    add sp, sp, #0x8
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_70:
    mov r1, #0x0
    strb r1, [r4, #0x14]
    strb r1, [r4, #0x15]
    str r1, [r4, #0x20]
    str r1, [r4, #0x1c]
    str r1, [r4, #0x10]
    str r6, [r4]
    strh r5, [r4, #0x4]
    str r1, [r4, #0x8]
    mov r0, r4
    strh r1, [r4, #0xc]
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word func_02068580
_LIT1: .word func_020685a4
_LIT2: .word func_02068594
