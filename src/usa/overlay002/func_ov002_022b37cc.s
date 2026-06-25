; func_ov002_022b37cc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov002_022b37cc
        .arm
func_ov002_022b37cc:
    ldr r1, [r0, #0x68]
    cmp r1, #0x0
    beq .L_208
    cmp r1, #0x60
    movlt r0, #0x1
    bxlt lr
.L_208:
    ldr r1, [r0, #0x54]
    cmp r1, #0x0
    ldrle r1, [r0, #0x1c]
    cmple r1, #0x0
    ldrle r0, [r0, #0x20]
    cmple r0, #0x0
    movgt r0, #0x1
    movle r0, #0x0
    bx lr
