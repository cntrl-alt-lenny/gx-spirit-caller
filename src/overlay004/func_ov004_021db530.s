; func_ov004_021db530 - whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov004_0220b500
        .extern func_0208e0a0
        .extern func_02094504
        .extern func_ov000_021abe54
        .extern func_ov004_021ca0a4
        .extern func_ov004_021da874
        .extern func_ov004_021db148
        .global func_ov004_021db530
        .arm
func_ov004_021db530:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x8
    ldr r4, _LIT0
    ldr r6, _LIT1
    mov r5, #0x0
.L_978:
    ldr r0, [r4, #0xa4]
    sub r1, r0, #0x8
    smull r0, r2, r6, r1
    mov r0, r1, lsr #0x1f
    add r2, r0, r2, asr #0x3
    add r0, r2, r5
    bl func_ov004_021db148
    add r5, r5, #0x1
    cmp r5, #0x5
    blt .L_978
    ldr r0, [r4, #0xa4]
    ldr r2, _LIT1
    sub r1, r0, #0x8
    mov r0, r1, lsr #0x1f
    smull r1, r3, r2, r1
    add r3, r0, r3, asr #0x3
    add r1, r3, #0x5
    mov r0, #0x30
    mul r0, r1, r0
    mov r1, r0, lsr #0x1f
    rsb r0, r1, r0, lsl #0x18
    add r1, r1, r0, ror #0x18
    mov r0, r1, asr #0x2
    add r0, r1, r0, lsr #0x1d
    mov r5, r0, asr #0x3
    bl func_0208e0a0
    add r1, r0, r5, lsl #0x6
    mov r0, #0x0
    mov r2, #0x40
    bl func_02094504
    bl func_0208e0a0
    add r1, r5, #0x1
    mov r2, r1, lsr #0x1f
    rsb r1, r2, r1, lsl #0x1b
    add r1, r2, r1, ror #0x1b
    add r1, r0, r1, lsl #0x6
    mov r0, #0x0
    mov r2, #0x40
    bl func_02094504
    ldr r1, [r4, #0xa4]
    ldr r2, [r4, #0x8c]
    ldr r0, _LIT2
    rsb r2, r2, #0x0
    and r2, r2, r0
    sub r1, r1, #0x20
    mov r1, r1, lsl #0x18
    mov r0, r0, lsl #0x10
    and r1, r0, r1, lsr #0x8
    ldr r0, _LIT3
    orr r1, r2, r1
    str r1, [r0]
    ldr r0, [r4, #0x8c]
    cmp r0, #0x100
    bgt .L_b3c
    ldr r0, [r4, #0x98]
    cmp r0, #0x4
    blt .L_b3c
    mov r1, #0x2
    add r0, r4, #0xf90
    str r1, [sp]
    mov r2, #0x8
    str r2, [sp, #0x4]
    add r0, r0, #0x5000
    mov r2, #0xe4
    mov r3, #0x22
    bl func_ov004_021ca0a4
    ldr r0, [r4, #0x204]
    mov r1, #0x2
    mov r0, r0, lsl #0x2
    mov r0, r0, asr #0x1c
    cmp r0, #0x1
    moveq r2, #0x1
    movne r2, #0x0
    add r0, r4, #0xf90
    add r5, r2, #0x2
    str r1, [sp]
    add r0, r0, #0x5000
    mov r2, #0xe5
    mov r3, #0x23
    str r5, [sp, #0x4]
    bl func_ov004_021ca0a4
    add r0, r4, #0x1f8
    bl func_ov000_021abe54
    ldr r1, [r4, #0x204]
    mov r3, r0
    mov r0, r1, lsl #0x2
    mov r0, r0, asr #0x1c
    cmp r0, #0x3
    moveq r2, #0x1
    movne r2, #0x0
    mov r1, #0x2
    add r0, r4, #0xf90
    str r1, [sp]
    add r2, r2, #0x6
    str r2, [sp, #0x4]
    add r0, r0, #0x5000
    mov r2, #0xe5
    bl func_ov004_021ca0a4
    ldr r0, [r4, #0x204]
    mov r1, #0x2
    mov r0, r0, lsl #0x2
    mov r0, r0, asr #0x1c
    cmp r0, #0x5
    moveq r2, #0x1
    movne r2, #0x0
    add r0, r4, #0xf90
    add r5, r2, #0x4
    str r1, [sp]
    add r0, r0, #0x5000
    mov r2, #0xe5
    mov r3, #0xaa
    str r5, [sp, #0x4]
    bl func_ov004_021ca0a4
.L_b3c:
    add r0, r4, #0x3000
    ldr r0, [r0, #0xc90]
    cmp r0, #0x0
    ldr r0, [r4, #0x8c]
    beq .L_b74
    cmp r0, #0x200
    addlt r0, r0, #0x40
    strlt r0, [r4, #0x8c]
    ldr r0, [r4, #0x8c]
    cmp r0, #0x100
    bne .L_b94
    mov r0, #0x1
    bl func_ov004_021da874
    b .L_b94
.L_b74:
    cmp r0, #0x0
    subgt r0, r0, #0x40
    strgt r0, [r4, #0x8c]
    ldr r0, [r4, #0x8c]
    cmp r0, #0x100
    bne .L_b94
    mov r0, #0x0
    bl func_ov004_021da874
.L_b94:
    ldr r0, [r4, #0xa8]
    str r0, [r4, #0xac]
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov004_0220b500
_LIT1: .word 0x2aaaaaab
_LIT2: .word 0x000001ff
_LIT3: .word 0x04001018
