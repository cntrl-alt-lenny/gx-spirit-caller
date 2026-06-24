; func_02097910 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020964b8
        .extern func_02096634
        .extern func_02097958
        .extern func_020979fc
        .global func_02097910
        .arm
func_02097910:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x10]
    bl func_020964b8
    mov r1, r0
    mov r0, r4
    bl func_02096634
    ldr r0, [r4, #0x8]
    bl func_020979fc
    cmp r0, #0x0
    beq .L_1ec
    bl func_02097958
.L_1ec:
    ldr r0, [r4, #0x14]
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r4, lr}
    bx lr
