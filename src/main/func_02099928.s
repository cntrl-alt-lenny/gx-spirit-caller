; func_02099928 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02099928
        .arm
func_02099928:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
    ldmia r0, {r3, r9, sl, fp, ip}
    sub sp, sp, #0x84
    str r2, [sp, #0x80]
.L_660:
    ldr r8, [pc, #-40]
    ldr r7, [pc, #-48]
    mov r6, sp
    mov r5, #0x0
.L_670:
    ldr r4, [r1], #0x4
    add r2, r8, ip
    add r2, r2, r3, ror #0x1b
    and lr, r4, r7
    and r4, r7, r4, ror #0x18
    orr r4, r4, lr, ror #0x8
    str r4, [r6, #0x40]
    str r4, [r6], #0x4
    add r2, r2, r4
    eor r4, sl, fp
    and r4, r4, r9
    eor r4, r4, fp
    add r2, r2, r4
    mov r9, r9, ror #0x2
    mov ip, fp
    mov fp, sl
    mov sl, r9
    mov r9, r3
    mov r3, r2
    add r5, r5, #0x4
    cmp r5, #0x40
    blt .L_670
    mov r7, #0x0
    mov r6, sp
.L_6d0:
    ldr r2, [r6]
    ldr r5, [r6, #0x8]
    ldr r4, [r6, #0x20]
    ldr lr, [r6, #0x34]
    eor r2, r2, r5
    eor r4, r4, lr
    eor r2, r2, r4
    mov r2, r2, ror #0x1f
    str r2, [r6, #0x40]
    str r2, [r6], #0x4
    add r2, r2, ip
    add r2, r2, r8
    add r2, r2, r3, ror #0x1b
    eor r4, sl, fp
    and r4, r4, r9
    eor r4, r4, fp
    add r2, r2, r4
    mov r9, r9, ror #0x2
    mov ip, fp
    mov fp, sl
    mov sl, r9
    mov r9, r3
    mov r3, r2
    add r7, r7, #0x4
    cmp r7, #0x10
    blt .L_6d0
    ldr r8, [pc, #-252]
    mov r7, #0x0
.L_740:
    ldr r2, [r6]
    ldr r4, [r6, #0x8]
    ldr lr, [r6, #0x20]
    ldr r5, [r6, #0x34]
    eor r2, r2, r4
    eor lr, lr, r5
    eor r2, r2, lr
    mov r2, r2, ror #0x1f
    str r2, [r6, #0x40]
    str r2, [r6], #0x4
    add r2, r2, ip
    add r2, r2, r8
    add r2, r2, r3, ror #0x1b
    eor lr, r9, sl
    eor lr, lr, fp
    add r2, r2, lr
    mov r9, r9, ror #0x2
    mov ip, fp
    mov fp, sl
    mov sl, r9
    mov r9, r3
    mov r3, r2
    add r7, r7, #0x1
    cmp r7, #0xc
    moveq r6, sp
    cmp r7, #0x14
    blt .L_740
    ldr r8, [pc, #-364]
    mov r7, #0x0
.L_7b4:
    ldr r2, [r6]
    ldr lr, [r6, #0x8]
    ldr r5, [r6, #0x20]
    ldr r4, [r6, #0x34]
    eor r2, r2, lr
    eor r5, r5, r4
    eor r2, r2, r5
    mov r2, r2, ror #0x1f
    str r2, [r6, #0x40]
    str r2, [r6], #0x4
    add r2, r2, ip
    add r2, r2, r8
    add r2, r2, r3, ror #0x1b
    orr r5, r9, sl
    and r5, r5, fp
    and r4, r9, sl
    orr r5, r5, r4
    add r2, r2, r5
    mov r9, r9, ror #0x2
    mov ip, fp
    mov fp, sl
    mov sl, r9
    mov r9, r3
    mov r3, r2
    add r7, r7, #0x1
    cmp r7, #0x8
    moveq r6, sp
    cmp r7, #0x14
    blt .L_7b4
    ldr r8, [pc, #-484]
    mov r7, #0x0
.L_830:
    ldr r2, [r6]
    ldr r5, [r6, #0x8]
    ldr r4, [r6, #0x20]
    ldr lr, [r6, #0x34]
    eor r2, r2, r5
    eor r4, r4, lr
    eor r2, r2, r4
    mov r2, r2, ror #0x1f
    str r2, [r6, #0x40]
    str r2, [r6], #0x4
    add r2, r2, ip
    add r2, r2, r8
    add r2, r2, r3, ror #0x1b
    eor r4, r9, sl
    eor r4, r4, fp
    add r2, r2, r4
    mov r9, r9, ror #0x2
    mov ip, fp
    mov fp, sl
    mov sl, r9
    mov r9, r3
    mov r3, r2
    add r7, r7, #0x1
    cmp r7, #0x4
    moveq r6, sp
    cmp r7, #0x14
    blt .L_830
    ldmia r0, {r2, r4, r6, r7, lr}
    add r3, r3, r2
    add r9, r9, r4
    add sl, sl, r6
    add fp, fp, r7
    add ip, ip, lr
    stmia r0, {r3, r9, sl, fp, ip}
    ldr lr, [sp, #0x80]
    subs lr, lr, #0x40
    str lr, [sp, #0x80]
    bgt .L_660
    add sp, sp, #0x84
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, ip, pc}
