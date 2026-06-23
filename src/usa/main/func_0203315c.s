; func_0203315c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020325d0
        .extern func_02032628
        .extern func_020326d0
        .extern func_0203276c
        .extern func_02032e18
        .extern func_02033438
        .extern func_02033464
        .global func_0203315c
        .arm
func_0203315c:
    stmdb sp!, {r4, lr}
    movs r4, r0
    ldmeqia sp!, {r4, pc}
    bl func_02033438
    mov r0, r4
    bl func_02033464
    mov r0, r4
    bl func_020326d0
    mov r0, r4
    bl func_0203276c
    mov r0, r4
    mov r1, r4
    bl func_02032e18
    mov r0, #0x0
    bl func_02032628
    mov r0, #0x0
    bl func_020325d0
    ldmia sp!, {r4, pc}
