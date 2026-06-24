; func_02056520 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02045364
        .extern func_02056664
        .extern func_0205bce4
        .extern func_0205d4ec
        .global func_02056520
        .arm
func_02056520:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    ldr r4, [r5]
    mov r1, #0x0
    strb r1, [r4, #0x110]
    strb r1, [r4, #0x12f]
    strb r1, [r4, #0x144]
    mvn r0, #0x0
    str r0, [r4, #0x1d4]
    str r1, [r4, #0x1d8]
    str r1, [r4, #0x1e4]
    str r1, [r4, #0x1e8]
    str r1, [r4, #0x1e0]
    ldr r0, [r4, #0x1dc]
    bl func_02045364
    mov r0, #0x0
    str r0, [r4, #0x1dc]
    str r0, [r4, #0x1dc]
    str r0, [r4, #0x1f0]
    ldr r0, [r4, #0x1ec]
    bl func_02045364
    mov r0, #0x0
    str r0, [r4, #0x1ec]
    str r0, [r4, #0x1ec]
    str r0, [r4, #0x1fc]
    str r0, [r4, #0x200]
    str r0, [r4, #0x1f8]
    ldr r0, [r4, #0x1f4]
    bl func_02045364
    mov r0, #0x0
    str r0, [r4, #0x1f4]
    str r0, [r4, #0x1f4]
    str r0, [r4, #0x448]
    str r0, [r4, #0x44c]
    str r0, [r4, #0x444]
    ldr r0, [r4, #0x440]
    bl func_02045364
    mov r0, #0x0
    str r0, [r4, #0x440]
    str r0, [r4, #0x440]
    str r0, [r4, #0x458]
    str r0, [r4, #0x45c]
    str r0, [r4, #0x454]
    ldr r0, [r4, #0x450]
    bl func_02045364
    mov r0, #0x0
    str r0, [r4, #0x450]
    str r0, [r4, #0x450]
    mvn r0, #0x0
    str r0, [r4, #0x204]
    mov r0, #0x2
    str r0, [r4, #0x20c]
    ldr r1, [r4, #0x424]
    cmp r1, #0x0
    beq .L_5e0
.L_5cc:
    mov r0, r5
    bl func_0205bce4
    ldr r1, [r4, #0x424]
    cmp r1, #0x0
    bne .L_5cc
.L_5e0:
    mov r2, #0x0
    str r2, [r4, #0x424]
    ldr r1, _LIT0
    mov r0, r5
    str r2, [r4, #0x430]
    bl func_0205d4ec
    mov r0, #0x0
    str r0, [r4, #0x19c]
    str r0, [r4, #0x1a0]
    str r0, [r4, #0x198]
    str r0, [r4, #0x210]
    str r0, [r4, #0x41c]
    str r0, [r4, #0x434]
    mvn r1, #0x0
    str r1, [r4, #0x214]
    strb r0, [r4, #0x218]
    strb r0, [r4, #0x318]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
_LIT0: .word func_02056664
