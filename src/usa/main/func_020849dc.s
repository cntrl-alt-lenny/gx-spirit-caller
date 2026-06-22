; func_020849dc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020849dc
        .arm
func_020849dc:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0xc]
    cmp r1, #0x0
    beq .L_2814
    blx r1
.L_2814:
    ldr r0, [r4]
    add r0, r0, #0x1
    str r0, [r4]
    ldmia sp!, {r4, pc}
