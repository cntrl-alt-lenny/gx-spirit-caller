; func_02094030 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_01ff86fc
        .extern func_02093c20
        .global func_02094030
        .arm
func_02094030:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r5, r3
    mov r6, r2
    mov r2, r5
    mov r3, #0x0
    mov r8, r0
    mov r7, r1
    bl func_02093c20
    cmp r5, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, lr}
    bxeq lr
    mov r0, #0x3
    mul r1, r8, r0
    ldr r0, _LIT0
    add r1, r1, #0x2
    add r4, r0, r1, lsl #0x2
.L_238:
    ldr r0, [r4]
    ands r0, r0, #-2147483648
    bne .L_238
    mov r3, r5, lsr #0x2
    mov r0, r8
    mov r1, r7
    mov r2, r6
    orr r3, r3, #-2080374784
    bl func_01ff86fc
.L_25c:
    ldr r0, [r4]
    ands r0, r0, #-2147483648
    bne .L_25c
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
_LIT0: .word 0x040000b0
