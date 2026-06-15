; func_0203de2c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0203c848
        .extern func_0203c900
        .extern func_0203dc94
        .extern func_0203ddc4
        .extern func_0203dde0
        .extern func_0203dde8
        .global func_0203de2c
        .arm
func_0203de2c:
    stmdb sp!, {r4, lr}
    mov r0, #0x1
    bl func_0203c900
    mov r4, r0
    bl func_0203c848
    cmp r0, #0x4
    bge .L_24
    bl func_0203dde8
    ldmia sp!, {r4, pc}
.L_24:
    cmp r0, #0x5
    bge .L_34
    bl func_0203dde0
    ldmia sp!, {r4, pc}
.L_34:
    cmp r0, #0x5
    bne .L_48
    mov r0, r4
    bl func_0203ddc4
    ldmia sp!, {r4, pc}
.L_48:
    mov r0, r4
    bl func_0203dc94
    ldmia sp!, {r4, pc}
