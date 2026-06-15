; func_020331b0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02032624
        .extern func_0203267c
        .extern func_02032724
        .extern func_020327c0
        .extern func_02032e6c
        .extern func_02033488
        .extern func_020334b4
        .global func_020331b0
        .arm
func_020331b0:
    stmdb sp!, {r4, lr}
    movs r4, r0
    ldmeqia sp!, {r4, pc}
    bl func_02033488
    mov r0, r4
    bl func_020334b4
    mov r0, r4
    bl func_02032724
    mov r0, r4
    bl func_020327c0
    mov r0, r4
    mov r1, r4
    bl func_02032e6c
    mov r0, #0x0
    bl func_0203267c
    mov r0, #0x0
    bl func_02032624
    ldmia sp!, {r4, pc}
