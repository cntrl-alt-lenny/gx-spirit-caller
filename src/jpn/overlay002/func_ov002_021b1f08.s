; func_ov002_021b1f08 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d0172
        .extern data_ov002_022d0570
        .extern data_ov002_022d0576
        .extern func_ov002_021b1c68
        .global func_ov002_021b1f08
        .arm
func_ov002_021b1f08:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r0
    mov r6, r1
    mov r5, r2
    mov r4, r3
    bl func_ov002_021b1c68
    ldr r2, _LIT0
    mov r1, r7, lsl #0x2
    ldrh ip, [r2, r1]
    ldr r1, _LIT1
    add r7, r2, r7, lsl #0x2
    cmp ip, #0x0
    add r1, r1, r0, lsl #0x3
    beq .L_118
    ldr r3, _LIT2
.L_104:
    mov r2, ip, lsl #0x3
    add r7, r3, ip, lsl #0x3
    ldrh ip, [r3, r2]
    cmp ip, #0x0
    bne .L_104
.L_118:
    strh r0, [r7]
    ldrh r2, [r1, #0x2]
    and r0, r6, #0xf
    and r0, r0, #0xf
    bic r2, r2, #0xf
    orr r0, r2, r0
    strh r0, [r1, #0x2]
    and r0, r6, #0xf0
    ldrh r2, [r1, #0x2]
    mov r0, r0, asr #0x4
    and r0, r0, #0xff
    bic r2, r2, #0xf0
    mov r0, r0, lsl #0x1c
    orr r0, r2, r0, lsr #0x18
    strh r0, [r1, #0x2]
    strh r5, [r1]
    strh r4, [r1, #0x4]
    mov r0, #0x0
    strh r0, [r1, #0x6]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022d0172
_LIT1: .word data_ov002_022d0570
_LIT2: .word data_ov002_022d0576
