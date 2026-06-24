; func_0204b0c0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0204987c
        .global func_0204b0c0
        .arm
func_0204b0c0:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    cmp r1, #0x0
    moveq r4, #0x1
    mov r5, r0
    movne r4, #0x0
    bl func_0204987c
    ldrb r0, [r0, #0xd]
    cmp r4, r0
    bgt .L_64
.L_28:
    bl func_0204987c
    add r0, r0, r4, lsl #0x2
    ldr r0, [r0, #0xf4]
    cmp r5, r0
    bne .L_50
    bl func_0204987c
    add r0, r0, r4
    add sp, sp, #0x4
    ldrb r0, [r0, #0x2c8]
    ldmia sp!, {r4, r5, pc}
.L_50:
    add r4, r4, #0x1
    bl func_0204987c
    ldrb r0, [r0, #0xd]
    cmp r4, r0
    ble .L_28
.L_64:
    mov r0, #0xff
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
