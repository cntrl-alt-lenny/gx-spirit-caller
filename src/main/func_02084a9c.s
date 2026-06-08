; func_02084a9c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02084a9c
        .arm
func_02084a9c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x10]
    cmp r1, #0x0
    beq .L_2200
    blx r1
.L_2200:
    ldr r0, [r4, #0x8]
    orr r0, r0, #0x20
    str r0, [r4, #0x8]
    ldmia sp!, {r4, pc}
