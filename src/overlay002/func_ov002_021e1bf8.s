; func_ov002_021e1bf8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d016c
        .extern func_ov002_021b004c
        .extern func_ov002_021d479c
        .global func_ov002_021e1bf8
        .arm
func_ov002_021e1bf8:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    ldr r1, _LIT0
    mov sl, r0
    ldr r0, [r1, #0xd44]
    subs r9, r0, #0x1
    ldmmiia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    mov r6, #0x0
    mov r7, #0x8000
    mov r5, #0xd
    mov r4, r6
.L_fc:
    add r0, r9, #0x1
    bl func_ov002_021b004c
    mov r8, r0
    add r0, r9, #0x1
    bl func_ov002_021b004c
    ldr r0, [r0]
    ldr r1, [r8]
    mov r0, r0, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    add r1, r0, r1, lsr #0x1f
    mov r2, r1, lsl #0x10
    cmp sl, #0x0
    movne r0, r7
    moveq r0, r6
    orr r0, r0, #0x57
    mov r0, r0, lsl #0x10
    mov r1, r5
    mov r3, r4
    mov r0, r0, lsr #0x10
    mov r2, r2, lsr #0x10
    bl func_ov002_021d479c
    subs r9, r9, #0x1
    bpl .L_fc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_ov002_022d016c
