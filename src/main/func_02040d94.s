; func_02040d94 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02040de8
        .extern func_02043728
        .extern func_020aaddc
        .global func_02040d94
        .arm
func_02040d94:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r2
    mov r5, r3
    bl func_02040de8
    movs r4, r0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    bl func_020aaddc
    mov r1, r0
    mov r0, r4
    mov r2, r6
    mov r3, r5
    bl func_02043728
    mvn r1, #0x0
    cmp r0, r1
    ldmeqia sp!, {r4, r5, r6, pc}
    cmp r0, r5
    ldmcsia sp!, {r4, r5, r6, pc}
    mov r1, #0x0
    strb r1, [r6, r0]
    ldmia sp!, {r4, r5, r6, pc}
