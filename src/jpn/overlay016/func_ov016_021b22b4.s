; func_ov016_021b22b4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov016_021b95e0
        .extern data_ov016_021b9624
        .extern func_ov016_021b21d8
        .global func_ov016_021b22b4
        .arm
func_ov016_021b22b4:
    ldr r2, _LIT0
    mov r1, #0x0
.L_f4:
    ldr r0, [r2, #0x8c]
    cmp r0, #0x0
    beq .L_110
    add r1, r1, #0x1
    cmp r1, #0x3c
    add r2, r2, #0x54
    blt .L_f4
.L_110:
    ldr ip, _LIT1
    ldr r0, _LIT2
    bx ip
_LIT0: .word data_ov016_021b95e0
_LIT1: .word func_ov016_021b21d8
_LIT2: .word data_ov016_021b9624
