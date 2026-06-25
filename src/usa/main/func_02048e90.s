; func_02048e90 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219dba0
        .extern func_02055f78
        .extern func_02092fc8
        .extern func_020b3714
        .global func_02048e90
        .arm
func_02048e90:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    ldr r0, _LIT0
    mov r5, #0x0
    ldr r4, [r0]
    bl func_02092fc8
    ldr r3, [r4, #0xc]
    ldr r2, [r4, #0x10]
    subs r3, r0, r3
    sbc r0, r1, r2
    mov r1, r0, lsl #0x6
    ldr r2, _LIT1
    orr r1, r1, r3, lsr #0x1a
    mov r0, r3, lsl #0x6
    mov r3, r5
    bl func_020b3714
    cmp r1, #0x0
    cmpeq r0, #0x12c
    bcc .L_80
    ldr r1, [r4, #0x8]
    ldr r0, _LIT0
    add r1, r1, #0x1
    str r1, [r4, #0x8]
    ldr r0, [r0]
    ldr r0, [r0, #0x4]
    bl func_02055f78
    mov r5, r0
    bl func_02092fc8
    ldr r2, _LIT0
    ldr r2, [r2]
    str r0, [r2, #0xc]
    str r1, [r2, #0x10]
.L_80:
    mov r0, r5
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_0219dba0
_LIT1: .word 0x000082ea
