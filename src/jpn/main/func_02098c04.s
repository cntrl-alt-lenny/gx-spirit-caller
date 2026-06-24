; func_02098c04 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021023e8
        .extern data_021024a8
        .global func_02098c04
        .arm
func_02098c04:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x4
    add r3, r0, #0x18
    ldr r5, [r0]
    ldr r4, [r0, #0x4]
    ldr lr, [r0, #0x8]
    ldr ip, [r0, #0xc]
    ldr r2, _LIT0
    mov r8, r3
    mov r7, #0x0
.L_28:
    mvn r1, r4
    and r6, r4, lr
    and r1, r1, ip
    orr r1, r6, r1
    ldr r6, [r8]
    add r1, r5, r1
    ldr r5, [r2]
    add r1, r6, r1
    add r5, r5, r1
    mov r1, r5, lsl #0x7
    orr r1, r1, r5, lsr #0x19
    add r5, r4, r1
    mvn r1, r5
    and r6, r5, r4
    and r1, r1, lr
    orr r1, r6, r1
    ldr r6, [r8, #0x4]
    add r1, ip, r1
    ldr r9, [r2, #0x4]
    add r1, r6, r1
    add r6, r9, r1
    mov r1, r6, lsl #0xc
    orr r1, r1, r6, lsr #0x14
    add ip, r5, r1
    mvn r1, ip
    and r6, ip, r5
    and r1, r1, r4
    orr r6, r6, r1
    add r1, r8, #0xc
    ldr r9, [r8, #0x8]
    add r6, lr, r6
    add r6, r9, r6
    ldr r9, [r2, #0x8]
    ldr r1, [r1]
    add sl, r9, r6
    add r6, r2, #0xc
    ldr r6, [r6]
    mov r9, sl, lsl #0x11
    orr r9, r9, sl, lsr #0xf
    add lr, ip, r9
    add r2, r2, #0x10
    add r8, r8, #0x10
    and sl, lr, ip
    mvn r9, lr
    and r9, r9, r5
    orr r9, sl, r9
    add r4, r4, r9
    add r1, r1, r4
    add r4, r6, r1
    mov r1, r4, lsl #0x16
    orr r1, r1, r4, lsr #0xa
    add r4, lr, r1
    add r7, r7, #0x1
    cmp r7, #0x4
    blt .L_28
    ldr r6, _LIT1
    mov r1, #0x0
.L_10c:
    mvn r7, ip
    ldr r9, [r6]
    and r8, r4, ip
    and r7, lr, r7
    orr r7, r8, r7
    ldr r8, [r3, r9, lsl #0x2]
    add r5, r5, r7
    ldr r7, [r2]
    add r5, r8, r5
    add r7, r7, r5
    mov r5, r7, lsl #0x5
    orr r5, r5, r7, lsr #0x1b
    add r5, r4, r5
    mvn r8, lr
    ldr r7, [r6, #0x4]
    and r9, r5, lr
    and r8, r4, r8
    orr sl, r9, r8
    mvn r8, r4
    ldr r9, [r6, #0x8]
    ldr fp, [r3, r7, lsl #0x2]
    add r7, ip, sl
    add sl, fp, r7
    add r7, r6, #0xc
    ldr r9, [r3, r9, lsl #0x2]
    and r8, r5, r8
    ldr r7, [r7]
    ldr fp, [r2, #0x4]
    ldr r7, [r3, r7, lsl #0x2]
    add fp, fp, sl
    mov sl, fp, lsl #0x9
    orr sl, sl, fp, lsr #0x17
    add ip, r5, sl
    ldr sl, [r2, #0x8]
    and fp, ip, r4
    orr r8, fp, r8
    add r8, lr, r8
    add r8, r9, r8
    add sl, sl, r8
    add r8, r2, #0xc
    ldr r8, [r8]
    mov r9, sl, lsl #0xe
    orr r9, r9, sl, lsr #0x12
    add lr, ip, r9
    add r2, r2, #0x10
    add r6, r6, #0x10
    and sl, lr, r5
    mvn r9, r5
    and r9, ip, r9
    orr r9, sl, r9
    add r4, r4, r9
    add r4, r7, r4
    add r7, r8, r4
    mov r4, r7, lsl #0x14
    orr r4, r4, r7, lsr #0xc
    add r4, lr, r4
    add r1, r1, #0x1
    cmp r1, #0x4
    blt .L_10c
    mov r7, #0x0
.L_1fc:
    ldr r8, [r6]
    eor r1, r4, lr
    eor r1, ip, r1
    add r1, r5, r1
    ldr r8, [r3, r8, lsl #0x2]
    ldr r5, [r2]
    add r1, r8, r1
    add r5, r5, r1
    mov r1, r5, lsl #0x4
    orr r1, r1, r5, lsr #0x1c
    add r5, r4, r1
    ldr r8, [r6, #0x4]
    eor r1, r5, r4
    eor r1, lr, r1
    ldr r8, [r3, r8, lsl #0x2]
    add r1, ip, r1
    ldr r9, [r6, #0x8]
    ldr sl, [r2, #0x4]
    add r1, r8, r1
    add r8, sl, r1
    mov r1, r8, lsl #0xb
    orr r1, r1, r8, lsr #0x15
    add ip, r5, r1
    eor r8, ip, r5
    eor r8, r4, r8
    ldr r9, [r3, r9, lsl #0x2]
    add r8, lr, r8
    add r9, r9, r8
    ldr sl, [r2, #0x8]
    add r1, r2, #0xc
    ldr r8, [r6, #0xc]
    add sl, sl, r9
    ldr r9, [r3, r8, lsl #0x2]
    mov r8, sl, lsl #0x10
    orr r8, r8, sl, lsr #0x10
    add lr, ip, r8
    eor r8, lr, ip
    eor r8, r5, r8
    add r4, r4, r8
    add r7, r7, #0x1
    ldr r1, [r1]
    add r4, r9, r4
    add r4, r1, r4
    mov r1, r4, lsl #0x17
    orr r1, r1, r4, lsr #0x9
    add r2, r2, #0x10
    add r6, r6, #0x10
    add r4, lr, r1
    cmp r7, #0x4
    blt .L_1fc
    mov sl, #0x0
.L_2c8:
    mvn r1, ip
    ldr r7, [r6]
    orr r1, r4, r1
    eor r1, lr, r1
    ldr r7, [r3, r7, lsl #0x2]
    add r1, r5, r1
    ldr r5, [r2]
    add r1, r7, r1
    add r5, r5, r1
    mov r1, r5, lsl #0x6
    orr r1, r1, r5, lsr #0x1a
    add r5, r4, r1
    mvn r1, lr
    ldr r7, [r6, #0x4]
    orr r1, r5, r1
    eor r1, r4, r1
    ldr r8, [r6, #0x8]
    ldr r7, [r3, r7, lsl #0x2]
    add r1, ip, r1
    ldr r9, [r2, #0x4]
    add r1, r7, r1
    add r9, r9, r1
    mov r7, r9, lsl #0xa
    add r1, r6, #0xc
    orr r9, r7, r9, lsr #0x16
    ldr r1, [r1]
    add r7, r2, #0xc
    add ip, r5, r9
    ldr r8, [r3, r8, lsl #0x2]
    ldr r7, [r7]
    ldr r1, [r3, r1, lsl #0x2]
    ldr r9, [r2, #0x8]
    mvn fp, r4
    orr fp, ip, fp
    eor fp, r5, fp
    add fp, lr, fp
    add r8, r8, fp
    add r9, r9, r8
    mov r8, r9, lsl #0xf
    orr r8, r8, r9, lsr #0x11
    add lr, ip, r8
    add r2, r2, #0x10
    add r6, r6, #0x10
    mvn r8, r5
    orr r8, lr, r8
    eor r8, ip, r8
    add r4, r4, r8
    add r1, r1, r4
    add r4, r7, r1
    mov r1, r4, lsl #0x15
    orr r1, r1, r4, lsr #0xb
    add r4, lr, r1
    add sl, sl, #0x1
    cmp sl, #0x4
    blt .L_2c8
    ldr r1, [r0]
    add r1, r1, r5
    str r1, [r0]
    ldr r1, [r0, #0x4]
    add r1, r1, r4
    str r1, [r0, #0x4]
    ldr r1, [r0, #0x8]
    add r1, r1, lr
    str r1, [r0, #0x8]
    ldr r1, [r0, #0xc]
    add r1, r1, ip
    str r1, [r0, #0xc]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bx lr
_LIT0: .word data_021024a8
_LIT1: .word data_021023e8
