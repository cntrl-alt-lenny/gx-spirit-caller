; func_02020c40 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02191e60
        .extern func_0201f0e4
        .extern func_020203b0
        .extern func_02093b08
        .extern func_0209eef4
        .global func_02020c40
        .arm
func_02020c40:
    stmdb sp!, {r3, lr}
    ldr r0, _LIT0
    ldr r0, [r0, #0x30]
    cmp r0, #0x1
    beq .L_10c
    bl func_02093b08
.L_10c:
    mov r0, #0x3
    bl func_0201f0e4
    ldr r0, _LIT1
    bl func_0209eef4
    cmp r0, #0x2
    moveq r0, #0x1
    ldmeqia sp!, {r3, pc}
    mov r0, #0x9
    bl func_0201f0e4
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word data_02191e60
_LIT1: .word func_020203b0
