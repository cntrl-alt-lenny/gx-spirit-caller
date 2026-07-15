; func_ov003_021cbca4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02005d90
        .extern func_02034734
        .extern func_020347c0
        .extern func_020943b0
        .extern func_ov003_021cd2e4
        .extern func_ov003_021cd6a0
        .extern func_ov003_021ce3a8
        .extern func_ov003_021ceae8
        .global func_ov003_021cbca4
        .arm
func_ov003_021cbca4:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    mov r4, r0
    bl func_02034734
    cmp r0, #0x0
    beq .L_1b1c
    bl func_020347c0
    mov r0, r0, lsl #0x1
    orr r2, r0, #0x800
    ldr r3, _LIT0
    mov r0, #0x1
    mov r1, #0x0
    str r3, [sp]
    strh r2, [sp, #0x4]
    bl func_02005d90
    mov r1, r0
    add r0, sp, #0x0
    mov r2, #0x6
    bl func_020943b0
.L_1b1c:
    mov r0, r4
    mov r1, #0x0
    bl func_ov003_021cd2e4
    mov r0, r4
    mov r1, #0x1
    bl func_ov003_021cd2e4
    mov r0, r4
    bl func_ov003_021cd6a0
    mov r0, r4
    bl func_ov003_021ce3a8
    bl func_02034734
    cmp r0, #0x2
    bne .L_1b58
    mov r0, r4
    bl func_ov003_021ceae8
.L_1b58:
    mov r0, #0x1
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
_LIT0: .word 0x40f02000
