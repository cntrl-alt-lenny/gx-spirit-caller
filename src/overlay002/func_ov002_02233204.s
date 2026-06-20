; func_ov002_02233204 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022d0e6c
        .extern func_ov002_021df818
        .extern func_ov002_0226b274
        .global func_ov002_02233204
        .arm
func_ov002_02233204:
    stmdb sp!, {r3, lr}
    ldr r1, _LIT0
    ldr r1, [r1, #0x5a8]
    cmp r1, #0x7f
    beq .L_1240
    cmp r1, #0x80
    bne .L_1274
    ldrh r0, [r0, #0x2]
    mov r2, #0x3
    mov r1, r0, lsl #0x1a
    mov r3, r0, lsl #0x1f
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_0226b274
    mov r0, #0x7f
    ldmia sp!, {r3, pc}
.L_1240:
    ldr r1, _LIT1
    ldrh lr, [r0, #0x2]
    ldrh r3, [r1, #0xb0]
    ldrh r2, [r1, #0xb2]
    ldrh ip, [r1, #0xb4]
    mov lr, lr, lsl #0x1f
    add r1, r3, r2
    add r3, ip, r1
    mov r1, #0x64
    mul r2, r3, r1
    mov r1, lr, lsr #0x1f
    rsb r1, r1, #0x1
    bl func_ov002_021df818
.L_1274:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word data_ov002_022d0e6c
