; func_ov004_021d5924 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0202c06c
        .extern func_02032638
        .extern func_020334f4
        .extern func_020334fc
        .extern func_020340c4
        .extern func_ov004_021d3a94
        .global func_ov004_021d5924
        .arm
func_ov004_021d5924:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x4
    mov r6, r0
    ldr r0, [r6, #0x38]
    cmp r0, #0x0
    mov r0, #0x0
    strne r0, [r6, #0x38]
    movne r0, #0x1
    cmp r0, #0x0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r3, r4, r5, r6, pc}
    bl func_02032638
    bl func_020334fc
    mov r5, r0
    bl func_02032638
    bl func_020334f4
    mov r4, r0
    mov r0, r5
    mov r1, r4
    bl func_020340c4
    str r0, [r6, #0x48]
    ldr r0, _LIT0
    bl func_0202c06c
    mov r1, r4
    str r0, [sp]
    mov r0, r6
    ldr r3, [r6, #0x48]
    mov r2, #0x0
    bl func_ov004_021d3a94
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
_LIT0: .word 0x00000675
