; func_ov004_021da2c8 - whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0208e0a0
        .extern func_02094504
        .global func_ov004_021da2c8
        .arm
func_ov004_021da2c8:
    stmdb sp!, {r3, r4, r5, lr}
    mov r1, #0x30
    mul r2, r0, r1
    mov r1, r2, lsr #0x1f
    rsb r0, r1, r2, lsl #0x18
    add r5, r1, r0, ror #0x18
    cmp r5, #0xd0
    bgt .L_41c
    bl func_0208e0a0
    mov r1, r5, asr #0x2
    add r1, r5, r1, lsr #0x1d
    mov r1, r1, asr #0x3
    add r1, r0, r1, lsl #0x6
    mov r0, #0x0
    mov r2, #0x180
    bl func_02094504
    ldmia sp!, {r3, r4, r5, pc}
.L_41c:
    bl func_0208e0a0
    rsb r4, r5, #0x100
    mov r3, r4, lsl #0x5
    mov r1, r5, asr #0x2
    mov r2, r3, asr #0x2
    add r1, r5, r1, lsr #0x1d
    add r2, r3, r2, lsr #0x1d
    mov r1, r1, asr #0x3
    mov r2, r2, asr #0x3
    add r1, r0, r1, lsl #0x6
    mov r2, r2, lsl #0x1
    mov r0, #0x0
    bl func_02094504
    bl func_0208e0a0
    rsb r1, r4, #0x30
    mov r2, r1, lsl #0x5
    mov r1, r2, asr #0x2
    add r1, r2, r1, lsr #0x1d
    mov r2, r1, asr #0x3
    mov r1, r0
    mov r2, r2, lsl #0x1
    mov r0, #0x0
    bl func_02094504
    ldmia sp!, {r3, r4, r5, pc}
