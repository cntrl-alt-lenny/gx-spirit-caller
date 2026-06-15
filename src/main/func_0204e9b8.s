; func_0204e9b8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Copy32
        .extern data_020ff96c
        .extern func_020498f0
        .extern func_02064f84
        .extern func_02068d98
        .global func_0204e9b8
        .arm
func_0204e9b8:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x9c
    mov r5, r0
    mov r8, r1
    mov r7, r2
    cmp r3, #0x0
    ldr r4, [sp, #0xb8]
    beq .L_158c
    cmp r4, #0x0
    beq .L_158c
    add r1, sp, #0x18
    mov r0, r3
    mov r2, r4, lsl #0x2
    bl Copy32
    b .L_1590
.L_158c:
    mov r4, #0x0
.L_1590:
    ldr r6, _LIT0
    add r9, sp, #0x4
    ldrb r3, [r6]
    ldrb r2, [r6, #0x1]
    mov r0, r4, lsl #0x2
    mov r1, #0x3
    strb r3, [r9]
    strb r2, [r9, #0x1]
    ldrb r3, [r6, #0x2]
    ldrb r2, [r6, #0x3]
    strb r3, [r9, #0x2]
    strb r2, [r9, #0x3]
    ldrb r2, [r6, #0x4]
    strb r2, [r9, #0x4]
    str r1, [sp, #0x8]
    strb r5, [sp, #0xc]
    strb r0, [sp, #0xd]
    bl func_020498f0
    ldrh r0, [r0, #0x1a]
    strh r0, [sp, #0xe]
    bl func_020498f0
    ldr r0, [r0, #0x1c]
    str r0, [sp, #0x10]
    bl func_020498f0
    ldr r0, [r0, #0x200]
    mov r6, #0x0
    str r0, [sp, #0x14]
    mov r4, r6
.L_1600:
    bl func_020498f0
    mov r5, r0
    mov r0, r8
    mov r1, r4
    mov r2, r4
    bl func_02064f84
    mov r1, r0
    ldrb r0, [sp, #0xd]
    mov r2, r7
    mov r3, r9
    add r0, r0, #0x14
    str r0, [sp]
    ldr r0, [r5, #0xe4]
    bl func_02068d98
    cmp r0, #0x0
    addeq sp, sp, #0x9c
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, pc}
    cmp r0, #0x2
    addne sp, sp, #0x9c
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, pc}
    add r6, r6, #0x1
    cmp r6, #0x5
    blt .L_1600
    add sp, sp, #0x9c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_020ff96c
