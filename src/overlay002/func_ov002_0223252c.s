; func_ov002_0223252c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf178
        .extern func_ov002_021d7c1c
        .extern func_ov002_021ded1c
        .extern func_ov002_02257704
        .global func_ov002_0223252c
        .arm
func_ov002_0223252c:
    stmdb sp!, {r4, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r1, [r1, #0x5a8]
    cmp r1, #0x7f
    beq .L_560
    cmp r1, #0x80
    bne .L_5dc
    bl func_ov002_02257704
    mov r1, r0
    mov r0, r4
    bl func_ov002_021ded1c
    mov r0, #0x7f
    ldmia sp!, {r4, pc}
.L_560:
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT1
    ldr ip, _LIT2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r2, r0, #0x1
    mul r3, r2, r1
    ldr r2, [ip, r3]
    cmp r2, #0x0
    beq .L_5a4
    ldr r1, _LIT3
    mov r2, #0x0
    add r1, r1, r3
    add r1, r1, #0x120
    bl func_ov002_021d7c1c
    mov r0, #0x7f
    ldmia sp!, {r4, pc}
.L_5a4:
    rsb r0, r0, #0x1
    and r2, r0, #0x1
    mul r3, r2, r1
    ldr r1, [ip, r3]
    cmp r1, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r1, _LIT3
    mov r2, #0x1
    add r1, r1, r3
    add r1, r1, #0x120
    bl func_ov002_021d7c1c
    mov r0, #0x7f
    ldmia sp!, {r4, pc}
.L_5dc:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf178
_LIT3: .word data_ov002_022cf16c
