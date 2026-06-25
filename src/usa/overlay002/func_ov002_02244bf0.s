; func_ov002_02244bf0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021bc47c
        .global func_ov002_02244bf0
        .arm
func_ov002_02244bf0:
    stmdb sp!, {r3, lr}
    cmp r2, #0x4
    movgt r0, #0x0
    ldmgtia sp!, {r3, pc}
    ldrh r0, [r0, #0x2]
    mov r0, r0, lsl #0x1a
    mov r3, r0, lsr #0x1b
    sub r0, r3, #0x1
    cmp r2, r0
    addne r0, r3, #0x1
    cmpne r2, r0
    bne .L_4c
    mov r0, r1
    mov r1, r2
    bl func_ov002_021bc47c
    cmp r0, #0x0
    moveq r0, #0x0
    movne r0, #0x1
    ldmia sp!, {r3, pc}
.L_4c:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
