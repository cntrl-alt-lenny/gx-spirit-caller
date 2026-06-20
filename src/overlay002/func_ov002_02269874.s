; func_ov002_02269874 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cdc68
        .extern data_ov002_022cdc76
        .extern data_ov002_022ce288
        .extern data_ov002_022ce588
        .extern func_ov002_021b1570
        .extern func_ov002_02257ca8
        .global func_ov002_02269874
        .arm
func_ov002_02269874:
    stmdb sp!, {r4, lr}
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r2, [r0, #0x484]
    mov r0, #0x18
    mla r4, r2, r0, r1
    cmp r2, #0x0
    subgt r1, r4, #0x18
    movle r1, #0x0
    cmp r1, #0x0
    beq .L_38
    ldrh r0, [r1]
    cmp r0, #0x0
    moveq r1, #0x0
.L_38:
    ldr r2, _LIT2
    ldrh ip, [r2, #0xe]
    mov r0, ip, lsl #0x18
    movs r0, r0, lsr #0x18
    beq .L_60
    cmp r0, #0x1
    beq .L_8c
    cmp r0, #0x2
    beq .L_fc
    b .L_118
.L_60:
    add r0, r0, #0x1
    mov r0, r0, lsl #0x10
    mov r3, r0, lsr #0x10
    ldr r0, _LIT0
    mov lr, #0x0
    str lr, [r0, #0x5b8]
    bic ip, ip, #0xff
    and r3, r3, #0xff
    str lr, [r0, #0x5bc]
    orr r0, ip, r3
    strh r0, [r2, #0xe]
.L_8c:
    ldr r2, _LIT0
    mov r0, r4
    str r4, [r2, #0x48c]
    bl func_ov002_02257ca8
    cmp r0, #0x0
    beq .L_f4
    ldr r2, _LIT3
    movgt r0, #0x1
    ldrh r1, [r2]
    movle r0, #0x0
    mov r0, r0, lsl #0x10
    mov r3, r0, lsr #0x10
    mov r0, r1, lsl #0x18
    mov r0, r0, lsr #0x18
    ldrh ip, [r4, #0x4]
    add r0, r0, #0x1
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic ip, ip, #0x1
    and r3, r3, #0x1
    orr r3, ip, r3
    bic r1, r1, #0xff
    and r0, r0, #0xff
    orr r0, r1, r0
    strh r3, [r4, #0x4]
    strh r0, [r2]
.L_f4:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_fc:
    mov r0, #0x1b
    mov r2, r4
    sub r1, r0, #0x1c
    mov r3, #0x18
    bl func_ov002_021b1570
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_118:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word data_ov002_022ce588
_LIT2: .word data_ov002_022cdc68
_LIT3: .word data_ov002_022cdc76
