; func_ov002_02227bb8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021d5a08
        .extern func_ov002_021e276c
        .extern func_ov002_0223df38
        .extern func_ov002_0225764c
        .global func_ov002_02227bb8
        .arm
func_ov002_02227bb8:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0xc
    add r2, sp, #0x8
    mov r1, #0x0
    mov r4, r0
    bl func_ov002_0223df38
    cmp r0, #0x0
    beq .L_88
    ldr r2, [sp, #0x8]
    mov r0, r4
    mov r1, r2, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x8
    and r5, r2, #0xff
    and r6, r1, #0xff
    mov r1, r5
    mov r2, r6
    bl func_ov002_0225764c
    cmp r0, #0x0
    beq .L_88
    mov r0, #0x2
    str r0, [sp]
    mov r0, #0x1
    str r0, [sp, #0x4]
    ldrh r3, [r4]
    mov r0, r4
    mov r1, r5
    mov r2, r6
    bl func_ov002_021d5a08
    ldrh r1, [r4]
    mov r0, r5
    mov r2, #0x1
    mov r3, #0x0
    bl func_ov002_021e276c
.L_88:
    mov r0, #0x0
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, r5, r6, pc}
