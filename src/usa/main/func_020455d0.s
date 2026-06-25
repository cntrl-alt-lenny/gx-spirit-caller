; func_020455d0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219d9f0
        .extern func_0203cb70
        .extern func_0204520c
        .global func_020455d0
        .arm
func_020455d0:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r0, _LIT0
    ldr r0, [r0]
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqfd sp!, {pc}
    ldrh r0, [r0, #0x4]
    cmp r0, #0x1
    addeq sp, sp, #0x4
    ldmeqfd sp!, {pc}
    bl func_0203cb70
    mov r1, r0
    cmp r1, #0x5
    bne .L_64
    ldr r1, _LIT0
    mov r0, #0x4
    ldr r3, [r1]
    mov r2, #0x1
    strh r0, [r3, #0x4]
    ldr r1, [r1]
    add sp, sp, #0x4
    strh r2, [r1, #0x6]
    ldmfd sp!, {pc}
.L_64:
    cmp r1, #0x0
    bge .L_bc
    mvn r0, #0x9
    cmp r1, r0
    blt .L_9c
    sub r1, r1, #0x2bc
    mov r0, #0x9
    bl func_0204520c
    ldr r1, _LIT0
    mov r0, #0x8
    ldr r1, [r1]
    add sp, sp, #0x4
    strh r0, [r1, #0x4]
    ldmfd sp!, {pc}
.L_9c:
    mov r0, #0x5
    bl func_0204520c
    ldr r1, _LIT0
    mov r0, #0x7
    ldr r1, [r1]
    add sp, sp, #0x4
    strh r0, [r1, #0x4]
    ldmfd sp!, {pc}
.L_bc:
    mov r0, #0x2
    add sp, sp, #0x4
    ldmfd sp!, {pc}
_LIT0: .word data_0219d9f0
