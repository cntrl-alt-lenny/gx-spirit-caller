; func_0204b20c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02049118
        .extern func_0204987c
        .global func_0204b20c
        .arm
func_0204b20c:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    bl func_0204987c
    ldr r0, [r0, #0x2f4]
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, pc}
    mov r4, #0x0
    bl func_0204987c
    ldr r0, [r0, #0x33c]
    cmp r0, #0x0
    ble .L_150
.L_114:
    bl func_0204987c
    add r0, r0, r4
    ldrb r0, [r0, #0x2fc]
    bl func_02049118
    cmp r0, #0x0
    ble .L_13c
    cmp r0, r5
    addeq sp, sp, #0x4
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, pc}
.L_13c:
    add r4, r4, #0x1
    bl func_0204987c
    ldr r0, [r0, #0x33c]
    cmp r4, r0
    blt .L_114
.L_150:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
