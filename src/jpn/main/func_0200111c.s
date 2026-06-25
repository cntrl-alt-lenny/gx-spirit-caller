; func_0200111c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02103fcc
        .extern func_02000cc4
        .extern func_02000d4c
        .extern func_02000e34
        .extern func_020124c0
        .extern func_02012578
        .extern func_02018b00
        .extern func_02018b14
        .extern func_02018b60
        .global func_0200111c
        .arm
func_0200111c:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r4, _LIT0
    bl func_02018b14
    cmp r0, #0xa
    addls pc, pc, r0, lsl #0x2
    b .L_298
    b .L_298
    b .L_198
    b .L_208
    b .L_210
    b .L_220
    b .L_23c
    b .L_24c
    b .L_25c
    b .L_268
    b .L_278
    b .L_288
.L_198:
    bl func_02018b60
    ldr r0, [r0, #0x1c]
    mov r0, r0, lsl #0xb
    mov r0, r0, asr #0x1b
    cmp r0, #0x4
    bne .L_1bc
    mov r0, #0x1
    bl func_02012578
    b .L_1f8
.L_1bc:
    bl func_02018b60
    mov r6, r0
    bl func_02018b60
    mov r5, r0
    bl func_02018b60
    ldr r2, [r6, #0x14]
    ldr r1, [r5, #0x1c]
    ldr r0, [r0, #0x1c]
    mov r3, r2, lsl #0x18
    mov r2, r0, lsl #0x10
    mov r1, r1, lsl #0xb
    mov r0, r3, lsr #0x18
    mov r1, r1, asr #0x1b
    mov r2, r2, asr #0x18
    bl func_020124c0
.L_1f8:
    bl func_02000cc4
    mov r0, #0x33
    str r0, [r4, #0xb64]
    b .L_2a0
.L_208:
    bl func_02000e34
    b .L_2a0
.L_210:
    bl func_02000cc4
    mov r0, #0xd
    str r0, [r4, #0xb64]
    b .L_2a0
.L_220:
    bl func_02000d4c
    sub r0, r0, #0x1
    str r0, [r4, #0xb64]
    bl func_02000d4c
    sub r0, r0, #0x1
    str r0, [r4, #0xb64]
    b .L_2a0
.L_23c:
    bl func_02000cc4
    mov r0, #0x29
    str r0, [r4, #0xb64]
    b .L_2a0
.L_24c:
    bl func_02000d4c
    sub r0, r0, #0x1
    str r0, [r4, #0xb64]
    b .L_2a0
.L_25c:
    mov r0, #0x23
    str r0, [r4, #0xb64]
    b .L_2a0
.L_268:
    bl func_02000cc4
    mov r0, #0x21
    str r0, [r4, #0xb64]
    b .L_2a0
.L_278:
    bl func_02000cc4
    mov r0, #0x2b
    str r0, [r4, #0xb64]
    b .L_2a0
.L_288:
    bl func_02000cc4
    mov r0, #0xb
    str r0, [r4, #0xb64]
    b .L_2a0
.L_298:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_2a0:
    mov r0, #0x0
    bl func_02018b00
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_02103fcc
