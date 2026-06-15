; func_ov000_021ac478 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .global func_ov000_021ac478
        .arm
func_ov000_021ac478:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r6, r0
    mov r5, r1
    mov r4, r2
    mov r1, r6
    mov r0, #0x0
    mov r2, #0x14
    mov r7, r3
    bl Fill32
    ldr r1, [sp, #0x18]
    ldr r3, [r6]
    ldr r0, _LIT0
    and r2, r7, #0xff
    and r3, r3, r0
    mov r0, r5, lsl #0x17
    orr r5, r3, r0, lsr #0x10
    ldr r0, _LIT1
    and r1, r1, #0xff
    and r3, r5, r0
    mov r0, r4, lsl #0x17
    orr r0, r3, r0, lsr #0x7
    str r0, [r6]
    ldr r0, [r6, #0x4]
    bic r0, r0, #0xff
    orr r3, r0, r2
    bic r2, r3, #0xff00
    mov r0, r1, lsl #0x18
    orr r0, r2, r0, lsr #0x10
    str r0, [r6, #0x4]
    ldr r0, [r6]
    bic r0, r0, #0x1
    orr r0, r0, #0x3
    str r0, [r6]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word 0xffff007f
_LIT1: .word 0xfe00ffff
