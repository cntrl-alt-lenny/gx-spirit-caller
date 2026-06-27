; func_ov002_022bda34 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02021584
        .global func_ov002_022bda34
        .arm
func_ov002_022bda34:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, #0x0
    mov r6, r0
    mov r4, r5
.L_10:
    ldr r0, [r6]
    cmp r0, #0x0
    beq .L_2c
    bl func_02021584
    cmp r0, #0x0
    streq r4, [r6]
    streq r4, [r6, #0x4]
.L_2c:
    add r5, r5, #0x1
    cmp r5, #0x10
    add r6, r6, #0x8
    blt .L_10
    ldmia sp!, {r4, r5, r6, pc}
