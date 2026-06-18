; func_ov002_02214c58 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021d6808
        .extern func_ov002_0223de94
        .extern func_ov002_0223df38
        .global func_ov002_02214c58
        .arm
func_ov002_02214c58:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    mov r1, #0x0
    mov r2, r1
    mov r4, r0
    bl func_ov002_0223df38
    cmp r0, #0x0
    beq .L_574
    mov r0, r4
    mov r1, #0x0
    bl func_ov002_0223de94
    mov r1, r0
    mov r0, r1, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r2, r0, asr #0x8
    mov r3, #0x0
    mov r0, r4
    and r1, r1, #0xff
    and r2, r2, #0xff
    str r3, [sp]
    bl func_ov002_021d6808
.L_574:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
