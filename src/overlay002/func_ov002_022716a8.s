; func_ov002_022716a8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd300
        .extern data_ov002_022cf16c
        .global func_ov002_022716a8
        .arm
func_ov002_022716a8:
    ldr r3, _LIT0
    ldr ip, [r3]
    mov r3, ip, lsl #0x1f
    cmp r0, r3, lsr #0x1f
    cmpeq r1, #0xb
    bne .L_1578
    ldr r3, _LIT1
    ldr r1, _LIT2
    and r0, r0, #0x1
    mla r1, r0, r1, r3
    add r0, r1, #0x120
    ldr r1, [r0, r2, lsl #0x2]
    mov r2, ip, lsr #0x17
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r1, lsr #0x1f
    cmp r2, r0
    movne r0, #0x800
    bxne lr
.L_1578:
    mov r0, #0x0
    bx lr
_LIT0: .word data_ov002_022cd300
_LIT1: .word data_ov002_022cf16c
_LIT2: .word 0x00000868
