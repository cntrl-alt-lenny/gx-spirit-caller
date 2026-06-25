; func_02071944 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020723e0
        .extern func_020917e8
        .extern func_020918f0
        .global func_02071944
        .arm
func_02071944:
    stmdb sp!, {r4, lr}
    bl func_020723e0
    movs r4, r0
    ldmeqia sp!, {r4, lr}
    bxeq lr
    bl func_020917e8
    mov r1, #0x0
    strb r1, [r4, #0x8]
    ldr r0, [r4, #0x4]
    sub r0, r0, #0x1
    cmp r0, #0x1
    ldmhiia sp!, {r4, lr}
    bxhi lr
    str r1, [r4, #0x4]
    ldr r0, [r4]
    bl func_020918f0
    ldmia sp!, {r4, lr}
    bx lr
