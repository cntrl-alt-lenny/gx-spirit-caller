; func_ov002_02244d3c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021bc47c
        .extern func_ov002_0223dda4
        .global func_ov002_02244d3c
        .arm
func_ov002_02244d3c:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r1
    mov r1, #0x0
    mov r4, r2
    bl func_ov002_0223dda4
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x8
    cmp r4, #0x4
    and r1, r0, #0xff
    movgt r0, #0x0
    ldmgtia sp!, {r3, r4, r5, pc}
    sub r0, r1, #0x1
    cmp r4, r0
    addne r0, r1, #0x1
    cmpne r4, r0
    bne .L_158
    mov r0, r5
    mov r1, r4
    bl func_ov002_021bc47c
    cmp r0, #0x0
    moveq r0, #0x0
    movne r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_158:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
