; func_ov002_02202150 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0a0
        .extern func_0202b824
        .global func_ov002_02202150
        .arm
func_ov002_02202150:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r7, r0
    ldrh r1, [r7, #0x2]
    ldr r8, _LIT0
    ldr r0, _LIT1
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    rsb r1, r1, #0x1
    and r1, r1, #0x1
    mul r2, r1, r8
    ldr r0, [r0, r2]
    mov r5, #0x0
    cmp r0, #0x0
    bls .L_9c
    ldr r4, _LIT2
    mov r6, r5
.L_40:
    add r0, r4, r2
    add r0, r0, r6
    ldr r0, [r0, #0x418]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bl func_0202b824
    cmp r0, #0x16
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    ldrh r0, [r7, #0x2]
    add r5, r5, #0x1
    add r6, r6, #0x4
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    and r0, r0, #0x1
    mul r2, r0, r8
    add r0, r4, r2
    ldr r0, [r0, #0x14]
    cmp r5, r0
    bcc .L_40
.L_9c:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf0a0
_LIT2: .word data_ov002_022cf08c
