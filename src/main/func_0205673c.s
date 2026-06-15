; func_0205673c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020fff40
        .extern func_020453b4
        .extern func_020453e8
        .extern func_02055320
        .extern func_02055330
        .extern func_02056594
        .extern func_020566f4
        .extern func_0205d944
        .extern func_020604a4
        .extern func_020a73d4
        .extern func_020a9950
        .global func_0205673c
        .arm
func_0205673c:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x8
    mov r6, r0
    mov r0, #0x0
    str r0, [r6]
    mov r0, #0x490
    mov r5, r1
    mov r4, r2
    bl func_020453e8
    str r0, [sp]
    cmp r0, #0x0
    addeq sp, sp, #0x8
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r1, #0x0
    mov r2, #0x490
    bl func_020a73d4
    ldr r0, [sp]
    mov r3, #0x0
    strb r3, [r0]
    ldr r0, [sp]
    mov r2, #0x1
    str r3, [r0, #0x418]
    ldr r1, [sp]
    add r0, sp, #0x0
    str r2, [r1, #0x100]
    ldr r1, [sp]
    str r3, [r1, #0x104]
    ldr r1, [sp]
    str r3, [r1, #0x108]
    ldr r1, [sp]
    str r3, [r1, #0x10c]
    ldr r1, [sp]
    str r5, [r1, #0x46c]
    ldr r1, [sp]
    str r4, [r1, #0x470]
    bl func_0205d944
    cmp r0, #0x0
    bne .L_100
    ldr r0, [sp]
    bl func_020453b4
    mov r0, #0x0
    str r0, [sp]
    add sp, sp, #0x8
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
.L_100:
    ldr r0, [sp]
    mov r1, #0x0
    str r1, [r0, #0x420]
    mov r3, r1
.L_110:
    ldr r0, [sp]
    add r0, r0, r1, lsl #0x3
    str r3, [r0, #0x1a4]
    ldr r0, [sp]
    add r0, r0, r1, lsl #0x3
    add r1, r1, #0x1
    str r3, [r0, #0x1a8]
    cmp r1, #0x6
    blt .L_110
    ldr r2, [sp]
    ldr r1, _LIT0
    add r0, sp, #0x0
    str r3, [r2, #0x460]
    bl func_020604a4
    add r0, sp, #0x0
    bl func_02056594
    movs r4, r0
    beq .L_16c
    add r0, sp, #0x0
    bl func_020566f4
    add sp, sp, #0x8
    mov r0, r4
    ldmia sp!, {r4, r5, r6, pc}
.L_16c:
    bl func_02055320
    bl func_02055330
    bl func_020a9950
    ldr r1, [sp]
    mov r0, #0x0
    str r1, [r6]
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_020fff40
