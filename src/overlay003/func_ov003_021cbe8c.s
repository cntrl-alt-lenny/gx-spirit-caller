; func_ov003_021cbe8c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov003_021cbf08
        .extern func_ov003_021cc010
        .extern func_ov003_021cc0d8
        .extern func_ov003_021ceeb4
        .global func_ov003_021cbe8c
        .arm
func_ov003_021cbe8c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4]
    cmp r1, #0x0
    beq .L_1bf8
    cmp r1, #0x1
    beq .L_1c0c
    cmp r1, #0x2
    beq .L_1c34
    b .L_1c44
.L_1bf8:
    bl func_ov003_021cbf08
    cmp r0, #0x0
    movne r0, #0x1
    strne r0, [r4]
    b .L_1c44
.L_1c0c:
    bl func_ov003_021ceeb4
    cmp r0, #0x0
    moveq r0, #0x2
    streq r0, [r4]
    mov r0, r4
    bl func_ov003_021cc0d8
    cmp r0, #0x0
    movne r0, #0x2
    strne r0, [r4]
    b .L_1c44
.L_1c34:
    bl func_ov003_021cc010
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r4, pc}
.L_1c44:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
