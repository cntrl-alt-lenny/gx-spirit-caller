; func_0204ce1c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02049868
        .extern func_0204987c
        .extern func_0204aa80
        .extern func_0204cf08
        .extern func_0204d3c4
        .extern func_0204f034
        .extern func_0204ffe0
        .extern func_02092fc8
        .global func_0204ce1c
        .arm
func_0204ce1c:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    bl func_0204987c
    mov r1, #0x0
    str r1, [r0, #0x200]
    bl func_0204987c
    mov r1, #0x0
    str r1, [r0, #0x1fc]
    bl func_0204987c
    mov r1, #0x0
    strb r1, [r0, #0x19f]
    bl func_0204987c
    mov r4, r0
    bl func_02092fc8
    str r0, [r4, #0x1c4]
    str r1, [r4, #0x1c8]
    bl func_0204987c
    ldrb r0, [r0, #0x15]
    cmp r0, #0x0
    bne .L_7c
    mov r0, #0x3
    bl func_02049868
    mov r0, #0x0
    bl func_0204f034
    bl func_0204aa80
    cmp r0, #0x0
    beq .L_dc
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r4, r5, pc}
.L_7c:
    bl func_0204987c
    ldrb r0, [r0, #0x15]
    cmp r0, #0x1
    bne .L_b4
    mov r0, #0x0
    mov r1, r0
    mov r2, r5
    bl func_0204cf08
    bl func_0204d3c4
    cmp r0, #0x0
    beq .L_dc
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r4, r5, pc}
.L_b4:
    bl func_0204987c
    ldrb r0, [r0, #0x15]
    cmp r0, #0x3
    bne .L_dc
    ldr r1, _LIT0
    mov r0, #0x6
    bl func_0204ffe0
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r4, r5, pc}
.L_dc:
    mov r0, #0x1
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
_LIT0: .word 0xfffec5e6
