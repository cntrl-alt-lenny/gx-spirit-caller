; func_0204b300 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020498f0
        .global func_0204b300
        .arm
func_0204b300:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, #0x0
    mov r4, r6
.L_23c:
    mov r5, r4
    bl func_020498f0
    ldrb r0, [r0, #0x14]
    cmp r0, #0x0
    blt .L_278
.L_250:
    bl func_020498f0
    add r0, r0, r5
    ldrb r0, [r0, #0x2d0]
    cmp r6, r0
    beq .L_278
    add r5, r5, #0x1
    bl func_020498f0
    ldrb r0, [r0, #0x14]
    cmp r5, r0
    ble .L_250
.L_278:
    bl func_020498f0
    ldrb r0, [r0, #0x14]
    cmp r5, r0
    bgt .L_298
    add r0, r6, #0x1
    and r6, r0, #0xff
    cmp r6, #0x20
    bcc .L_23c
.L_298:
    mov r0, r6
    ldmia sp!, {r4, r5, r6, pc}
