; func_02068454 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02045364
        .extern func_02045398
        .extern func_0205468c
        .extern func_0206850c
        .extern func_02068520
        .extern func_02068530
        .global func_02068454
        .arm
func_02068454:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x8
    mov r0, #0x24
    mov r6, r1
    mov r5, r2
    bl func_02045398
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
    bl func_0205468c
    str r0, [r4, #0x18]
    ldr r0, [r4, #0x18]
    cmp r0, #0x0
    bne .L_70
    mov r0, r4
    bl func_02045364
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
_LIT0: .word func_0206850c
_LIT1: .word func_02068530
_LIT2: .word func_02068520
