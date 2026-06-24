; func_02094770 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_01ff8770
        .extern func_02093b2c
        .extern func_02093b9c
        .global func_02094770
        .arm
func_02094770:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r5, r1
    mov r6, r0
    mov r7, r3
    mvn r1, #0x0
    mov r4, r2
    bl func_02093b9c
    mov r0, r6
    mov r1, r5
    mov r2, r7
    mov r3, #0x1000000
    bl func_02093b2c
    cmp r7, #0x0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, r6, r7, lr}
    bxeq lr
    mov r0, #0x3
    mul r1, r6, r0
    ldr r0, _LIT0
    add r1, r1, #0x2
    add r1, r0, r1, lsl #0x2
.L_ec:
    ldr r0, [r1]
    ands r0, r0, #-2147483648
    bne .L_ec
    ldr r3, _LIT1
    mov r0, r6
    mov r1, r5
    mov r2, r4
    bl func_01ff8770
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
_LIT0: .word 0x040000b0
_LIT1: .word 0xaf000001
