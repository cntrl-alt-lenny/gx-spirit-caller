; func_ov002_021d5fb4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021d5ab4
        .global func_ov002_021d5fb4
        .arm
func_ov002_021d5fb4:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    and r2, r0, #0xff
    and r0, r1, #0xff
    orr r0, r2, r0, lsl #0x8
    mov r0, r0, lsl #0x10
    mov r6, #0x0
    mov r8, r0, lsr #0x10
    mov r4, #0x1
    mov r5, r6
.L_280:
    mov r7, r5
.L_284:
    mov r0, r6
    mov r1, r7
    mov r2, r8
    mov r3, r4
    bl func_ov002_021d5ab4
    add r7, r7, #0x1
    cmp r7, #0x5
    blt .L_284
    add r6, r6, #0x1
    cmp r6, #0x2
    blt .L_280
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
