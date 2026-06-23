; func_ov011_021ca320 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov011_021d3f20
        .extern data_ov011_021d3f5c
        .global func_ov011_021ca320
        .arm
func_ov011_021ca320:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r2, _LIT0
    and r3, r0, #0x7
    ldr r4, [r2, #0x2a0]
    mov r5, r1, asr #0x3
    cmp r4, #0x0
    and r2, r1, #0x7
    and r1, r3, #0x1
    ldr ip, _LIT1
    beq .L_34
    cmp r4, #0x1
    beq .L_8c
    b .L_c4
.L_34:
    ldr lr, [ip, #0x29c]
    mov r4, r5, lsl #0x5
    mov lr, lr, lsl #0x1d
    mov lr, lr, lsr #0x1d
    add r0, r4, r0, asr #0x3
    mul r4, lr, r0
    ldr lr, [ip, #0x290]
    ldr r0, _LIT2
    ldrh r4, [lr, r4]
    mov r3, r3, asr #0x1
    ldr ip, [ip, #0x28c]
    and r0, r4, r0
    and lr, r0, #0xf000
    mov r0, r4, lsl #0x16
    add r2, r3, r2, lsl #0x2
    add r0, ip, r0, lsr #0x11
    ldrb r2, [r2, r0]
    mov r0, r1, lsl #0x2
    mov r1, lr, asr #0xc
    mov r0, r2, asr r0
    orr r0, r0, r1, lsl #0x4
    ldmia sp!, {r3, r4, r5, pc}
.L_8c:
    ldr lr, [ip, #0x29c]
    mov r1, r5, lsl #0x6
    mov lr, lr, lsl #0x1d
    add r0, r1, r0, asr #0x3
    mov lr, lr, lsr #0x1d
    mul r0, lr, r0
    ldr r1, [ip, #0x290]
    ldr ip, [ip, #0x28c]
    ldrh r0, [r1, r0]
    add r1, r3, r2, lsl #0x3
    mov r0, r0, lsl #0x16
    add r0, ip, r0, lsr #0x10
    ldrb r0, [r1, r0]
    ldmia sp!, {r3, r4, r5, pc}
.L_c4:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov011_021d3f20
_LIT1: .word data_ov011_021d3f5c
_LIT2: .word 0x000003ff
