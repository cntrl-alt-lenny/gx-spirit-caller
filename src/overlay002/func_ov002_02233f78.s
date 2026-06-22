; func_ov002_02233f78 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf1a2
        .extern data_ov002_022cf1a4
        .extern func_ov002_021d6808
        .extern func_ov002_0223de94
        .extern func_ov002_0223df38
        .extern func_ov002_0225764c
        .global func_ov002_02233f78
        .arm
func_ov002_02233f78:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x4
    mov r1, #0x0
    mov r2, r1
    mov r6, r0
    bl func_ov002_0223df38
    cmp r0, #0x0
    beq .L_25c
    mov r0, r6
    mov r1, #0x0
    bl func_ov002_0223de94
    mov r1, r0, lsl #0x10
    and r4, r0, #0xff
    mov r0, r1, lsr #0x10
    mov r0, r0, asr #0x8
    and r5, r0, #0xff
    mov r0, r6
    mov r1, r4
    mov r2, r5
    bl func_ov002_0225764c
    cmp r0, #0x0
    beq .L_25c
    ldr r1, _LIT0
    and r2, r4, #0x1
    mov r0, #0x14
    mul r3, r2, r1
    ldr r1, _LIT1
    mul r2, r5, r0
    add r0, r1, r3
    ldrh r0, [r2, r0]
    cmp r0, #0x0
    bne .L_244
    ldr r0, _LIT2
    add r0, r0, r3
    ldrh r0, [r2, r0]
    cmp r0, #0x0
    beq .L_244
    mov ip, #0x2
    mov r0, r6
    mov r1, r4
    mov r2, r5
    mov r3, #0x1
    str ip, [sp]
    bl func_ov002_021d6808
    b .L_25c
.L_244:
    mov r3, #0x0
    mov r0, r6
    mov r1, r4
    mov r2, r5
    str r3, [sp]
    bl func_ov002_021d6808
.L_25c:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf1a4
_LIT2: .word data_ov002_022cf1a2
