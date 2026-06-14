; func_ov019_021b26d0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov019_021b5b20
        .extern data_ov019_021b5e20
        .global func_ov019_021b26d0
        .arm
func_ov019_021b26d0:
    stmdb sp!, {r3, lr}
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r0, [r0]
    ldr r0, [r1, r0, lsl #0x2]
    cmp r0, #0x0
    beq .L_48
    blx r0
    cmp r0, #0x0
    beq .L_40
    ldr r0, _LIT0
    mov r1, #0x0
    ldr r2, [r0]
    add r2, r2, #0x1
    str r2, [r0]
    str r1, [r0, #0x4]
.L_40:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_48:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov019_021b5e20
_LIT1: .word data_ov019_021b5b20
