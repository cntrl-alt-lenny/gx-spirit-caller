; func_ov012_021ca28c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov012_021cc5c0
        .extern data_ov012_021cc5fc
        .global func_ov012_021ca28c
        .arm
func_ov012_021ca28c:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r2, _LIT0
    and r3, r0, #0x7
    ldr r2, [r2, #0x198]
    mov r4, r1, asr #0x3
    cmp r2, #0x0
    and lr, r1, #0x7
    and ip, r3, #0x1
    ldr r5, _LIT1
    beq .L_34
    cmp r2, #0x1
    beq .L_60
    b .L_80
.L_34:
    mov r1, r3, asr #0x1
    mov r2, r4, lsl #0x5
    ldr r3, [r5, #0x17c]
    add r0, r2, r0, asr #0x3
    add r1, r1, lr, lsl #0x2
    add r0, r3, r0, lsl #0x5
    ldrb r1, [r1, r0]
    mov r0, ip, lsl #0x2
    mov r0, r1, asr r0
    and r0, r0, #0xf
    ldmia sp!, {r3, r4, r5, pc}
.L_60:
    mov r1, r4, lsl #0x6
    ldr r2, [r5, #0x17c]
    add r0, r1, r0, asr #0x3
    add r0, r2, r0, lsl #0x6
    add r0, r0, lr, lsl #0x3
    ldrb r0, [r3, r0]
    and r0, r0, #0xf
    ldmia sp!, {r3, r4, r5, pc}
.L_80:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov012_021cc5c0
_LIT1: .word data_ov012_021cc5fc
