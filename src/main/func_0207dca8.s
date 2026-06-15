; func_0207dca8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02097ff0
        .extern func_02098038
        .extern func_02098388
        .global func_0207dca8
        .arm
func_0207dca8:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4c
    mov r5, r0
    add r0, sp, #0x0
    mov r4, #0x0
    bl func_02098388
    add r0, sp, #0x0
    mov r1, r5
    bl func_02098038
    cmp r0, #0x0
    beq .L_90
    ldr r0, [sp, #0x8]
    ldr r1, [sp, #0x24]
    ldr r2, [r0, #0x64]
    add r0, sp, #0x0
    add r4, r2, r1
    bl func_02097ff0
.L_90:
    mov r0, r4
    add sp, sp, #0x4c
    ldmia sp!, {r4, r5, pc}
