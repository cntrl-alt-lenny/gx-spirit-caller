; func_0206c3f4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0206ca4c
        .extern func_02070ea8
        .extern func_02070f0c
        .extern func_02070f44
        .extern func_02070fe8
        .extern func_02071028
        .global func_0206c3f4
        .arm
func_0206c3f4:
    stmdb sp!, {r4, lr}
    ldr r4, [r0, #0x4]
    mov r0, r4
    bl func_02071028
    ldrsb r0, [r4, #0x73]
    ldr r1, [r4, #0x68]
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    b .L_160
    b .L_138
    b .L_148
    b .L_15c
    b .L_160
    b .L_138
.L_138:
    add r0, r1, #0x20
    bl func_02070f0c
    bl func_02070f44
    b .L_160
.L_148:
    bl func_02070f44
    bl func_02070fe8
    ldr r0, _LIT0
    bl func_02070ea8
    b .L_160
.L_15c:
    bl func_02070fe8
.L_160:
    mov r0, #0x1
    strh r0, [r4, #0x70]
    mov r0, #0x0
    ldmia sp!, {r4, lr}
    bx lr
_LIT0: .word func_0206ca4c
