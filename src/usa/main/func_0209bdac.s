; func_0209bdac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0209be24
        .extern func_0209be40
        .global func_0209bdac
        .arm
func_0209bdac:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r1
    bl func_0209be40
    mov r4, r0
    mvn r0, #0x0
    cmp r4, r0
    addeq sp, sp, #0x4
    moveq r1, r0
    ldmeqia sp!, {r4, r5, lr}
    bxeq lr
    mov r0, r5
    bl func_0209be24
    mvn r2, #0x0
    cmp r0, r2
    moveq r1, r2
    beq .L_13c
    ldr r1, _LIT0
    mov r2, #0x0
    umull ip, r3, r4, r1
    mla r3, r4, r2, r3
    mov r2, r4, asr #0x1f
    mla r3, r2, r1, r3
    adds r2, r0, ip
    adc r1, r3, r0, asr #0x1f
.L_13c:
    mov r0, r2
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
_LIT0: .word 0x00015180
