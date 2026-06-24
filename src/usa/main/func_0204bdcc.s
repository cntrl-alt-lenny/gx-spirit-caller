; func_0204bdcc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02049868
        .extern func_0204987c
        .extern func_0204aa80
        .extern func_0204bed0
        .extern func_0204d210
        .extern func_0204d3c4
        .extern func_0204f034
        .global func_0204bdcc
        .arm
func_0204bdcc:
    stmdb sp!, {r4, lr}
    bl func_0204987c
    mov r1, #0x0
    strb r1, [r0, #0x17]
    bl func_0204987c
    mov r1, #0x0
    str r1, [r0, #0x20]
    bl func_0204987c
    mov r1, #0x0
    strb r1, [r0, #0x1a0]
    bl func_0204987c
    ldr r0, [r0, #0x200]
    cmp r0, #0x0
    beq .L_b0
    bl func_0204987c
    ldrb r0, [r0, #0x15]
    cmp r0, #0x0
    bne .L_70
    mov r0, #0x3
    bl func_02049868
    mov r0, #0x0
    bl func_0204f034
    mov r4, r0
    bl func_0204aa80
    cmp r0, #0x0
    beq .L_b8
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_70:
    bl func_0204987c
    ldrb r0, [r0, #0x15]
    cmp r0, #0x1
    bne .L_b8
    mov r0, #0x4
    bl func_02049868
    bl func_0204987c
    ldr r0, [r0, #0x200]
    mov r1, #0x0
    bl func_0204d210
    mov r4, r0
    bl func_0204d3c4
    cmp r0, #0x0
    beq .L_b8
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_b0:
    mov r0, #0x1
    bl func_0204bed0
.L_b8:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
