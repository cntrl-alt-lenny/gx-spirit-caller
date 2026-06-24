; func_020257ec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0202582c
        .global func_020257ec
        .arm
func_020257ec:
    stmdb sp!, {r3, lr}
    add r1, r0, #0x100
    ldrh r1, [r1, #0x6a]
    mov r2, r1, lsl #0x1f
    movs r2, r2, lsr #0x1f
    beq .L_1304
    mov r1, r1, lsl #0x1e
    movs r1, r1, lsr #0x1f
    beq .L_1304
    bl func_0202582c
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, pc}
.L_1304:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
