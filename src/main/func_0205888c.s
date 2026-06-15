; func_0205888c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020453b4
        .extern func_0205d674
        .global func_0205888c
        .arm
func_0205888c:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r1
    ldr r1, [r5, #0x8]
    mov r6, r0
    cmp r1, #0x0
    ldr r4, [r6]
    beq .L_850
    ldr r0, [r4, #0x104]
    cmp r0, #0x0
    bne .L_850
    ldr r0, [r1, #0x8]
    bl func_020453b4
    ldr r0, [r5, #0x8]
    mov r1, #0x0
    str r1, [r0, #0x8]
    ldr r0, [r5, #0x8]
    ldr r0, [r0, #0xc]
    bl func_020453b4
    ldr r0, [r5, #0x8]
    mov r1, #0x0
    str r1, [r0, #0xc]
    ldr r0, [r5, #0x8]
    bl func_020453b4
    mov r0, #0x0
    str r0, [r5, #0x8]
.L_850:
    ldr r0, [r5, #0x10]
    bl func_020453b4
    mov r0, #0x0
    str r0, [r5, #0x10]
    ldr r0, [r5, #0x18]
    bl func_020453b4
    mov r0, #0x0
    str r0, [r5, #0x18]
    str r0, [r5, #0x14]
    ldr r0, [r5, #0xc]
    cmp r0, #0x0
    beq .L_898
    ldr r0, [r4, #0x104]
    cmp r0, #0x1
    bne .L_8ac
    ldr r0, [r5, #0x8]
    cmp r0, #0x0
    bne .L_8ac
.L_898:
    mov r0, r6
    mov r1, r5
    bl func_0205d674
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_8ac:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
