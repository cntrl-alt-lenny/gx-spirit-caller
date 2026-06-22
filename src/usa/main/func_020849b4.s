; func_020849b4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020849b4
        .arm
func_020849b4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x10]
    cmp r1, #0x0
    beq .L_27ec
    blx r1
.L_27ec:
    ldr r0, [r4, #0x8]
    orr r0, r0, #0x20
    str r0, [r4, #0x8]
    ldmia sp!, {r4, pc}
