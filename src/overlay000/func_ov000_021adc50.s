; func_ov000_021adc50 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104f4c
        .extern data_ov000_021c75c4
        .extern func_02001cd0
        .extern func_02001d0c
        .extern func_02001d68
        .extern func_02001e94
        .extern func_02005374
        .extern func_0201d4b4
        .extern func_0201d530
        .extern func_ov000_021adb9c
        .global func_ov000_021adc50
        .arm
func_ov000_021adc50:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x8
    movs r7, r0
    ldr r5, _LIT0
    beq .L_c0
    ldr r6, [r5, #0x264]
    mov r0, #0x8
    cmp r6, #0x0
    str r7, [r5, #0x24c]
    moveq r6, #0x20
    bl func_0201d530
    mov r4, r0
    add r0, r5, #0x178
    mov r1, #0xc
    mov r2, #0x3
    bl func_02001d0c
    ldr r0, _LIT1
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_02001d68
    bl func_ov000_021adb9c
    ldr r1, [r5, #0x274]
    add r0, r5, #0x178
    mov r1, r1, lsl #0x1a
    mov r2, #0x8
    mov r1, r1, lsr #0x1c
    bl func_02001cd0
    mov r0, #0x4
    str r0, [sp]
    mov r0, #0xc
    str r0, [sp, #0x4]
    mov r1, r7
    add r2, r6, r4
    add r0, r5, #0x178
    mov r3, #0x2
    bl func_02005374
    mov r0, #0x8
    bl func_0201d4b4
    mov r1, r0
    add r1, r1, #0xc2
    mov r2, r6, asr #0x5
    add r0, r5, #0x178
    add r1, r1, #0x300
    mov r3, #0x0
    bl func_02001e94
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_c0:
    bl func_ov000_021adb9c
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov000_021c75c4
_LIT1: .word data_02104f4c
