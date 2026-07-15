; func_ov003_021cbd3c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov003_021cbdb8
        .extern func_ov003_021cbec0
        .extern func_ov003_021cbf88
        .extern func_ov003_021ced78
        .global func_ov003_021cbd3c
        .arm
func_ov003_021cbd3c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4]
    cmp r1, #0x0
    beq .L_1b90
    cmp r1, #0x1
    beq .L_1ba4
    cmp r1, #0x2
    beq .L_1bcc
    b .L_1bdc
.L_1b90:
    bl func_ov003_021cbdb8
    cmp r0, #0x0
    movne r0, #0x1
    strne r0, [r4]
    b .L_1bdc
.L_1ba4:
    bl func_ov003_021ced78
    cmp r0, #0x0
    moveq r0, #0x2
    streq r0, [r4]
    mov r0, r4
    bl func_ov003_021cbf88
    cmp r0, #0x0
    movne r0, #0x2
    strne r0, [r4]
    b .L_1bdc
.L_1bcc:
    bl func_ov003_021cbec0
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r4, pc}
.L_1bdc:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
