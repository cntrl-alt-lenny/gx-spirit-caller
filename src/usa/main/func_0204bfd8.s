; func_0204bfd8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0204987c
        .extern func_0204ea5c
        .global func_0204bfd8
        .arm
func_0204bfd8:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0xc
    mov r4, #0x0
    str r4, [sp, #0x8]
    bl func_0204987c
    ldrb r0, [r0, #0x17]
    cmp r0, #0x0
    beq .L_1d0
    bl func_0204987c
    ldr r0, [r0, #0x20]
    cmp r0, #0x0
    beq .L_1d0
    bl func_0204987c
    mov r5, r0
    bl func_0204987c
    ldr r1, [r5, #0x20]
    ldr r0, [r0, #0x1f8]
    cmp r1, r0
    beq .L_1d0
    bl func_0204987c
    mov r7, r0
    bl func_0204987c
    mov r5, r0
    bl func_0204987c
    mov r6, r0
    bl func_0204987c
    mov r4, r0
    bl func_0204987c
    add r2, sp, #0x8
    mov r1, #0x1
    str r2, [sp]
    str r1, [sp, #0x4]
    ldrb r3, [r0, #0xd]
    ldrb r2, [r6, #0xd]
    ldr r1, [r7, #0x20]
    add r3, r3, #0x1
    add r2, r2, #0x1
    add r3, r4, r3, lsl #0x1
    add r2, r5, r2, lsl #0x2
    ldrh r3, [r3, #0xa4]
    ldr r2, [r2, #0x24]
    mov r0, #0xc
    bl func_0204ea5c
    mov r4, r0
    bl func_0204987c
    mov r1, #0x0
    strb r1, [r0, #0x17]
    bl func_0204987c
    mov r1, #0x0
    str r1, [r0, #0x20]
.L_1d0:
    mov r0, r4
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, pc}
