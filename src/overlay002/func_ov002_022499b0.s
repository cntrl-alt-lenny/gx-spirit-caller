; func_ov002_022499b0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf17c
        .extern func_ov002_021ca3f0
        .extern func_ov002_02253458
        .global func_ov002_022499b0
        .arm
func_ov002_022499b0:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    ldr r2, _LIT0
    mov r7, r1
    mov r8, r0
    cmp r7, r2
    addeq r7, r2, #0x1
    ldr r0, _LIT1
    and r2, r8, #0x1
    mul r1, r2, r0
    ldr r0, _LIT2
    mov r4, #0x0
    ldr r0, [r0, r1]
    cmp r0, #0x0
    ldmlsia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r0, _LIT3
    mov r9, #0xd
    add r6, r0, r1
    add r5, r6, #0x260
.L_48:
    ldr r0, [r5]
    mov r0, r0, lsl #0x13
    cmp r7, r0, lsr #0x13
    bne .L_7c
    mov r0, r8
    mov r1, r7
    bl func_ov002_021ca3f0
    cmp r0, #0x0
    beq .L_7c
    mov r0, r8
    mov r1, r9
    mov r2, r4
    bl func_ov002_02253458
.L_7c:
    ldr r0, [r6, #0x10]
    add r4, r4, #0x1
    cmp r4, r0
    add r5, r5, #0x4
    bcc .L_48
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word 0x000015b6
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf17c
_LIT3: .word data_ov002_022cf16c
