; func_0203dddc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0203c7f8
        .extern func_0203c8b0
        .extern func_0203dc44
        .extern func_0203dd74
        .extern func_0203dd90
        .extern func_0203dd98
        .global func_0203dddc
        .arm
func_0203dddc:
    stmdb sp!, {r4, lr}
    mov r0, #0x1
    bl func_0203c8b0
    mov r4, r0
    bl func_0203c7f8
    cmp r0, #0x4
    bge .L_24
    bl func_0203dd98
    ldmia sp!, {r4, pc}
.L_24:
    cmp r0, #0x5
    bge .L_34
    bl func_0203dd90
    ldmia sp!, {r4, pc}
.L_34:
    cmp r0, #0x5
    bne .L_48
    mov r0, r4
    bl func_0203dd74
    ldmia sp!, {r4, pc}
.L_48:
    mov r0, r4
    bl func_0203dc44
    ldmia sp!, {r4, pc}
