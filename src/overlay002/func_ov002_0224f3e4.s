; func_ov002_0224f3e4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf180
        .extern func_ov002_02253458
        .global func_ov002_0224f3e4
        .arm
func_ov002_0224f3e4:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov sl, r0
    ldr r0, _LIT0
    and r3, sl, #0x1
    mul r1, r3, r0
    ldr r0, _LIT1
    mov r9, r2
    ldr r0, [r0, r1]
    mov r6, #0x0
    cmp r0, #0x0
    ldmlsia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT2
    ldr r4, _LIT3
    add r8, r0, r1
    add r0, r8, #0x18
    ldr r5, _LIT4
    add r7, r0, #0x400
    mov fp, #0xe
.L_48:
    ldr r0, [r7]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    cmp r0, r5
    cmpne r0, r4
    bne .L_90
    ldr r1, [r7]
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r1, lsr #0x1f
    cmp r9, r0
    beq .L_90
    mov r0, sl
    mov r1, fp
    mov r2, r6
    bl func_ov002_02253458
.L_90:
    ldr r0, [r8, #0x14]
    add r6, r6, #0x1
    cmp r6, r0
    add r7, r7, #0x4
    bcc .L_48
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf180
_LIT2: .word data_ov002_022cf16c
_LIT3: .word 0x000018c5
_LIT4: .word 0x00000fbe
