; func_ov002_0220dfc8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern func_0202e234
        .global func_ov002_0220dfc8
        .arm
func_ov002_0220dfc8:
    stmdb sp!, {r3, lr}
    ldr r0, _LIT0
    ldr r0, [r0, #0x484]
    add r0, r0, #0x1
    cmp r0, #0x4
    movlt r0, #0x0
    ldmltia sp!, {r3, pc}
    ldrh r0, [r1, #0x2]
    mov r2, r0, lsl #0x1a
    mov r2, r2, lsr #0x1b
    cmp r2, #0x5
    bcc .L_4c
    cmp r2, #0xa
    bhi .L_4c
    mov r0, r0, lsl #0x12
    movs r0, r0, lsr #0x1e
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, pc}
.L_4c:
    cmp r2, #0x5
    bcc .L_64
    ldrh r0, [r1]
    bl func_0202e234
    cmp r0, #0x0
    beq .L_6c
.L_64:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
.L_6c:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022ce288
