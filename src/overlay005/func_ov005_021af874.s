; func_ov005_021af874 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104f4c
        .extern data_ov005_021b1618
        .extern func_0202c0c0
        .global func_ov005_021af874
        .arm
func_ov005_021af874:
    stmdb sp!, {r3, lr}
    ldr r2, _LIT0
    ldr r2, [r2, #0x4]
    mov r2, r2, lsl #0x1d
    movs r2, r2, lsr #0x1d
    bne .L_180
    cmp r1, #0x3
    addls pc, pc, r1, lsl #0x2
    b .L_18c
    b .L_158
    b .L_160
    b .L_16c
    b .L_178
.L_158:
    ldr r0, _LIT1
    ldmia sp!, {r3, pc}
.L_160:
    mov r0, #0xf7
    bl func_0202c0c0
    ldmia sp!, {r3, pc}
.L_16c:
    mov r0, #0xf9
    bl func_0202c0c0
    ldmia sp!, {r3, pc}
.L_178:
    add r0, r0, #0x8c
    ldmia sp!, {r3, pc}
.L_180:
    add r0, r1, #0xf7
    bl func_0202c0c0
    ldmia sp!, {r3, pc}
.L_18c:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word data_02104f4c
_LIT1: .word data_ov005_021b1618
