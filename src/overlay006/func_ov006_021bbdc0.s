; func_ov006_021bbdc0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02021660
        .extern func_020216b0
        .extern func_02022234
        .global func_ov006_021bbdc0
        .arm
func_ov006_021bbdc0:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r0, [r4]
    mov r1, #0x4
    mov r2, #0x0
    bl func_02021660
    ldr r1, [r4, #0x40]
    cmp r1, #0x6
    addls pc, pc, r1, lsl #0x2
    b .L_1c0c
    b .L_1c14
    b .L_1c28
    b .L_1c0c
    b .L_1c14
    b .L_1c0c
    b .L_1c0c
    b .L_1c0c
.L_1c0c:
    ldr r5, [r4, #0x50]
    b .L_1c54
.L_1c14:
    ldr r5, [r4, #0x50]
    cmp r5, #0x4
    ldreq r1, [r4, #0x5c]
    addeq r5, r1, #0x4
    b .L_1c54
.L_1c28:
    ldr r1, [r4, #0x74]
    cmp r1, #0x0
    ldr r1, [r4, #0x50]
    beq .L_1c48
    cmp r1, #0x1
    moveq r5, #0x2
    movne r5, #0x3
    b .L_1c54
.L_1c48:
    cmp r1, #0x1
    movne r5, #0x1
    moveq r5, #0x0
.L_1c54:
    ldr r2, _LIT0
    mov r1, #0x0
    bl func_020216b0
    ldr r1, [r4, #0x40]
    mov r0, #0x2
    bl func_02022234
    mov r1, r5
    mov r0, #0x3
    bl func_02022234
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00000801
