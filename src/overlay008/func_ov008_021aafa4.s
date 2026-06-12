; func_ov008_021aafa4 - whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021040ac
        .extern data_ov008_021b2440
        .extern data_ov008_021b2780
        .global func_ov008_021aafa4
        .arm
func_ov008_021aafa4:
    stmdb sp!, {r3, lr}
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r0, [r0, #0xb6c]
    ldr r0, [r1, r0, lsl #0x2]
    cmp r0, #0x0
    beq .L_540
    blx r0
    cmp r0, #0x0
    beq .L_538
    ldr r1, _LIT2
    mov r2, #0x0
    strh r2, [r1, #0x2]
    ldr r0, _LIT0
    strh r2, [r1, #0x4]
    ldr r1, [r0, #0xb6c]
    add r1, r1, #0x1
    str r1, [r0, #0xb6c]
.L_538:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_540:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
_LIT0: .word data_021040ac
_LIT1: .word data_ov008_021b2440
_LIT2: .word data_ov008_021b2780
