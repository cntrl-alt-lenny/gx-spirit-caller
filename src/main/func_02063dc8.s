; func_02063dc8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020628fc
        .extern func_020643ec
        .global func_02063dc8
        .arm
func_02063dc8:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_020628fc
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, [r4, #0xc]
    mov r1, #0x2
    cmp r0, #0x6
    moveq r2, #0x0
    movne r2, #0x1
    mov r0, r4
    bl func_020643ec
    cmp r0, #0x0
    moveq r0, #0x0
    movne r0, #0x1
    ldmia sp!, {r4, pc}
