; func_0201e818 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020bef80
        .extern func_0208bf8c
        .global func_0201e818
        .arm
func_0201e818:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r1
    mov r6, r2
    mov r5, r3
    bl func_0208bf8c
    mov r4, r0
    mov r0, r7
    bl func_0208bf8c
    mov r1, r6, asr #0x4
    mov r6, r1, lsl #0x1
    add r1, r6, #0x1
    ldr r3, _LIT0
    mov r1, r1, lsl #0x1
    ldrsh r2, [r3, r1]
    mov r1, r6, lsl #0x1
    ldrsh lr, [r3, r1]
    smull r1, r3, r2, r4
    adds r7, r1, #0x800
    smull r1, ip, lr, r4
    adc r3, r3, #0x0
    adds r6, r1, #0x800
    mov r1, r7, lsr #0xc
    orr r1, r1, r3, lsl #0x14
    smull r3, r4, lr, r0
    adc lr, ip, #0x0
    adds ip, r3, #0x800
    mov r6, r6, lsr #0xc
    smull r3, r0, r2, r0
    adc r4, r4, #0x0
    adds r2, r3, #0x800
    mov r3, ip, lsr #0xc
    orr r3, r3, r4, lsl #0x14
    str r1, [r5]
    orr r6, r6, lr, lsl #0x14
    str r6, [r5, #0x4]
    rsb r3, r3, #0x0
    adc r0, r0, #0x0
    mov r1, r2, lsr #0xc
    str r3, [r5, #0x8]
    orr r1, r1, r0, lsl #0x14
    str r1, [r5, #0xc]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_020bef80
