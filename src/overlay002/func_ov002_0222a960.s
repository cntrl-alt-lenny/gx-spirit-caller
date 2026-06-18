; func_ov002_0222a960 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021de64c
        .extern func_ov002_0223df38
        .extern func_ov002_0225764c
        .global func_ov002_0222a960
        .arm
func_ov002_0222a960:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x4
    add r2, sp, #0x0
    mov r1, #0x0
    mov r6, r0
    bl func_ov002_0223df38
    cmp r0, #0x0
    beq .L_33c
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
    beq .L_33c
    mov r0, r6
    mov r1, r4
    mov r2, r5
    mov r3, #0x0
    bl func_ov002_021de64c
.L_33c:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
