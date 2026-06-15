; func_ov016_021b2824 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov016_021b8f80
        .extern data_ov016_021b9740
        .global func_ov016_021b2824
        .arm
func_ov016_021b2824:
    stmdb sp!, {r3, lr}
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r0, [r0]
    ldr r0, [r1, r0, lsl #0x2]
    cmp r0, #0x0
    beq .L_594
    blx r0
    cmp r0, #0x0
    beq .L_58c
    ldr r0, _LIT0
    mov r1, #0x0
    ldr r2, [r0]
    add r2, r2, #0x1
    str r2, [r0]
    str r1, [r0, #0x4]
.L_58c:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_594:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov016_021b9740
_LIT1: .word data_ov016_021b8f80
