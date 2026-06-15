; func_0205121c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ff9c4
        .extern func_02049038
        .extern func_020498dc
        .extern func_020498f0
        .extern func_0204a4f0
        .extern func_0204aaf4
        .extern func_0204ab88
        .extern func_0204d284
        .extern func_0204d438
        .extern func_0204f310
        .extern func_02051618
        .extern func_02068f78
        .global func_0205121c
        .arm
func_0205121c:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x18
    mov r5, r2
    mov r6, r0
    mov r4, r3
    mov r2, r1
    mov r3, r5
    mov r0, #0x3
    mov r1, #0x0
    bl func_0204f310
    bl func_020498f0
    str r4, [r0, #0x46c]
    bl func_020498f0
    ldr r1, [sp, #0x28]
    str r1, [r0, #0x470]
    bl func_020498f0
    mov r1, #0x1
    strb r1, [r0, #0x17]
    bl func_020498f0
    mov r4, r0
    bl func_020498f0
    ldr r0, [r0, #0x200]
    str r0, [r4, #0x20]
    bl func_020498f0
    str r6, [r0, #0xf4]
    mov r0, #0x4
    bl func_020498dc
    bl func_020498f0
    ldr r0, [r0, #0xe4]
    cmp r0, #0x0
    bne .L_11b0
    bl func_020498f0
    mov r6, r0
    bl func_020498f0
    mov r5, r0
    bl func_020498f0
    mov r4, r0
    bl func_020498f0
    mov r2, r0
    mov r0, #0x14
    str r0, [sp]
    mov r0, #0x1
    str r0, [sp, #0x4]
    mov r3, #0x0
    str r3, [sp, #0x8]
    ldr r0, _LIT0
    str r0, [sp, #0xc]
    str r3, [sp, #0x10]
    ldr r0, [r5, #0x2f4]
    ldr r1, [r4, #0x2f4]
    ldr r2, [r2, #0x2f8]
    bl func_02068f78
    str r0, [r6, #0xe4]
.L_11b0:
    bl func_020498f0
    ldr r0, [r0, #0xe4]
    cmp r0, #0x0
    bne .L_11d4
    mov r0, #0x5
    bl func_0204aaf4
    cmp r0, #0x0
    addne sp, sp, #0x18
    ldmneia sp!, {r4, r5, r6, pc}
.L_11d4:
    ldr r1, _LIT1
    mov r0, #0x5
    mov r2, #0x0
    bl func_02049038
    bl func_0204ab88
    cmp r0, #0x0
    addne sp, sp, #0x18
    ldmneia sp!, {r4, r5, r6, pc}
    bl func_020498f0
    ldr r0, [r0, #0x10]
    cmp r0, #0x0
    bne .L_121c
    bl func_020498f0
    ldr r0, [r0, #0x200]
    bl func_02051618
    cmp r0, #0x0
    addne sp, sp, #0x18
    ldmneia sp!, {r4, r5, r6, pc}
.L_121c:
    bl func_020498f0
    ldr r0, [r0, #0xf4]
    mov r1, #0x0
    bl func_0204d284
    bl func_0204d438
    cmp r0, #0x0
    add sp, sp, #0x18
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word func_0204a4f0
_LIT1: .word data_020ff9c4
