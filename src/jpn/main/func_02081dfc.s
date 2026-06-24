; func_02081dfc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0208ff60
        .extern func_0208ffb8
        .extern func_0209002c
        .global func_02081dfc
        .arm
func_02081dfc:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    movs r4, r1
    mov r5, r0
    beq .L_3a0
    bl func_0209002c
.L_3a0:
    ldrh r2, [r5, #0x30]
    ldr r0, [r5, #0x38]
    ldr r3, [r5, #0x2c]
    ldr r1, _LIT0
    add r0, r5, r0
    and r1, r3, r1
    mov r1, r1, lsl #0x3
    mov r2, r2, lsl #0x3
    bl func_0208ffb8
    ldrh r0, [r5, #0x32]
    cmp r4, #0x0
    addeq sp, sp, #0x4
    orr r0, r0, #0x1
    strh r0, [r5, #0x32]
    ldmeqia sp!, {r4, r5, pc}
    bl func_0208ff60
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
_LIT0: .word 0x0000ffff
