; func_020766e0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02077d70
        .extern func_02077de4
        .extern func_02077ea4
        .extern func_020783b0
        .extern func_02078424
        .extern func_020784e4
        .extern func_020aace8
        .global func_020766e0
        .arm
func_020766e0:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x14
    mov r5, r2
    add r4, r5, #0x348
    mov r7, r0
    mov r6, r1
    mov r0, r4
    bl func_020784e4
    mov r0, r6
    bl func_020aace8
    mov r2, r0
    mov r1, r6
    mov r0, r4
    bl func_02078424
    mov r0, r4
    mov r1, r5
    mov r2, #0x30
    bl func_02078424
    mov r0, r4
    add r1, r5, #0x34
    mov r2, #0x40
    bl func_02078424
    mov r0, r4
    add r1, sp, #0x0
    bl func_020783b0
    add r4, r5, #0x3fc
    mov r0, r4
    bl func_02077ea4
    mov r1, r5
    mov r0, r4
    mov r2, #0x30
    bl func_02077de4
    mov r0, r4
    add r1, sp, #0x0
    mov r2, #0x14
    bl func_02077de4
    mov r0, r4
    mov r1, r7
    bl func_02077d70
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
