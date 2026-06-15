; func_0204b134 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020498f0
        .global func_0204b134
        .arm
func_0204b134:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    cmp r1, #0x0
    moveq r4, #0x1
    mov r5, r0
    movne r4, #0x0
    bl func_020498f0
    ldrb r0, [r0, #0xd]
    cmp r4, r0
    bgt .L_c8
.L_8c:
    bl func_020498f0
    add r0, r0, r4, lsl #0x2
    ldr r0, [r0, #0xf4]
    cmp r5, r0
    bne .L_b4
    bl func_020498f0
    add r0, r0, r4
    add sp, sp, #0x4
    ldrb r0, [r0, #0x2d0]
    ldmia sp!, {r4, r5, pc}
.L_b4:
    add r4, r4, #0x1
    bl func_020498f0
    ldrb r0, [r0, #0xd]
    cmp r4, r0
    ble .L_8c
.L_c8:
    mov r0, #0xff
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
