; func_0205c8b4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020550b4
        .extern func_020550fc
        .extern func_02055144
        .extern func_02055190
        .global func_0205c8b4
        .arm
func_0205c8b4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    mov r1, #0x4000
    bl func_02055190
    mov r0, r4
    mov r1, #0x8000
    bl func_02055190
    mov r0, r4
    mov r1, #0x10000
    bl func_02055190
    mov r0, r4
    mov r1, #0x20000
    bl func_02055190
    mov r0, r4
    mov r1, #0x40000
    bl func_02055190
    mov r0, r4
    mov r1, #0x4000
    bl func_02055144
    mov r0, r4
    mov r1, #0x8000
    bl func_02055144
    mov r0, r4
    mov r1, #0x10000
    bl func_02055144
    mov r0, r4
    bl func_020550fc
    mov r0, r4
    bl func_020550b4
    ldmia sp!, {r4, pc}
