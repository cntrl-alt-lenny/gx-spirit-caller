; func_ov002_021b9a40 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d0174
        .global func_ov002_021b9a40
        .arm
func_ov002_021b9a40:
    ldr ip, _LIT0
    mov r3, #0x1
.L_918:
    ldrh r1, [ip]
    mov r2, r1, lsl #0x13
    cmp r0, r2, lsr #0x13
    bne .L_938
    mov r1, r1, lsl #0x10
    movs r1, r1, lsr #0x1f
    movne r0, #0x1
    bxne lr
.L_938:
    add r3, r3, #0x1
    cmp r3, #0x100
    add ip, ip, #0x4
    blt .L_918
    mov r0, #0x0
    bx lr
_LIT0: .word data_ov002_022d0174
