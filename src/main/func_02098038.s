; func_02098038 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02098088
        .extern func_0209815c
        .global func_02098038
        .arm
func_02098038:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    mov r4, r0
    add r0, sp, #0x0
    bl func_0209815c
    cmp r0, #0x0
    beq .L_40
    add r1, sp, #0x0
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_02098088
    cmp r0, #0x0
    addne sp, sp, #0x8
    movne r0, #0x1
    ldmneia sp!, {r4, lr}
    bxne lr
.L_40:
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r4, lr}
    bx lr
