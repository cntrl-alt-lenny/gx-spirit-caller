; func_02018f2c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern func_0208bf3c
        .global func_02018f2c
        .arm
func_02018f2c:
    stmdb sp!, {r3, lr}
    bl GetSystemWork
    ldr r3, [r0, #0x914]
    ldr r2, [r0, #0x90c]
    ldr r1, [r0, #0x910]
    ldr r0, [r0, #0x908]
    sub ip, r3, r2
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
    bl func_0208bf3c
    ldmia sp!, {r3, pc}
