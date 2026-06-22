; func_ov002_0222d230 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf178
        .extern data_ov002_022d0e6c
        .extern func_ov002_021d71e0
        .extern func_ov002_021e286c
        .extern func_ov002_0226af78
        .global func_ov002_0222d230
        .arm
func_ov002_0222d230:
    stmdb sp!, {r4, lr}
    ldr r1, _LIT0
    ldr r1, [r1, #0x5a8]
    cmp r1, #0x7f
    beq .L_5c
    cmp r1, #0x80
    bne .L_ac
    ldrh r0, [r0, #0x2]
    ldr r1, _LIT1
    ldr r2, _LIT2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    and r3, r0, #0x1
    mul r1, r3, r1
    ldr r1, [r2, r1]
    cmp r1, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    mov r1, #0x0
    bl func_ov002_0226af78
    mov r0, #0x7f
    ldmia sp!, {r4, pc}
.L_5c:
    ldrh r0, [r0, #0x2]
    ldr r1, _LIT1
    ldr r3, _LIT3
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    and ip, r0, #0x1
    mla r3, ip, r1, r3
    ldr r2, _LIT4
    ldrh r1, [r2, #0xb0]
    mov r2, #0x1
    add r3, r3, r1, lsl #0x2
    ldr r3, [r3, #0x120]
    mov r3, r3, lsl #0x12
    mov r4, r3, lsr #0x1f
    bl func_ov002_021d71e0
    mov r0, r4
    bl func_ov002_021e286c
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_ac:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf178
_LIT3: .word data_ov002_022cf16c
_LIT4: .word data_ov002_022d0e6c
