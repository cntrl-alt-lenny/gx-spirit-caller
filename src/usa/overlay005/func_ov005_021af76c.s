; func_ov005_021af76c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104e6c
        .extern data_ov005_021b1510
        .extern func_0202c06c
        .global func_ov005_021af76c
        .arm
func_ov005_021af76c:
    stmdb sp!, {r3, lr}
    ldr r2, _LIT0
    ldr r2, [r2, #0x4]
    mov r2, r2, lsl #0x1d
    movs r2, r2, lsr #0x1d
    bne .L_95c
    cmp r1, #0x3
    addls pc, pc, r1, lsl #0x2
    b .L_968
    b .L_934
    b .L_93c
    b .L_948
    b .L_954
.L_934:
    ldr r0, _LIT1
    ldmia sp!, {r3, pc}
.L_93c:
    mov r0, #0xf7
    bl func_0202c06c
    ldmia sp!, {r3, pc}
.L_948:
    mov r0, #0xf9
    bl func_0202c06c
    ldmia sp!, {r3, pc}
.L_954:
    add r0, r0, #0x8c
    ldmia sp!, {r3, pc}
.L_95c:
    add r0, r1, #0xf7
    bl func_0202c06c
    ldmia sp!, {r3, pc}
.L_968:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word data_02104e6c
_LIT1: .word data_ov005_021b1510
