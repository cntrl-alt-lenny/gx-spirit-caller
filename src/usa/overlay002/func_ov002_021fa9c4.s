; func_ov002_021fa9c4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern func_0202de48
        .extern func_0202e1e0
        .extern func_ov002_021f495c
        .extern func_ov002_0226ad60
        .global func_ov002_021fa9c4
        .arm
func_ov002_021fa9c4:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r1
    mov r6, r0
    ldrh r0, [r5]
    bl func_0202de48
    mov r4, r0
    ldrh r0, [r5]
    bl func_0202e1e0
    cmp r0, #0x0
    beq .L_44
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x1a
    mov r0, r0, lsr #0x1b
    cmp r0, #0x5
    bcc .L_44
    cmp r0, #0xa
    movls r4, #0x7
.L_44:
    ldr r0, _LIT0
    ldr r0, [r0, #0x5b4]
    cmp r0, #0x0
    beq .L_60
    cmp r0, #0x1
    beq .L_90
    b .L_b4
.L_60:
    ldrh r0, [r6, #0x2]
    mov r2, r4
    mov r1, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0226ad60
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r4, r5, r6, pc}
.L_90:
    mov r0, r6
    mov r1, r5
    bl func_ov002_021f495c
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r4, r5, r6, pc}
.L_b4:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022ce1a8
