; func_02040d54 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02040de8
        .extern func_020aaddc
        .extern func_020aadf8
        .global func_02040d54
        .arm
func_02040d54:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r2
    mov r5, r3
    bl func_02040de8
    movs r4, r0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    bl func_020aaddc
    cmp r0, r5
    movge r0, #0x0
    ldmgeia sp!, {r4, r5, r6, pc}
    mov r0, r6
    mov r1, r4
    bl func_020aadf8
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
