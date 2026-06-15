; func_0204bdc4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02046770
        .extern func_020498f0
        .extern func_0204fc38
        .extern func_0206255c
        .global func_0204bdc4
        .arm
func_0204bdc4:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    bl func_020498f0
    str r5, [r0, #0x20c]
    bl func_020498f0
    ldrb r1, [r0, #0xd]
    mov r0, r5
    add r1, r1, #0x1
    bl func_02046770
    movs r4, r0
    beq .L_d50
    bl func_020498f0
    mov r1, #0x2
    strb r1, [r0, #0x1a8]
    ldr r0, [r4]
    bl func_0206255c
    bl func_020498f0
    mov r1, #0x0
    strb r1, [r0, #0x1a8]
    add sp, sp, #0x4
    mov r0, #0x1
    ldmia sp!, {r4, r5, pc}
.L_d50:
    bl func_020498f0
    ldrb r1, [r0, #0xd]
    mov r0, r5
    add r1, r1, #0x1
    bl func_0204fc38
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
