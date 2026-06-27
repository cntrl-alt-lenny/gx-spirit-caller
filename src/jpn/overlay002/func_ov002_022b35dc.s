; func_ov002_022b35dc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov002_022b35dc
        .arm
func_ov002_022b35dc:
    ldr r3, [r0, #0xc]
    cmp r3, r1
    beq .L_28
    cmp r3, #0x0
    movlt r3, #0x1
    movge r3, #0x0
    mov r3, r3, lsl #0x7
    rsb r3, r3, #0x100
    str r3, [r0, #0x1c]
    str r1, [r0, #0xc]
.L_28:
    ldr r3, [r0, #0x10]
    mov r1, #0x100
    str r3, [r0, #0x14]
    str r2, [r0, #0x10]
    str r1, [r0, #0x20]
    bx lr
