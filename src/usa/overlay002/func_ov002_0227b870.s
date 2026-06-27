; func_ov002_0227b870 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0202b89c
        .extern func_0202b8cc
        .extern func_ov002_0227b084
        .extern func_ov002_0227b8c8
        .global func_ov002_0227b870
        .arm
func_ov002_0227b870:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r5, r3
    mov r3, #0x0
    mov r7, r0
    mov r6, r1
    bl func_ov002_0227b8c8
    mvn r1, #0x0
    cmp r0, r1
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    mov r0, r6
    bl func_0202b89c
    mov r4, r0
    mov r0, r6
    bl func_0202b8cc
    mov r2, r0
    mov r0, r7
    mov r1, r4
    bl func_ov002_0227b084
    mvn r1, #0x0
    cmp r0, r1
    moveq r0, r5
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
