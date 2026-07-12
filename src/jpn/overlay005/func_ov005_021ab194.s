; func_ov005_021ab194 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov005_021ab194
        .arm
func_ov005_021ab194:
    stmdb sp!, {r4, lr}
    ldr r4, [r0, #0x8]
    mov r3, #0x1c
    mla lr, r1, r3, r4
    ldr r3, [lr, #0xc]
    ldr ip, [r0, #0x4]
    cmp r3, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr ip, [ip, #0x4]
.L_28:
    ldr r3, [lr]
    cmp r3, ip
    moveq lr, r4
    addne lr, lr, #0x1c
    ldr r3, [lr, #0x4]
    cmp r3, r1
    ldrne r3, [lr]
    cmpne r3, r1
    bne .L_28
    str lr, [r2]
    ldr r3, [r0, #0x8]
    ldr r1, [lr, #0x8]
    mov r0, #0x1c
    mla r0, r1, r0, r3
    str r0, [r2, #0x4]
    ldr r0, [lr]
    ldmia sp!, {r4, pc}
