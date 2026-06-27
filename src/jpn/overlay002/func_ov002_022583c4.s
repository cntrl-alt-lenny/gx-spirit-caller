; func_ov002_022583c4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d008c
        .extern func_ov002_021d6780
        .global func_ov002_022583c4
        .arm
func_ov002_022583c4:
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x8
    cmp r0, #0x8
    cmpne r0, #0x9
    bne .L_134
    mov r2, #0x0
    str r2, [sp]
    ldr r0, _LIT0
    str r2, [sp, #0x4]
    ldr ip, [r0, #0xd74]
    ldr r1, [r0, #0xd78]
    ldr r0, [r0, #0xd70]
    mov r3, r2
    add r1, ip, r1
    bl func_ov002_021d6780
.L_134:
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0xd50]
    add sp, sp, #0x8
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022d008c
