; func_02025f00 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern func_02022b74
        .extern func_02025fd0
        .extern func_020aadf8
        .global func_02025f00
        .arm
func_02025f00:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x3c
    mov r4, r0
    ldr r0, [r4, #0x74]
    cmp r0, #0x0
    beq .L_6fc
    add r1, sp, #0x0
    mov r0, #0x0
    mov r2, #0x3c
    bl Fill32
    mov r0, #0x0
    str r0, [sp]
    ldr r1, [r4, #0x74]
    add r0, sp, #0x4
    bl func_020aadf8
    ldr r2, [r4, #0x7c]
    mov r1, #0x1
    cmp r2, #0x0
    blt .L_694
    ldr r0, [r4, #0x90]
    tst r0, #0x1
    moveq r1, #0x0
.L_694:
    cmp r1, #0x0
    mvnne r2, #0x0
    str r2, [sp, #0x24]
    ldr r2, [r4, #0x80]
    mov r1, #0x1
    cmp r2, #0x0
    blt .L_6bc
    ldr r0, [r4, #0x90]
    tst r0, #0x2
    moveq r1, #0x0
.L_6bc:
    cmp r1, #0x0
    ldr r1, _LIT0
    mvnne r2, #0x0
    ldr r0, [sp, #0x24]
    str r2, [sp, #0x28]
    cmp r0, #0x0
    str r1, [sp, #0x30]
    str r4, [sp, #0x34]
    cmplt r2, #0x0
    blt .L_6fc
    add r0, sp, #0x0
    bl func_02022b74
    add r0, r4, #0x100
    ldrh r1, [r0, #0x6a]
    orr r1, r1, #0x400
    strh r1, [r0, #0x6a]
.L_6fc:
    mov r0, #0x1
    add sp, sp, #0x3c
    ldmia sp!, {r3, r4, pc}
_LIT0: .word func_02025fd0
