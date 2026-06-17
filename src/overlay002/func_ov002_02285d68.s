; func_ov002_02285d68 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd524
        .extern func_ov002_02285984
        .extern func_ov002_022859b4
        .extern func_ov002_022859e8
        .extern func_ov002_02285be0
        .global func_ov002_02285d68
        .arm
func_ov002_02285d68:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0xc8
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1, #0x1cc]
    cmp r0, #0x0
    bne .L_3d4
    add r0, sp, #0x0
    mov r1, r4
    bl func_ov002_02285984
    mov r0, r4
    bl func_ov002_022859e8
    mov r0, r4
    bl func_ov002_02285be0
    ldr r2, _LIT0
    mov r1, r4
    str r0, [r2, #0x1e0]
    mov r3, #0x1
    add r0, sp, #0x0
    str r3, [r2, #0x1cc]
    bl func_ov002_022859b4
.L_3d4:
    ldr r0, _LIT0
    ldr r0, [r0, #0x1e0]
    add sp, sp, #0xc8
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022cd524
