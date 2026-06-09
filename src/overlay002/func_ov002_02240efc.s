; func_ov002_02240efc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_022018cc
        .extern func_ov002_0223de94
        .global func_ov002_02240efc
        .arm
func_ov002_02240efc:
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r2
    mov r6, r0
    cmp r4, #0x5
    mov r5, r1
    movge r0, #0x0
    ldmgeia sp!, {r4, r5, r6, pc}
    mov r1, #0x0
    bl func_ov002_0223de94
    and r0, r0, #0xff
    cmp r5, r0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    mov r0, r6
    mov r1, r5
    mov r2, r4
    bl func_ov002_022018cc
    ldmia sp!, {r4, r5, r6, pc}
