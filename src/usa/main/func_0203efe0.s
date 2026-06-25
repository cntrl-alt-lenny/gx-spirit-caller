; func_0203efe0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219ebfc
        .extern func_0203c80c
        .extern func_0203c8b0
        .extern func_0203ed84
        .extern func_0206e748
        .global func_0203efe0
        .arm
func_0203efe0:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r0, #0x1
    bl func_0203c8b0
    mov r5, r0
    mov r0, #0x4
    bl func_0203c8b0
    mov r4, r0
    mov r0, r5
    mov r1, r6
    mov r2, r4
    bl func_0203ed84
    ldr r1, _LIT0
    mov r2, #0x4
    mov r0, r4
    str r2, [r1]
    bl func_0206e748
    cmp r0, #0x0
    moveq r0, #0xc
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r0, #0x2
    bl func_0203c80c
    mov r0, #0x11
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_0219ebfc
