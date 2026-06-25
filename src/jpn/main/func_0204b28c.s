; func_0204b28c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0204987c
        .global func_0204b28c
        .arm
func_0204b28c:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, #0x0
    mov r4, r6
.L_1d8:
    mov r5, r4
    bl func_0204987c
    ldrb r0, [r0, #0x14]
    cmp r0, #0x0
    blt .L_214
.L_1ec:
    bl func_0204987c
    add r0, r0, r5
    ldrb r0, [r0, #0x2c8]
    cmp r6, r0
    beq .L_214
    add r5, r5, #0x1
    bl func_0204987c
    ldrb r0, [r0, #0x14]
    cmp r5, r0
    ble .L_1ec
.L_214:
    bl func_0204987c
    ldrb r0, [r0, #0x14]
    cmp r5, r0
    bgt .L_234
    add r0, r6, #0x1
    and r6, r0, #0xff
    cmp r6, #0x20
    bcc .L_1d8
.L_234:
    mov r0, r6
    ldmia sp!, {r4, r5, r6, pc}
