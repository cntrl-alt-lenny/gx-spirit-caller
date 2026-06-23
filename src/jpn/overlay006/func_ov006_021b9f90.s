; func_ov006_021b9f90 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104e74
        .global func_ov006_021b9f90
        .arm
func_ov006_021b9f90:
    stmdb sp!, {r4, lr}
    mov ip, #0x0
    ldr r3, _LIT0
    mov lr, ip
    add r4, r0, #0xa0
    mov r1, #0x1
.L_1b0:
    ldr r2, [r4, #0x20]
    add r4, r4, #0x24
    mov r2, r2, lsl #0x1f
    movs r2, r2, lsr #0x1f
    orrne ip, ip, r1, lsl lr
    add lr, lr, #0x1
    cmp lr, #0x5
    blt .L_1b0
    ldr r0, [r0, #0x40]
    cmp r0, #0x5
    streqb ip, [r3, #0x1]
    beq .L_1ec
    cmp r0, #0x6
    streqb ip, [r3, #0x2]
    strneb ip, [r3]
.L_1ec:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
_LIT0: .word data_02104e74
