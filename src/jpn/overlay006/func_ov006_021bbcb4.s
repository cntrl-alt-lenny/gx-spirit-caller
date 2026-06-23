; func_ov006_021bbcb4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0202160c
        .extern func_0202165c
        .extern func_020221e0
        .global func_ov006_021bbcb4
        .arm
func_ov006_021bbcb4:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r0, [r4]
    mov r1, #0x4
    mov r2, #0x0
    bl func_0202160c
    ldr r1, [r4, #0x40]
    cmp r1, #0x6
    addls pc, pc, r1, lsl #0x2
    b .L_1c00
    b .L_1c08
    b .L_1c1c
    b .L_1c00
    b .L_1c08
    b .L_1c00
    b .L_1c00
    b .L_1c00
.L_1c00:
    ldr r5, [r4, #0x50]
    b .L_1c48
.L_1c08:
    ldr r5, [r4, #0x50]
    cmp r5, #0x4
    ldreq r1, [r4, #0x5c]
    addeq r5, r1, #0x4
    b .L_1c48
.L_1c1c:
    ldr r1, [r4, #0x74]
    cmp r1, #0x0
    ldr r1, [r4, #0x50]
    beq .L_1c3c
    cmp r1, #0x1
    moveq r5, #0x2
    movne r5, #0x3
    b .L_1c48
.L_1c3c:
    cmp r1, #0x1
    movne r5, #0x1
    moveq r5, #0x0
.L_1c48:
    ldr r2, _LIT0
    mov r1, #0x0
    bl func_0202165c
    ldr r1, [r4, #0x40]
    mov r0, #0x2
    bl func_020221e0
    mov r1, r5
    mov r0, #0x3
    bl func_020221e0
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00000801
