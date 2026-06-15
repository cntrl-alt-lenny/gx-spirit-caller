; func_ov004_021cb834 - whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov004_0220b500
        .extern func_0208e0a0
        .extern func_02094550
        .global func_ov004_021cb834
        .arm
func_ov004_021cb834:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov ip, #0x0
    ldr r4, _LIT0
    ldr r5, _LIT1
    mov lr, ip
    mov r2, ip
.L_334:
    mov r3, r2
    add r8, r4, lr, lsl #0x1
.L_33c:
    add r6, r8, r3, lsl #0x1
    add r6, r6, #0x5000
    ldrh r7, [r6, #0xd8]
    add r3, r3, #0x1
    cmp r3, #0x20
    and r7, r7, r5
    orr r7, r7, r1, lsl #0xc
    strh r7, [r6, #0xd8]
    blt .L_33c
    add ip, ip, #0x1
    cmp ip, #0x6
    add lr, lr, #0x20
    blt .L_334
    mov r1, #0x30
    mul r2, r0, r1
    mov r1, r2, lsr #0x1f
    rsb r0, r1, r2, lsl #0x18
    add r6, r1, r0, ror #0x18
    cmp r6, #0xd0
    bgt .L_3b4
    bl func_0208e0a0
    mov r1, r6, asr #0x2
    add r1, r6, r1, lsr #0x1d
    mov r1, r1, asr #0x3
    add r2, r4, #0xd8
    add r1, r0, r1, lsl #0x6
    add r0, r2, #0x5000
    mov r2, #0x180
    bl func_02094550
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_3b4:
    bl func_0208e0a0
    rsb r5, r6, #0x100
    mov r3, r5, lsl #0x5
    mov r1, r6, asr #0x2
    mov r2, r3, asr #0x2
    add r1, r6, r1, lsr #0x1d
    add r2, r3, r2, lsr #0x1d
    mov r1, r1, asr #0x3
    mov r6, r2, asr #0x3
    add r2, r4, #0xd8
    add r1, r0, r1, lsl #0x6
    add r0, r2, #0x5000
    mov r2, r6, lsl #0x1
    bl func_02094550
    bl func_0208e0a0
    rsb r1, r5, #0x30
    mov r3, r1, lsl #0x5
    mov r2, r3, asr #0x2
    add r1, r4, #0xd8
    add r2, r3, r2, lsr #0x1d
    mov r2, r2, asr #0x3
    add r3, r1, #0x5000
    mov r1, r0
    add r0, r3, r6, lsl #0x1
    mov r2, r2, lsl #0x1
    bl func_02094550
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov004_0220b500
_LIT1: .word 0x00000fff
