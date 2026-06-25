; func_ov002_021c28dc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_0202e1e0
        .extern func_ov002_021babc8
        .global func_ov002_021c28dc
        .arm
func_ov002_021c28dc:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r6, r1
    mov r7, r0
    mov r0, r6
    bl func_0202e1e0
    cmp r0, #0x0
    movne r4, #0x0
    movne r5, #0x4
    moveq r4, #0x5
    moveq r5, #0x9
    cmp r4, r5
    ldmgtia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r2, _LIT0
    ldr r0, _LIT1
    and r1, r7, #0x1
    mla r2, r1, r0, r2
    mov r0, #0x14
    mla r8, r4, r0, r2
.L_49c:
    mov r0, r7
    mov r1, r4
    mov r2, r6
    bl func_ov002_021babc8
    cmp r0, #0x0
    ldrne r0, [r8, #0x40]
    add r4, r4, #0x1
    orrne r0, r0, #0x20
    strne r0, [r8, #0x40]
    cmp r4, r5
    add r8, r8, #0x14
    ble .L_49c
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov002_022cf08c
_LIT1: .word 0x00000868
