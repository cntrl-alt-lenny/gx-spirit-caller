; func_ov002_021fb17c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022be12c
        .extern data_ov002_022cf16c
        .extern func_ov002_021c2e34
        .extern func_ov002_021d8128
        .extern func_ov002_021e2b3c
        .extern func_ov002_021e2c5c
        .global func_ov002_021fb17c
        .arm
func_ov002_021fb17c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r8, r0
    ldrh r0, [r8, #0x2]
    mov r0, r0, lsl #0x14
    mov r0, r0, lsr #0x1a
    cmp r0, #0x23
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    bl func_ov002_021e2b3c
    mov r7, #0x0
    ldr r5, _LIT0
    ldr r6, _LIT1
    ldr r9, _LIT2
    mov r4, r7
.L_38:
    ldrh r0, [r8, #0x2]
    ldr r1, [r6, r7, lsl #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021c2e34
    movs r1, r0
    bmi .L_7c
    ldrh r0, [r8, #0x2]
    mov r2, r4
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r3, r0, #0x1
    mla ip, r3, r9, r5
    add r3, ip, #0x18
    add r3, r3, #0x400
    add r1, r3, r1, lsl #0x2
    bl func_ov002_021d8128
.L_7c:
    add r7, r7, #0x1
    cmp r7, #0x4
    bcc .L_38
    bl func_ov002_021e2c5c
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word data_ov002_022be12c
_LIT2: .word 0x00000868
