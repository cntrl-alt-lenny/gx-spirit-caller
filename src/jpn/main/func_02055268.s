; func_02055268 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02045398
        .extern func_020aace8
        .extern func_020aad04
        .global func_02055268
        .arm
func_02055268:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    movs r5, r0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, pc}
    bl func_020aace8
    add r0, r0, #0x1
    bl func_02045398
    movs r4, r0
    beq .L_2e0
    mov r1, r5
    bl func_020aad04
.L_2e0:
    mov r0, r4
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
