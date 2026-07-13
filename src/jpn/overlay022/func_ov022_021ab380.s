; func_ov022_021ab380 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02103fcc
        .extern data_ov022_021ab8dc
        .global func_ov022_021ab380
        .arm
func_ov022_021ab380:
    stmdb sp!, {r3, lr}
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r0, [r0, #0xb6c]
    ldr r0, [r1, r0, lsl #0x2]
    cmp r0, #0x0
    beq .L_e20
    blx r0
    cmp r0, #0x0
    beq .L_e18
    ldr r0, _LIT0
    ldr r1, [r0, #0xb6c]
    add r1, r1, #0x1
    str r1, [r0, #0xb6c]
.L_e18:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_e20:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
_LIT0: .word data_02103fcc
_LIT1: .word data_ov022_021ab8dc
