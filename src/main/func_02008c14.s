; func_02008c14 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02105bb0
        .extern func_02008d60
        .global func_02008c14
        .arm
func_02008c14:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x124
    ldr r6, _LIT0
    mov r7, #0x0
    str r7, [r6, #0x4]
    str r7, [r6]
    mov r4, #0x1
    add r5, sp, #0x0
.L_20:
    mov r0, r7
    mov r1, r5
    bl func_02008d60
    cmp r0, #0x0
    beq .L_58
    mov r0, r7, asr #0x4
    add r0, r7, r0, lsr #0x1b
    mov r3, r0, asr #0x5
    mov r1, r7, lsr #0x1f
    rsb r0, r1, r7, lsl #0x1b
    ldr r2, [r6, r3, lsl #0x2]
    add r0, r1, r0, ror #0x1b
    orr r0, r2, r4, lsl r0
    str r0, [r6, r3, lsl #0x2]
.L_58:
    add r7, r7, #0x1
    cmp r7, #0x32
    blt .L_20
    add sp, sp, #0x124
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word data_02105bb0
