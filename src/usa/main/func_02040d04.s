; func_02040d04 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02040d98
        .extern func_020aace8
        .extern func_020aad04
        .global func_02040d04
        .arm
func_02040d04:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r2
    mov r5, r3
    bl func_02040d98
    movs r4, r0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    bl func_020aace8
    cmp r0, r5
    movge r0, #0x0
    ldmgeia sp!, {r4, r5, r6, pc}
    mov r0, r6
    mov r1, r4
    bl func_020aad04
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
