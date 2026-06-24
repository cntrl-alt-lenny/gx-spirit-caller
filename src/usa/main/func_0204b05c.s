; func_0204b05c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0204987c
        .global func_0204b05c
        .arm
func_0204b05c:
    stmdb sp!, {r4, r5, r6, lr}
    cmp r0, #0x0
    mov r6, #0x0
    beq .L_20
    bl func_0204987c
    ldr r0, [r0, #0x2e8]
    bic r0, r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
.L_20:
    mov r5, #0x1
    bl func_0204987c
    ldrb r0, [r0, #0xd]
    cmp r0, #0x1
    blt .L_5c
    mov r4, r5
.L_38:
    bl func_0204987c
    add r0, r0, r5
    ldrb r0, [r0, #0x2c8]
    add r5, r5, #0x1
    orr r6, r6, r4, lsl r0
    bl func_0204987c
    ldrb r0, [r0, #0xd]
    cmp r5, r0
    ble .L_38
.L_5c:
    mov r0, r6
    ldmia sp!, {r4, r5, r6, pc}
