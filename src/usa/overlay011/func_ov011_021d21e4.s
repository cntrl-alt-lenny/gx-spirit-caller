; func_ov011_021d21e4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0208be54
        .global func_ov011_021d21e4
        .arm
func_ov011_021d21e4:
    stmdb sp!, {r0, r1, r2, r3}
    stmdb sp!, {r3, lr}
    ldr r3, [sp, #0xc]
    ldr r2, [sp, #0x14]
    ldr r1, [sp, #0x10]
    ldr r0, [sp, #0x8]
    sub ip, r2, r3
    sub r1, r1, r0
    smull r0, r2, r1, r1
    adds r3, r0, #0x800
    smull r1, r0, ip, ip
    adc r2, r2, #0x0
    adds r1, r1, #0x800
    mov r3, r3, lsr #0xc
    adc r0, r0, #0x0
    mov r1, r1, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    orr r1, r1, r0, lsl #0x14
    add r0, r3, r1
    bl func_0208be54
    ldmia sp!, {r3, lr}
    add sp, sp, #0x10
    bx lr
