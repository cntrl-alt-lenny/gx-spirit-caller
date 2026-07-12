; func_ov016_021b7e50 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Task_InvokeLocked
        .extern data_ov016_021bb050
        .extern func_02005898
        .extern func_0201eee8
        .global func_ov016_021b7e50
        .arm
func_ov016_021b7e50:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r0
    bl func_02005898
    mov r6, #0x0
    ldr r4, _LIT0
    mov r5, r6
.L_808:
    ldr r0, [r7, #0x54]
    cmp r0, #0x0
    beq .L_82c
    ldr r0, [r7]
    add r1, r7, #0x8
    add r2, r7, #0x54
    bl func_0201eee8
    str r5, [r7, #0x58]
    str r5, [r7, #0x54]
.L_82c:
    ldr r0, [r4, r6, lsl #0x2]
    cmp r0, #0x0
    beq .L_83c
    bl Task_InvokeLocked
.L_83c:
    add r6, r6, #0x1
    cmp r6, #0x5
    add r7, r7, #0x5c
    blt .L_808
    ldr r2, _LIT1
    mov r0, #0x1
    ldrh r1, [r2]
    and r1, r1, #0x43
    orr r1, r1, #0x304
    orr r1, r1, #0x4000
    strh r1, [r2]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov016_021bb050
_LIT1: .word 0x0400000c
