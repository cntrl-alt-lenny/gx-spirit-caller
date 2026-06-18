; func_ov002_0224345c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022d0e6c
        .extern func_ov002_0223de04
        .extern func_ov002_022536e8
        .extern func_ov002_0226b194
        .global func_ov002_0224345c
        .arm
func_ov002_0224345c:
    stmdb sp!, {r3, lr}
    ldrh r2, [r0, #0x2]
    ldr r1, _LIT0
    ldr r1, [r1, #0x5b8]
    mov r2, r2, lsl #0x1f
    cmp r1, #0x0
    mov r2, r2, lsr #0x1f
    beq .L_1dc
    cmp r1, #0x1
    beq .L_20c
    cmp r1, #0x2
    beq .L_230
    b .L_244
.L_1dc:
    ldrh r1, [r0]
    mov r0, r2
    bl func_ov002_022536e8
    cmp r0, #0x0
    mvneq r0, #0x0
    ldmeqia sp!, {r3, pc}
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b8]
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r3, pc}
.L_20c:
    ldrh r1, [r0]
    rsb r0, r2, #0x1
    bl func_ov002_0226b194
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b8]
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r3, pc}
.L_230:
    ldr r3, _LIT1
    mov r1, r2
    ldrh r3, [r3, #0xb2]
    mov r2, #0xe
    bl func_ov002_0223de04
.L_244:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word data_ov002_022d0e6c
