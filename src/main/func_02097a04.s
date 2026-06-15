; func_02097a04 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020965ac
        .extern func_02096728
        .extern func_02097a4c
        .extern func_02097af0
        .global func_02097a04
        .arm
func_02097a04:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x10]
    bl func_020965ac
    mov r1, r0
    mov r0, r4
    bl func_02096728
    ldr r0, [r4, #0x8]
    bl func_02097af0
    cmp r0, #0x0
    beq .L_1ec
    bl func_02097a4c
.L_1ec:
    ldr r0, [r4, #0x14]
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r4, lr}
    bx lr
