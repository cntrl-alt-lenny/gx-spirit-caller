; func_020a2bc8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0209281c
        .extern DC_WaitWriteBufferEmpty
        .extern func_020a35e8
        .global func_020a2bc8
        .arm
func_020a2bc8:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r4, r2
    add r2, r6, #0x1f
    mov r5, r1
    mov r0, r4
    bic r1, r2, #0x1f
    bl func_0209281c
    bl DC_WaitWriteBufferEmpty
    mov r0, r4
    mov r1, r6
    mov r2, r5
    bl func_020a35e8
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
