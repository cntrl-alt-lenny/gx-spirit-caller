; func_ov002_0229f1e8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov002_0229f1e8
        .arm
func_ov002_0229f1e8:
    ldr r3, [r0, #0x8]
    mov ip, #0x1
    cmp r3, #0x6
    cmpne r3, #0x9
    movne ip, #0x0
    cmp ip, #0x0
    movne r3, #0x30
    moveq r3, #0x20
    str r3, [r1]
    ldr r0, [r0, #0x8]
    mov ip, #0x0
    sub r3, r0, #0x6
    cmp r3, #0x9
    bhi .L_ae4
    mov r1, #0x1
    add r0, r1, #0x208
    tst r0, r1, lsl r3
    movne ip, r1
.L_ae4:
    cmp ip, #0x0
    movne r0, #0x20
    moveq r0, #0x18
    str r0, [r2]
    bx lr
