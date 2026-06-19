; func_ov002_02246e5c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cacc0
        .extern func_ov002_021b9128
        .global func_ov002_02246e5c
        .arm
func_ov002_02246e5c:
    stmdb sp!, {r3, lr}
    ldr r2, _LIT0
    ldr r2, [r2, r1, lsl #0x2]
    mov r1, r2, lsl #0x6
    cmp r0, r1, lsr #0x13
    moveq r0, #0x1
    ldmeqia sp!, {r3, pc}
    ldr r1, _LIT1
    cmp r0, r1
    beq .L_11cc
    add r1, r1, #0x7e
    cmp r0, r1
    beq .L_11e0
    b .L_11f4
.L_11cc:
    mov r0, r2, lsl #0x13
    mov r0, r0, lsr #0x13
    mov r1, #0x2
    bl func_ov002_021b9128
    ldmia sp!, {r3, pc}
.L_11e0:
    mov r0, r2, lsl #0x13
    mov r0, r0, lsr #0x13
    mov r1, #0x5
    bl func_ov002_021b9128
    ldmia sp!, {r3, pc}
.L_11f4:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022cacc0
_LIT1: .word 0x00001698
