; func_ov002_0220e518 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021de4d8
        .extern func_ov002_0223df38
        .extern func_ov002_0225764c
        .global func_ov002_0220e518
        .arm
func_ov002_0220e518:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x4
    add r2, sp, #0x0
    mov r1, #0x0
    mov r6, r0
    bl func_ov002_0223df38
    cmp r0, #0x0
    beq .L_24c
    ldr r2, [sp]
    mov r0, r6
    mov r1, r2, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x8
    and r4, r2, #0xff
    and r5, r1, #0xff
    mov r1, r4
    mov r2, r5
    bl func_ov002_0225764c
    cmp r0, #0x0
    beq .L_24c
    mov r0, r6
    mov r1, r4
    mov r2, r5
    bl func_ov002_021de4d8
    cmp r0, #0x0
    addne sp, sp, #0x4
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, pc}
.L_24c:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
