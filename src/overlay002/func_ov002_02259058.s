; func_ov002_02259058 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf178
        .extern data_ov002_022d016c
        .extern func_ov002_021fbf74
        .extern func_ov002_021fc0c8
        .extern func_ov002_022591e4
        .extern func_ov002_02259278
        .global func_ov002_02259058
        .arm
func_ov002_02259058:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r1
    sub r3, r6, #0xb
    mov r5, r0
    cmp r3, #0x4
    mov r4, #0x0
    addls pc, pc, r3, lsl #0x2
    b .L_bf0
    b .L_b8c
    b .L_bd4
    b .L_bd4
    b .L_bd4
    b .L_bd4
.L_b8c:
    ldr r1, _LIT0
    and r3, r5, #0x1
    mul ip, r3, r1
    ldr r1, _LIT1
    ldr r1, [r1, ip]
    cmp r2, r1
    movcs r0, r4
    ldmcsia sp!, {r4, r5, r6, pc}
    ldr r1, _LIT2
    ldr r1, [r1, #0xd6c]
    cmp r1, r5
    bne .L_c10
    mov r1, r2
    mov r2, r4
    bl func_ov002_021fc0c8
    cmp r0, #0x0
    orrne r4, r4, #0x8
    b .L_c10
.L_bd4:
    bl func_ov002_022591e4
    orr r4, r4, r0
    mov r0, r5
    mov r1, r6
    bl func_ov002_02259278
    orr r4, r4, r0
    b .L_c10
.L_bf0:
    ldr r0, _LIT2
    mov r1, r5
    ldr r0, [r0, #0xd6c]
    add r2, r6, r2
    mov r3, #0x0
    bl func_ov002_021fbf74
    cmp r0, #0x0
    orrne r4, r4, #0x8
.L_c10:
    mov r0, r4
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf178
_LIT2: .word data_ov002_022d016c
