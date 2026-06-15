; func_0202d9a0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219ad48
        .global func_0202d9a0
        .arm
func_0202d9a0:
    ldr r0, _LIT0
    ldr r1, [r0]
    cmp r1, #0x0
    moveq r0, #0x0
    bxeq lr
    ldr r1, [r0, #0x64]
    add r1, r1, #0x1
    str r1, [r0, #0x64]
    ldr r1, [r0, #0x24]
    cmp r1, #0x0
    beq .L_bc8
    ldr r1, [r0, #0x10]
    add r2, r1, #0x1
    str r2, [r0, #0x10]
    ldr r1, [r0, #0x8]
    add r1, r1, #0x60
    cmp r2, r1
    movge r1, #0x0
    strge r1, [r0, #0x10]
.L_bc8:
    mov r0, #0x1
    bx lr
_LIT0: .word data_0219ad48
