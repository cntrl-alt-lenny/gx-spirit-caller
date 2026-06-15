; func_02078624 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02078ccc
        .extern func_02078d88
        .global func_02078624
        .arm
func_02078624:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x54
    str r0, [sp]
    ldr r3, [sp]
    add r0, sp, #0x10
    mov r2, #0x40
    ldr r6, [r3]
    ldr r7, [r3, #0x4]
    ldr r8, [r3, #0x8]
    ldr r5, [r3, #0xc]
    ldr r4, [r3, #0x10]
    bl func_02078ccc
    mov r2, #0x0
    ldr r3, _LIT0
    mov r0, r2
    add r1, sp, #0x10
.L_40:
    eor r9, r8, r5
    mov sl, r6, lsl #0x5
    and r9, r7, r9
    orr sl, sl, r6, lsr #0x1b
    eor r9, r5, r9
    mov fp, r7, lsl #0x1e
    orr r7, fp, r7, lsr #0x2
    eor fp, r7, r8
    add r9, sl, r9
    ldr ip, [r1, r2, lsl #0x2]
    and sl, r6, fp
    add r9, ip, r9
    add r9, r9, r3
    add r4, r4, r9
    add r9, r2, #0x1
    ldr r9, [r1, r9, lsl #0x2]
    eor sl, r8, sl
    mov fp, r4, lsl #0x5
    orr fp, fp, r4, lsr #0x1b
    add sl, fp, sl
    add sl, r9, sl
    mov r9, r6, lsl #0x1e
    add sl, sl, r3
    add r5, r5, sl
    orr r6, r9, r6, lsr #0x2
    add r9, r2, #0x2
    ldr sl, [r1, r9, lsl #0x2]
    mov r9, r5, lsl #0x5
    orr r9, r9, r5, lsr #0x1b
    eor fp, r6, r7
    and fp, r4, fp
    eor fp, r7, fp
    add r9, r9, fp
    add r9, sl, r9
    add r9, r9, r3
    add r8, r8, r9
    mov r9, r4, lsl #0x1e
    orr r4, r9, r4, lsr #0x2
    add r9, r2, #0x3
    ldr sl, [r1, r9, lsl #0x2]
    mov r9, r8, lsl #0x5
    orr r9, r9, r8, lsr #0x1b
    eor fp, r4, r6
    and fp, r5, fp
    eor fp, r6, fp
    add r9, r9, fp
    add r9, sl, r9
    add r9, r9, r3
    add r7, r7, r9
    mov r9, r5, lsl #0x1e
    orr r5, r9, r5, lsr #0x2
    add r9, r2, #0x4
    ldr sl, [r1, r9, lsl #0x2]
    mov r9, r7, lsl #0x5
    orr r9, r9, r7, lsr #0x1b
    eor fp, r5, r4
    and fp, r8, fp
    eor fp, r4, fp
    add r9, r9, fp
    add r9, sl, r9
    add r9, r9, r3
    add r6, r6, r9
    mov r9, r8, lsl #0x1e
    orr r8, r9, r8, lsr #0x2
    add r2, r2, #0x5
    add r0, r0, #0x1
    cmp r0, #0x3
    blt .L_40
    eor r0, r8, r5
    mov r2, r6, lsl #0x5
    and r0, r7, r0
    orr r3, r2, r6, lsr #0x1b
    eor r0, r5, r0
    add r3, r3, r0
    ldr r9, [sp, #0x4c]
    ldr r0, _LIT0
    add r3, r9, r3
    add r3, r3, r0
    mov r2, r7, lsl #0x1e
    orr r9, r2, r7, lsr #0x2
    mov r0, #0x0
    add r4, r4, r3
    bl func_02078d88
    eor r1, r9, r8
    mov r3, r4, lsl #0x5
    and r1, r6, r1
    mov r2, r6, lsl #0x1e
    orr r3, r3, r4, lsr #0x1b
    eor r1, r8, r1
    add r1, r3, r1
    add r3, r1, r0
    ldr r0, _LIT0
    add r1, sp, #0x10
    add r3, r3, r0
    orr sl, r2, r6, lsr #0x2
    mov r0, #0x1
    add r5, r5, r3
    bl func_02078d88
    eor r1, sl, r9
    mov r2, r5, lsl #0x5
    and r1, r4, r1
    orr r2, r2, r5, lsr #0x1b
    eor r1, r9, r1
    add r1, r2, r1
    add r2, r1, r0
    ldr r0, _LIT0
    mov r1, r4, lsl #0x1e
    add r0, r2, r0
    orr r6, r1, r4, lsr #0x2
    add r8, r8, r0
    add r1, sp, #0x10
    mov r0, #0x2
    bl func_02078d88
    mov r1, r8, lsl #0x5
    orr r2, r1, r8, lsr #0x1b
    eor r1, r6, sl
    and r1, r5, r1
    eor r1, sl, r1
    add r1, r2, r1
    add r2, r1, r0
    ldr r0, _LIT0
    mov r1, r5, lsl #0x1e
    add r0, r2, r0
    orr r7, r1, r5, lsr #0x2
    add r9, r9, r0
    mov r0, #0x3
    add r1, sp, #0x10
    bl func_02078d88
    mov r1, r9, lsl #0x5
    orr r2, r1, r9, lsr #0x1b
    eor r1, r7, r6
    and r1, r8, r1
    eor r1, r6, r1
    add r1, r2, r1
    add r2, r1, r0
    ldr r0, _LIT0
    mov r1, r8, lsl #0x1e
    add r0, r2, r0
    add sl, sl, r0
    mov r0, #0x0
    ldr r4, _LIT1
    orr r8, r1, r8, lsr #0x2
    mov r5, #0x4
    str r0, [sp, #0xc]
    add fp, sp, #0x10
.L_284:
    mov r0, r5
    mov r1, fp
    bl func_02078d88
    mov r2, sl, lsl #0x5
    eor r1, r9, r8
    orr r2, r2, sl, lsr #0x1b
    eor r1, r7, r1
    add r1, r2, r1
    add r0, r1, r0
    add r1, r0, r4
    mov r0, r9, lsl #0x1e
    add r6, r6, r1
    orr r9, r0, r9, lsr #0x2
    add r0, r5, #0x1
    mov r1, fp
    bl func_02078d88
    mov r1, r6, lsl #0x5
    orr r2, r1, r6, lsr #0x1b
    eor r1, sl, r9
    eor r1, r8, r1
    add r1, r2, r1
    add r0, r1, r0
    add r0, r0, r4
    add r7, r7, r0
    mov r0, sl, lsl #0x1e
    orr sl, r0, sl, lsr #0x2
    add r0, r5, #0x2
    and r5, r0, #0xf
    mov r0, r5
    mov r1, fp
    bl func_02078d88
    mov r1, r7, lsl #0x5
    orr r2, r1, r7, lsr #0x1b
    eor r1, r6, sl
    eor r1, r9, r1
    add r1, r2, r1
    add r0, r1, r0
    add r0, r0, r4
    add r8, r8, r0
    mov r0, r6, lsl #0x1e
    orr r6, r0, r6, lsr #0x2
    add r0, r5, #0x1
    mov r1, fp
    bl func_02078d88
    mov r1, r8, lsl #0x5
    orr r2, r1, r8, lsr #0x1b
    eor r1, r7, r6
    eor r1, sl, r1
    add r1, r2, r1
    add r0, r1, r0
    add r0, r0, r4
    add r9, r9, r0
    mov r0, r7, lsl #0x1e
    orr r7, r0, r7, lsr #0x2
    add r0, r5, #0x2
    mov r1, fp
    bl func_02078d88
    mov r1, r9, lsl #0x5
    orr r2, r1, r9, lsr #0x1b
    eor r1, r8, r7
    eor r1, r6, r1
    add r1, r2, r1
    add r0, r1, r0
    add r0, r0, r4
    add sl, sl, r0
    mov r0, r8, lsl #0x1e
    orr r8, r0, r8, lsr #0x2
    ldr r0, [sp, #0xc]
    add r5, r5, #0x3
    add r0, r0, #0x1
    str r0, [sp, #0xc]
    cmp r0, #0x4
    blt .L_284
    mov r0, #0x0
    ldr r4, _LIT2
    str r0, [sp, #0x8]
    add fp, sp, #0x10
.L_3b8:
    mov r0, r5
    mov r1, fp
    bl func_02078d88
    orr r2, r8, r7
    mov r1, sl, lsl #0x5
    and r3, r9, r2
    and r2, r8, r7
    orr r1, r1, sl, lsr #0x1b
    orr r2, r3, r2
    add r1, r1, r2
    add r1, r1, r0
    mov r0, r9, lsl #0x1e
    add r1, r1, r4
    add r6, r6, r1
    orr r9, r0, r9, lsr #0x2
    add r0, r5, #0x1
    mov r1, fp
    bl func_02078d88
    orr r2, r9, r8
    mov r1, r6, lsl #0x5
    and r3, sl, r2
    and r2, r9, r8
    orr r1, r1, r6, lsr #0x1b
    orr r2, r3, r2
    add r1, r1, r2
    add r0, r1, r0
    add r0, r0, r4
    add r7, r7, r0
    mov r0, sl, lsl #0x1e
    orr sl, r0, sl, lsr #0x2
    add r0, r5, #0x2
    mov r1, fp
    bl func_02078d88
    orr r2, sl, r9
    mov r1, r7, lsl #0x5
    and r3, r6, r2
    and r2, sl, r9
    orr r1, r1, r7, lsr #0x1b
    orr r2, r3, r2
    add r1, r1, r2
    add r0, r1, r0
    add r0, r0, r4
    add r8, r8, r0
    mov r0, r6, lsl #0x1e
    orr r6, r0, r6, lsr #0x2
    add r0, r5, #0x3
    and r5, r0, #0xf
    mov r0, r5
    mov r1, fp
    bl func_02078d88
    orr r2, r6, sl
    mov r1, r8, lsl #0x5
    and r3, r7, r2
    and r2, r6, sl
    orr r1, r1, r8, lsr #0x1b
    orr r2, r3, r2
    add r1, r1, r2
    add r0, r1, r0
    add r0, r0, r4
    add r9, r9, r0
    mov r0, r7, lsl #0x1e
    orr r7, r0, r7, lsr #0x2
    add r0, r5, #0x1
    mov r1, fp
    bl func_02078d88
    orr r2, r7, r6
    mov r1, r9, lsl #0x5
    and r3, r8, r2
    and r2, r7, r6
    orr r1, r1, r9, lsr #0x1b
    orr r2, r3, r2
    add r1, r1, r2
    add r0, r1, r0
    add r0, r0, r4
    add sl, sl, r0
    mov r0, r8, lsl #0x1e
    orr r8, r0, r8, lsr #0x2
    ldr r0, [sp, #0x8]
    add r5, r5, #0x2
    add r0, r0, #0x1
    str r0, [sp, #0x8]
    cmp r0, #0x4
    blt .L_3b8
    mov r0, #0x0
    ldr r4, _LIT3
    str r0, [sp, #0x4]
    add fp, sp, #0x10
.L_514:
    mov r0, r5
    mov r1, fp
    bl func_02078d88
    mov r2, sl, lsl #0x5
    eor r1, r9, r8
    orr r2, r2, sl, lsr #0x1b
    eor r1, r7, r1
    add r1, r2, r1
    add r0, r1, r0
    add r1, r0, r4
    mov r0, r9, lsl #0x1e
    add r6, r6, r1
    orr r9, r0, r9, lsr #0x2
    add r0, r5, #0x1
    mov r1, fp
    bl func_02078d88
    mov r1, r6, lsl #0x5
    orr r2, r1, r6, lsr #0x1b
    eor r1, sl, r9
    eor r1, r8, r1
    add r1, r2, r1
    add r0, r1, r0
    add r0, r0, r4
    add r7, r7, r0
    mov r0, sl, lsl #0x1e
    orr sl, r0, sl, lsr #0x2
    add r0, r5, #0x2
    mov r1, fp
    bl func_02078d88
    mov r1, r7, lsl #0x5
    orr r2, r1, r7, lsr #0x1b
    eor r1, r6, sl
    eor r1, r9, r1
    add r1, r2, r1
    add r0, r1, r0
    add r0, r0, r4
    add r8, r8, r0
    mov r0, r6, lsl #0x1e
    orr r6, r0, r6, lsr #0x2
    add r0, r5, #0x3
    mov r1, fp
    bl func_02078d88
    mov r1, r8, lsl #0x5
    orr r2, r1, r8, lsr #0x1b
    eor r1, r7, r6
    eor r1, sl, r1
    add r1, r2, r1
    add r0, r1, r0
    add r0, r0, r4
    add r9, r9, r0
    mov r0, r7, lsl #0x1e
    orr r7, r0, r7, lsr #0x2
    add r0, r5, #0x4
    and r5, r0, #0xf
    mov r0, r5
    mov r1, fp
    bl func_02078d88
    mov r1, r9, lsl #0x5
    orr r2, r1, r9, lsr #0x1b
    eor r1, r8, r7
    eor r1, r6, r1
    add r1, r2, r1
    add r0, r1, r0
    add r0, r0, r4
    add sl, sl, r0
    mov r0, r8, lsl #0x1e
    orr r8, r0, r8, lsr #0x2
    ldr r0, [sp, #0x4]
    add r5, r5, #0x1
    add r0, r0, #0x1
    str r0, [sp, #0x4]
    cmp r0, #0x4
    blt .L_514
    ldr r0, [sp]
    ldr r0, [r0]
    add r1, r0, sl
    ldr r0, [sp]
    str r1, [r0]
    ldr r0, [r0, #0x4]
    add r1, r0, r9
    ldr r0, [sp]
    str r1, [r0, #0x4]
    ldr r0, [r0, #0x8]
    add r1, r0, r8
    ldr r0, [sp]
    str r1, [r0, #0x8]
    ldr r0, [r0, #0xc]
    add r1, r0, r7
    ldr r0, [sp]
    str r1, [r0, #0xc]
    ldr r0, [r0, #0x10]
    add r1, r0, r6
    ldr r0, [sp]
    str r1, [r0, #0x10]
    add sp, sp, #0x54
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bx lr
_LIT0: .word 0x5a827999
_LIT1: .word 0x6ed9eba1
_LIT2: .word 0x8f1bbcdc
_LIT3: .word 0xca62c1d6
