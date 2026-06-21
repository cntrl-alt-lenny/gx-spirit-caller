; func_ov002_021cfad0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce950
        .extern func_ov002_0229ade0
        .extern func_ov002_0229c7f8
        .global func_ov002_021cfad0
        .arm
func_ov002_021cfad0:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r0, _LIT0
    ldrh r0, [r0]
    tst r0, #0x8000
    ldr r0, _LIT0
    movne r5, #0x1
    ldr r1, [r0, #0x810]
    moveq r5, #0x0
    ldrh r4, [r0, #0x2]
    cmp r1, #0x0
    beq .L_2374
    cmp r1, #0x1
    beq .L_239c
    cmp r1, #0x2
    beq .L_23d8
    ldmia sp!, {r3, r4, r5, pc}
.L_2374:
    mov r1, r5
    mov r2, r4
    mov r0, #0x43
    mov r3, #0x0
    bl func_ov002_0229ade0
    ldr r0, _LIT0
    ldr r1, [r0, #0x810]
    add r1, r1, #0x1
    str r1, [r0, #0x810]
    ldmia sp!, {r3, r4, r5, pc}
.L_239c:
    mov r0, #0x43
    bl func_ov002_0229c7f8
    cmp r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    and r0, r5, #0x1
    orr r1, r0, #0x20
    mov r2, r4
    mov r0, #0x20
    mov r3, #0x0
    bl func_ov002_0229ade0
    ldr r0, _LIT0
    ldr r1, [r0, #0x810]
    add r1, r1, #0x1
    str r1, [r0, #0x810]
    ldmia sp!, {r3, r4, r5, pc}
.L_23d8:
    mov r0, #0x20
    bl func_ov002_0229c7f8
    cmp r0, #0x0
    ldreq r0, _LIT0
    moveq r1, #0x0
    streq r1, [r0, #0x80c]
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022ce950
