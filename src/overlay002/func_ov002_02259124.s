; func_ov002_02259124 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf178
        .extern data_ov002_022d016c
        .extern func_ov002_021fbf74
        .extern func_ov002_021fc0c8
        .extern func_ov002_022591e4
        .global func_ov002_02259124
        .arm
func_ov002_02259124:
    stmdb sp!, {r4, lr}
    sub lr, r2, #0xb
    mov ip, r0
    cmp lr, #0x4
    mov r4, #0x0
    addls pc, pc, lr, lsl #0x2
    b .L_cb4
    b .L_c54
    b .L_ca0
    b .L_ca0
    b .L_ca0
    b .L_ca0
.L_c54:
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
    bne .L_cd0
    mov r0, r1
    mov r1, r3
    mov r2, ip
    bl func_ov002_021fc0c8
    cmp r0, #0x0
    orrne r4, r4, #0x8
    b .L_cd0
.L_ca0:
    mov r0, r1
    mov r1, r2
    bl func_ov002_022591e4
    orr r4, r4, r0
    b .L_cd0
.L_cb4:
    ldr r0, _LIT2
    add r2, r2, r3
    ldr r0, [r0, #0xd6c]
    mov r3, ip
    bl func_ov002_021fbf74
    cmp r0, #0x0
    orrne r4, r4, #0x8
.L_cd0:
    mov r0, r4
    ldmia sp!, {r4, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf178
_LIT2: .word data_ov002_022d016c
