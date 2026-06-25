; func_ov002_0225903c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf098
        .extern data_ov002_022d008c
        .extern func_ov002_021fbe84
        .extern func_ov002_021fbfd8
        .extern func_ov002_022590fc
        .global func_ov002_0225903c
        .arm
func_ov002_0225903c:
    stmdb sp!, {r4, lr}
    sub lr, r2, #0xb
    mov ip, r0
    cmp lr, #0x4
    mov r4, #0x0
    addls pc, pc, lr, lsl #0x2
    b .L_b24
    b .L_ac4
    b .L_b10
    b .L_b10
    b .L_b10
    b .L_b10
.L_ac4:
    ldr r0, _LIT0
    and r2, r1, #0x1
    mul lr, r2, r0
    ldr r0, _LIT1
    ldr r0, [r0, lr]
    cmp r3, r0
    movcs r0, r4
    ldmcsia sp!, {r4, pc}
    ldr r0, _LIT2
    ldr r0, [r0, #0xd6c]
    cmp r0, r1
    bne .L_b40
    mov r0, r1
    mov r1, r3
    mov r2, ip
    bl func_ov002_021fbfd8
    cmp r0, #0x0
    orrne r4, r4, #0x8
    b .L_b40
.L_b10:
    mov r0, r1
    mov r1, r2
    bl func_ov002_022590fc
    orr r4, r4, r0
    b .L_b40
.L_b24:
    ldr r0, _LIT2
    add r2, r2, r3
    ldr r0, [r0, #0xd6c]
    mov r3, ip
    bl func_ov002_021fbe84
    cmp r0, #0x0
    orrne r4, r4, #0x8
.L_b40:
    mov r0, r4
    ldmia sp!, {r4, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf098
_LIT2: .word data_ov002_022d008c
