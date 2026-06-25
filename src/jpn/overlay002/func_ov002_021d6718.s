; func_ov002_021d6718 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021c1d64
        .extern func_ov002_021d6780
        .global func_ov002_021d6718
        .arm
func_ov002_021d6718:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x8
    mov r7, r0
    mov r6, r1
    mov r5, r2
    mov r4, r3
    bl func_ov002_021c1d64
    cmp r0, #0x0
    addne sp, sp, #0x8
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    ldrh r0, [r7, #0x2]
    ldrh r1, [r7]
    ldr r3, [sp, #0x20]
    mov r0, r0, lsl #0x1f
    cmp r6, r0, lsr #0x1f
    movne ip, #0x1
    str r1, [sp]
    moveq ip, #0x0
    mov r0, r6
    mov r1, r5
    mov r2, r4
    str ip, [sp, #0x4]
    bl func_ov002_021d6780
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
