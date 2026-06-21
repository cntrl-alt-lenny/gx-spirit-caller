; func_ov002_021d1fd4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce950
        .extern data_ov002_022cf288
        .extern data_ov002_022d016c
        .extern func_ov002_021c3d84
        .extern func_ov002_0229ade0
        .extern func_ov002_0229c7f8
        .global func_ov002_021d1fd4
        .arm
func_ov002_021d1fd4:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r0, _LIT0
    ldrh r0, [r0]
    tst r0, #0x8000
    ldr r0, _LIT0
    movne r4, #0x1
    ldrh r2, [r0, #0x2]
    ldrh r1, [r0, #0x4]
    ldr r0, [r0, #0x810]
    moveq r4, #0x0
    cmp r0, #0x0
    orr r5, r2, r1, lsl #0x10
    beq .L_40
    cmp r0, #0x1
    beq .L_ac
    ldmia sp!, {r3, r4, r5, pc}
.L_40:
    mvn r0, #0x0
    bl func_ov002_0229c7f8
    cmp r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r1, _LIT1
    mov r0, r4
    str r5, [r1, #0xce4]
    bl func_ov002_021c3d84
    cmp r0, #0x0
    beq .L_7c
    mov r2, #0x0
    mov r1, r4
    mov r3, r2
    mov r0, #0x10
    bl func_ov002_0229ade0
.L_7c:
    ldr r0, _LIT2
    and r1, r4, #0x1
    mul r2, r1, r0
    ldr r3, _LIT3
    ldr r0, _LIT0
    ldr r1, [r3, r2]
    bic r1, r1, #0x4
    str r1, [r3, r2]
    ldr r1, [r0, #0x810]
    add r1, r1, #0x1
    str r1, [r0, #0x810]
    ldmia sp!, {r3, r4, r5, pc}
.L_ac:
    mov r0, #0x10
    bl func_ov002_0229c7f8
    cmp r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x80c]
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022ce950
_LIT1: .word data_ov002_022d016c
_LIT2: .word 0x00000868
_LIT3: .word data_ov002_022cf288
